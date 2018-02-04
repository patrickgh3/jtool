use std::cell::{Cell, RefCell};
use std::collections::HashMap;
use std::ffi::{CStr, CString, OsStr};
use std::fs::{OpenOptions, File, copy, remove_file, create_dir};
use std::io::{self, Read, Write, BufRead, BufReader, BufWriter};
use std::os::raw::c_char;
use std::path::Path;

thread_local! {
    static NEXT_ID: Cell<i32> = Cell::new(0);
    static FILES: RefCell<HashMap<i32, BufStream<File>>> = RefCell::new(HashMap::new());

    static LINE: Cell<Option<CString>> = Cell::new(None);
}

#[no_mangle]
pub unsafe extern "C" fn file_text_open_read(path: *const c_char) -> f64 {
    let mut options = OpenOptions::new();
    options.read(true);
    let id = match open(path, options) {
        Ok(id) => id,
        Err(_) => return -1.0,
    };

    id as f64
}

#[no_mangle]
pub unsafe extern "C" fn file_text_open_write(path: *const c_char) -> f64 {
    let mut options = OpenOptions::new();
    options.write(true).create(true);
    let id = match open(path, options) {
        Ok(id) => id,
        Err(_) => return -1.0,
    };

    id as f64
}

#[no_mangle]
pub unsafe extern "C" fn file_text_open_append(path: *const c_char) -> f64 {
    let mut options = OpenOptions::new();
    options.write(true).append(true).create(true);
    let id = match open(path, options) {
        Ok(id) => id,
        Err(_) => return -1.0,
    };

    id as f64
}

unsafe fn open(path: *const c_char, options: OpenOptions) -> io::Result<i32> {
    let path = CStr::from_ptr(path).to_str()
        .map_err(|_| io::ErrorKind::InvalidInput)?;

    let file = options.open(path)?;
    let stream = BufStream::new(file);

    let id = NEXT_ID.with(|next_id| {
        let id = next_id.get();
        next_id.set(id + 1);
        id
    });

    FILES.with(|files| {
        files.borrow_mut().insert(id, stream);
    });

    Ok(id)
}

#[no_mangle]
pub extern "C" fn file_text_close(id: f64) {
    let id = id as i32;

    FILES.with(|files| {
        let mut files = files.borrow_mut();
        files.remove(&id);
    });
}

#[no_mangle]
pub unsafe extern "C" fn file_text_read_string(id: f64) -> *const c_char {
    let id = id as i32;

    let mut line = LINE.with(|line| {
        line.take().unwrap_or_default().into_bytes_with_nul()
    });
    line.clear();

    let _: io::Result<()> = FILES.with(|files| {
        let mut files = files.borrow_mut();
        let file = files.get_mut(&id)
            .ok_or(io::ErrorKind::InvalidInput)?;

        file.read_until(b'\n', &mut line)?;

        Ok(())
    });

    let string = CString::from_vec_unchecked(line);
    let ptr = string.as_ptr();
    LINE.with(|line| {
        line.set(Some(string));
    });

    ptr
}

#[no_mangle]
pub unsafe extern "C" fn file_text_write_string(id: f64, line: *const c_char) -> f64 {
    let line = CStr::from_ptr(line).to_bytes();
    write(id, line)
}

#[no_mangle]
pub unsafe extern "C" fn file_text_writeln(id: f64) -> f64 {

    let mut res: f64 = -1.0;

    // Windows CRLF
    if cfg!(target_os = "windows")
    {
    	res = write(id, &[0x0D, 0x0A]);
    }
    //Macintosh CR
    else if cfg!(target_os = "macos")
    {
    	res = write(id, &[0x0D]);
    }
    // GNU/Linux LR
    else if cfg!(target_os = "linux")
    {
    	res = write(id, &[0x0A]);
    }

    res
}

unsafe fn write(id: f64, bytes: &[u8]) -> f64 {
    let id = id as i32;

    let result: io::Result<f64> = FILES.with(|files| {
        let mut files = files.borrow_mut();
        let file = files.get_mut(&id)
            .ok_or(io::ErrorKind::InvalidInput)?;

        file.write_all(bytes)?;

        Ok(bytes.len() as f64)
    });

    result.unwrap_or(-1.0)
}

#[no_mangle]
pub unsafe extern "C" fn file_copy(from: *const c_char, to: *const c_char) -> f64
{
    copy(OsStr::new(CStr::from_ptr(from).to_str().unwrap()), OsStr::new(CStr::from_ptr(to).to_str().unwrap())).unwrap();

    0.0f64
}

#[no_mangle]
pub unsafe extern "C" fn file_delete(path: *const c_char) -> f64
{
    match remove_file(OsStr::new(CStr::from_ptr(path).to_str().unwrap()))
    {
        Ok(()) => return 1.0,
        Err(_) => return 0.0,
    }
}

#[no_mangle]
pub unsafe extern "C" fn directory_exists(path: *const c_char) -> f64
{
    let result = match Path::new(OsStr::new(CStr::from_ptr(path).to_str().unwrap())).exists()
    {
        true => return 1.0,
        false => return 0.0,
    };
}

#[no_mangle]
pub unsafe extern "C" fn file_exists(path: *const c_char) -> f64
{
    return directory_exists(path);
}

#[no_mangle]
pub unsafe extern "C" fn directory_create(path: *const c_char) -> f64
{
    create_dir(OsStr::new(CStr::from_ptr(path).to_str().unwrap())).unwrap();

    return 0.0;
}

struct BufStream<S: Read + Write> {
    reader: BufReader<InternalBufWriter<S>>,
}

struct InternalBufWriter<S: Read + Write> {
    writer: BufWriter<S>,
}

impl<S: Read + Write> BufStream<S> {
    fn new(stream: S) -> BufStream<S> {
        let writer = InternalBufWriter::new(stream);
        let reader = BufReader::new(writer);
        BufStream { reader }
    }
}

impl<S: Read + Write> InternalBufWriter<S> {
    fn new(stream: S) -> InternalBufWriter<S> {
        let writer = BufWriter::new(stream);
        InternalBufWriter { writer }
    }
}

impl<S: Read + Write> BufRead for BufStream<S> {
    fn fill_buf(&mut self) -> io::Result<&[u8]> {
        self.reader.fill_buf()
    }
    fn consume(&mut self, amt: usize) {
        self.reader.consume(amt)
    }
    fn read_until(&mut self, byte: u8, buf: &mut Vec<u8>) -> io::Result<usize> {
        self.reader.read_until(byte, buf)
    }
    fn read_line(&mut self, string: &mut String) -> io::Result<usize> {
        self.reader.read_line(string)
    }
}

impl<S: Read + Write> Read for BufStream<S> {
    fn read(&mut self, buf: &mut [u8]) -> io::Result<usize> {
        self.reader.read(buf)
    }
}

impl<S: Read + Write> Write for BufStream<S> {
    fn write(&mut self, buf: &[u8]) -> io::Result<usize> {
        self.reader.get_mut().writer.write(buf)
    }
    fn flush(&mut self) -> io::Result<()> {
        self.reader.get_mut().writer.flush()
    }
}

impl<S: Read + Write> Read for InternalBufWriter<S> {
    fn read(&mut self, buf: &mut [u8]) -> io::Result<usize> {
        self.writer.get_mut().read(buf)
    }
}

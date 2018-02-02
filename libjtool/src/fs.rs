use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::cell::RefCell;
use std::collections::HashMap;
use std::fs::File;
use std::io::{BufReader, BufWriter};
use std::any::Any;

thread_local!
{
    static FILES_G: RefCell<HashMap<i32, Box<Any>>> = RefCell::new(HashMap::new());
}

#[no_mangle]
pub extern "C" fn file_text_close(handle: f64)
{
    FILES_G.with
    (
        |f|
        {
            // Close the file
            let mut f = f.borrow_mut();
            let ref mut handle_ref = handle as i32;
            let f = f.get_mut(handle_ref).unwrap();

            if let Some(store) = f.downcast_mut::<FileStoreRead>()
            {
                store.close(handle as usize);
            }

            if let Some(store) = f.downcast_mut::<FileStoreWrite>()
            {
                store.close(handle as usize);
            }
        }
    )
}

pub struct FileStoreRead {
    n: usize,
    read: HashMap<usize, BufReader<File>>,
    unread: HashMap<usize, File>
}

impl FileStoreRead {
    pub fn new() -> FileStoreRead
    {
        FileStoreRead{n: 0, read: HashMap::new(), unread: HashMap::new()}
    }

    pub fn read(&mut self, n: usize) -> String
    {
        use std::io::BufRead;

        if let Some(ref mut reader) = self.read.get_mut(&n)
        {
            let mut result: &mut String = &mut String::new();
            reader.read_line(result).unwrap();

            return result.to_string();
        }

        if let Some(file) = self.unread.remove(&n)
        {
            let reader = BufReader::new(file);
            self.read.insert(n, reader);

            return self.read(n);
        }

        // No Reader Found
        return String::from("");
    }

    pub fn close(&mut self, n: usize)
    {
        self.read.remove(&n);
        self.unread.remove(&n);
    }
}

#[no_mangle]
pub unsafe extern "C" fn file_text_open_read(path: *const c_char) -> f64
{
    FILES_G.with
    (
        |f|
        {
            // Mutabily borrow the HashMap
            let mut f = f.borrow_mut();
            let len = f.len();

            // Store file unread
            let mut store = FileStoreRead::new();

            let nf = File::open(CStr::from_ptr(path).to_str().unwrap()).unwrap();

            let mut ur: HashMap<usize, File> = HashMap::new();
            ur.insert(len as usize, nf);

            store.n = len as usize;
            store.unread = ur;

            f.insert(len as i32, Box::new(store));

            len as f64
        }
    )
}

#[no_mangle]
pub extern "C" fn file_text_read_string(handle: f64) -> *const c_char
{
    FILES_G.with
    (
        |f|
        {
            // Borrow Mutabily and Buffer the resulting File
            let mut f = f.borrow_mut();
            let ref handle_ref = handle as i32;
            let store = f.get_mut(handle_ref).unwrap().downcast_mut::<FileStoreRead>().unwrap();
            let result = store.read(handle as usize);

            // Return the next line
            CString::new(result).unwrap().into_raw()
        }
    )
}

pub struct FileStoreWrite {
    n: usize,
    written: HashMap<usize, BufWriter<File>>,
}

impl FileStoreWrite {
    pub fn new() -> FileStoreWrite
    {
        FileStoreWrite{n: 0, written: HashMap::new()}
    }

    pub fn write(&mut self, n: usize, s: &[u8])
    {
        use std::io::Write;

        if let Some(ref mut writer) = self.written.get_mut(&n)
        {
            let result = writer.write_all(s).unwrap();

            return result;
        }

        // No Writer Found
        return;
    }

    pub fn close(&mut self, n: usize)
    {
        self.written.remove(&n);
    }
}

#[no_mangle]
pub unsafe extern "C" fn file_text_open_write(path: *const c_char) -> f64
{
    FILES_G.with
    (
        |f|
        {
            // Mutabily borrow the HashMap
            let mut f = f.borrow_mut();
            let len = f.len();

            // Store file unwritten
            let mut store = FileStoreWrite::new();

            let nf = File::open(CStr::from_ptr(path).to_str().unwrap()).unwrap();
            let bf = BufWriter::new(nf);

            let mut ur: HashMap<usize, BufWriter<File>> = HashMap::new();
            ur.insert(len as usize, bf);

            store.n = len as usize;
            store.written = ur;

            f.insert(len as i32, Box::new(store));

            len as f64
        }
    )
}

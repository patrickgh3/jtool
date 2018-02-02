use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::cell::RefCell;
use std::collections::HashMap;
use std::io::BufReader;
use std::fs::File;

thread_local!
{
    static FILES_G: RefCell<HashMap<i32, FileStore>> = RefCell::new(HashMap::new());
}

pub struct FileStore {
    n: usize,
    read: HashMap<usize, BufReader<File>>,
    unread: HashMap<usize, File>
}

impl FileStore {
    pub fn new() -> FileStore
    {
        FileStore{n: 0, read: HashMap::new(), unread: HashMap::new()}
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

        return String::from("not found");
    }

    pub fn close(&mut self, n: usize)
    {
        self.read.remove(&n);
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
            let mut store = FileStore::new();

            let nf = File::open(CStr::from_ptr(path).to_str().unwrap()).unwrap();

            let mut ur: HashMap<usize, File> = HashMap::new();
            ur.insert(len as usize, nf);

            store.n = len as usize;
            store.unread = ur;

            f.insert(len as i32, store);

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
            let store = f.get_mut(handle_ref).unwrap();
            let result = store.read(handle as usize);

            // Return the next line
            CString::new(result).unwrap().into_raw()
        }
    )
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
            let ref handle_ref = handle as i32;
            let store = f.get_mut(handle_ref).unwrap();
            store.close(handle as usize);
        }
    )
}

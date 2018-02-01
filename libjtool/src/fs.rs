use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::cell::RefCell;
use std::collections::HashMap;
use std::io::BufReader;
use std::fs::File;

thread_local!
{
    //static FILE_G: RefCell<Option<File>> = RefCell::new(None);
    static FILES_G: RefCell<HashMap<i32, File>> = RefCell::new(HashMap::new())
}

#[no_mangle]
pub unsafe extern "C" fn file_text_open_read(path: *const c_char) -> f64
{
    FILES_G.with
    (
        |f|
        {
            let mut f = f.borrow_mut();
            let len = f.len();
            f.insert(len as i32, File::open(CStr::from_ptr(path).to_str().unwrap()).unwrap());

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
            use std::io::BufRead;

            // Borrow Mutabily and Buffer the resulting File
            let mut f = f.borrow_mut();
            let ref handle_ref = handle as i32;
            let mut reader = BufReader::new(&f[handle_ref]);

            // Get the line
            let mut result = String::new();
            reader.read_line(&mut result).unwrap();

            CString::new(result).unwrap().into_raw()
        }
    )
}

extern crate ini as rust_ini;

use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::cell::RefCell;
use self::rust_ini::ini;

thread_local!
{
    static INI_G: RefCell<ini::Ini> = RefCell::new(ini::Ini::new());
}

#[no_mangle]
pub unsafe extern "C" fn ini_open(path: *const c_char) -> f64
{
    // Load the INI file and store it
    INI_G.with
    (
        |f|
        {
            *f.borrow_mut() = ini::Ini::load_from_file(CStr::from_ptr(path).to_str().unwrap()).unwrap();
        }
    );

    // Return Successful
    return 1.0;
}

#[no_mangle]
pub unsafe extern "C" fn ini_read_string(section: *const c_char, key: *const c_char, default: *const c_char) -> *const c_char
{
    INI_G.with
    (
        |f|
        {
            let f = f.borrow_mut();
            let result = f.get_from(Some(CStr::from_ptr(section).to_str().unwrap()), CStr::from_ptr(key).to_str().unwrap()).unwrap();
            CString::new(result).unwrap().into_raw()
        }
    )
}

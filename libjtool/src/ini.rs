extern crate ini as rust_ini;

use self::rust_ini::ini;
use std::cell::RefCell;
use std::ffi::{CStr, CString, OsStr};
use std::fs::File;
use std::mem::drop;
use std::os::raw::c_char;
use std::path::Path;

thread_local! {
    static INI_G: RefCell<ini::Ini> = RefCell::new(ini::Ini::new());
    static PATH_G: RefCell<String> = RefCell::new(String::new());
}

#[no_mangle]
pub unsafe extern "C" fn ini_open(path: *const c_char) -> f64 {
    if (Path::new(OsStr::new(CStr::from_ptr(path).to_str().unwrap())).exists() == false) {
        File::create(OsStr::new(CStr::from_ptr(path).to_str().unwrap()));
    }

    // Load the INI file and store it
    INI_G.with(|f| {
        PATH_G.with(|p| {
            *f.borrow_mut() =
                ini::Ini::load_from_file(OsStr::new(CStr::from_ptr(path).to_str().unwrap()))
                    .unwrap();
            *p.borrow_mut() = CStr::from_ptr(path).to_str().unwrap().to_string();
        })
    });

    // Return Successful
    return 1.0;
}

#[no_mangle]
pub unsafe extern "C" fn ini_read_string(
    section: *const c_char,
    key: *const c_char,
    default: *const c_char,
) -> *const c_char {
    INI_G.with(|f| {
        let f = f.borrow_mut();
        let result = f
            .get_from(
                Some(CStr::from_ptr(section).to_str().unwrap()),
                CStr::from_ptr(key).to_str().unwrap(),
            )
            .unwrap_or(CStr::from_ptr(default).to_str().unwrap());
        CString::new(result).unwrap().into_raw()
    })
}

#[no_mangle]
pub unsafe extern "C" fn ini_read_real(
    section: *const c_char,
    key: *const c_char,
    default: f64,
) -> f64 {
    INI_G.with(|f| {
        let f = f.borrow_mut();
        let default = &mut default.to_string();
        let result = f
            .get_from(
                Some(CStr::from_ptr(section).to_str().unwrap()),
                CStr::from_ptr(key).to_str().unwrap(),
            )
            .unwrap_or(default);

        let result: f64 = result.parse().unwrap();
        result
    })
}

#[no_mangle]
pub unsafe extern "C" fn ini_write_string(
    section: *const c_char,
    key: *const c_char,
    value: *const c_char,
) -> f64 {
    INI_G.with(|f| {
        PATH_G.with(|p| {
            // Borrow Mutabily and set Key Value
            let mut conf = f.borrow_mut();
            conf.with_section(Some(CStr::from_ptr(section).to_str().unwrap()).to_owned())
                .set(
                    CStr::from_ptr(key).to_str().unwrap(),
                    CStr::from_ptr(value).to_str().unwrap(),
                );

            // Write to the file
            let path = &*p.borrow_mut();
            let ospath = OsStr::new(&path);
            conf.write_to_file(ospath).unwrap();

            // Return N/A
            0.0
        })
    })
}

#[no_mangle]
pub unsafe extern "C" fn ini_write_real(
    section: *const c_char,
    key: *const c_char,
    value: f64,
) -> f64 {
    INI_G.with(|f| {
        PATH_G.with(|p| {
            // Borrow Mutabily and set Key Value
            let mut conf = f.borrow_mut();
            conf.with_section(Some(CStr::from_ptr(section).to_str().unwrap()).to_owned())
                .set(CStr::from_ptr(key).to_str().unwrap(), value.to_string());

            // Write to the file
            let path = &*p.borrow_mut();
            let ospath = OsStr::new(&path);
            conf.write_to_file(ospath).unwrap();

            // Return N/A
            0.0
        })
    })
}

#[no_mangle]
pub unsafe extern "C" fn ini_close(path: *const c_char) -> *const c_char {
    // Retrieve the INI file from memory
    INI_G.with(|f| {
        let mut conf = &*f.borrow_mut();
        let mut result = String::new();

        // Deallocate by dropping
        drop(conf);

        // Return the INI String
        CString::new(result).unwrap().into_raw()
    })
}

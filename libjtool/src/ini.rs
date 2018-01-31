extern crate ini as rust_ini;

use std::cell::RefCell;
use self::rust_ini::ini;

thread_local!
{
    static FILE_G: RefCell<ini::Ini> = RefCell::new(ini::Ini::new());
}

#[no_mangle]
pub extern "C" fn ini_open(path: &str) -> f32
{
    // Load the INI file and store it
    FILE_G.with
    (
        |f|
        {
            *f.borrow_mut() = ini::Ini::load_from_file(path).unwrap();
        }
    );

    // Return Successful
    return 1.0;
}

#[no_mangle]
pub extern "C" fn ini_read_string(section: &str, key: &str, default: &str) -> String
{
    FILE_G.with
    (
        |f|
        {
            String::from(f.borrow_mut().get_from(Some(section), key).unwrap())
        }
    )
}

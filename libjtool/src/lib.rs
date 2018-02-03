#![crate_type = "lib"]
mod ini;
pub use self::ini::ini_open;
pub use self::ini::ini_read_string;
pub use self::ini::ini_write_string;
pub use self::ini::ini_close;

mod fs;
pub use self::fs::file_text_open_read;
pub use self::fs::file_text_read_string;
pub use self::fs::file_text_open_write;
pub use self::fs::file_text_write_string;
pub use self::fs::file_text_writeln;
pub use self::fs::file_text_open_append;
pub use self::fs::file_text_close;
pub use self::fs::file_copy;
pub use self::fs::file_delete;
pub use self::fs::file_exists;
pub use self::fs::directory_exists;
pub use self::fs::directory_create;

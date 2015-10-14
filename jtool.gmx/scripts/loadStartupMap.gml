var filename = prefix_project_path_if_needed('startup.jmap')

if not FS_file_exists(filename) {
    var f = FS_file_text_open_write(filename)
    FS_file_text_write_string(f,'jtool|1.0.0|inf:0|dot:0|px:40u8g00000000|py:40ubg00000000|ps:1|objects:-h01h01g01f0-g0kg0')
    FS_file_text_close(f)
}
loadMap(filename)

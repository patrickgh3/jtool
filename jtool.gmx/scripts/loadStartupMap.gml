var filename = 'startup.jmap'

if not file_exists(filename) {
    var f = file_text_open_write(filename)
    file_text_write_string(f,'jtool|1.2.0|inf:0|dot:0|sav:1|bor:0|px:40u8g00000000|py:40ubg00000000|ps:1|objects:-h01h01g01f0-g0kg0')
    file_text_close(f)
}
global.shouldresetloadedmapname = true
loadMap(filename)

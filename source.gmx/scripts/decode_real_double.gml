// from http://www.gmlscripts.com/script/encode_real_double
// slightly modified to read a string of 64 bits instead of raw bytes.

/// decode_real_double(str)
//
//  Returns a real value decoded from the given string of
//  raw bytes in IEEE 754 double precision format.
//
//      str     8-byte in IEEE 754 double precision format, string
//
/// GMLscripts.com/license
{
    var str, S, E, M, byte, n;
    str = argument0;
    var i;
    for (i = 0; i < 8; i += 1) {
        //byte[i] = ord(string_char_at(str,8 - i));
        byte[i] = 0
        for (var j=0; j<8; j+=1) {
            byte[i] += real(string_char_at(str,(7-i)*8+j+1)) * (128>>j)
        }
    }
    S = 1 - 2*((byte[7] & $80) > 0);
    i = 0;
    M = 0;
    while (i <= 51) {
        if (byte[i div 8] & (1<<(i mod 8)) > 0) {
            M += 1;
        }
        M /= 2;
        i += 1;
    }
    i = 62;
    E = 0;
    while (i > 51) {
        E *= 2;
        if (byte[i div 8] & (1<<(i mod 8)) > 0) {
            E += 1;
        }
        i -= 1;
    }
    if (E == 0) {
        n = S * M * power(2, -1022);
    }
    else {
        n = S * (M + 1) * power(2, E - 1023);
    }
    return n;
}

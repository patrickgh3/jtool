// from http://www.gmlscripts.com/script/encode_real_double
// slightly modified to create a string of 64 bits instead of raw bytes.

/// encode_real_double(n)
//
//  Returns a string of raw bytes representing the given
//  number encoded in IEEE 754 double precision format.
//
//      n           number, real
//
/// GMLscripts.com/license
{
    var n, str, c, byte, E, M;
    n = argument0;
    if (n == 0) {
        return string_repeat(chr(0),8);
    }
    byte[0] = 0;
    byte[7] = 0;
    if (n < 0) {
        n *= -1;
        byte[7] = byte[7] | $80;
    }
    E = floor(log2(n));
    M = n / power(2,E) - 1;
    E += 1023;
    var i;
    i = 0;
    while (i < 11) {
        if (i < 4) {
            byte[6] = byte[6] | ((E & (1<<i)) << 4);
        } else {
            byte[7] = byte[7] | ((E & (1<<i)) >> 4);
        }
        i += 1;
    }
    i = 51;
    while (i >= 0) {
        M *= 2;
        if (M >= 1) {
            byte[i div 8] = byte[i div 8] | (1<<(i mod 8));
            M -= 1;
        }
        i -= 1;
    }
    str = "";
    for (i = 7; i >= 0; i -= 1) {
        //str += chr(byte[i]);
        for (var j=0; j<8; j+=1) {
            str += string((byte[i] & (128>>j)) != 0)
        }
    }
    return str;
}

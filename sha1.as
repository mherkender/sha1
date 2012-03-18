package {
  import flash.utils.ByteArray;

  public function sha1(input:String):String {
    var byteInput:ByteArray = new ByteArray();
    byteInput.endian = "bigEndian";
    byteInput.writeUTFBytes(input);

    var originalLength:uint = byteInput.length;

    // sha-1 requires a single bit be appended to the input
    byteInput.writeByte(0x80);

    // sha-1 adds a 64-bit integer that has the size
    // BUT enough zeros need to be added so that they'll be at the end of a chunk
    for (var i:uint = Math.ceil((byteInput.length + 8) / 64) * 64 - byteInput.length - 8; i > 0; --i) {
      byteInput.writeByte(0x00);
    }

    // append the original size of the input
    // the size is in bits, not bytes, so we have to do some bit-shifting to fit them
    byteInput.writeUnsignedInt(originalLength >>> 29);
    byteInput.writeUnsignedInt(originalLength << 3);

    // set up initial variables
    var h0:int = 0x67452301;
    var h1:int = -0x10325477;
    var h2:int = -0x67452302;
    var h3:int = 0x10325476;
    var h4:int = -0x3c2d1e10;
    
    for (i = 0, byteInput.position = 0; i < byteInput.length; i += 64) {
      // set up variables for this chunk
      var a:int = h0;
      var b:int = h1;
      var c:int = h2;
      var d:int = h3;
      var e:int = h4;

      // this does all the heavy processing on the input
      var w00:int = byteInput.readInt(); e += ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + 0x5A827999 + w00; b = (b << 30) | (b >>> 2);
      var w01:int = byteInput.readInt(); d += ((e << 5) | (e >>> 27)) + ((a & b) | ((~a) & c)) + 0x5A827999 + w01; a = (a << 30) | (a >>> 2);
      var w02:int = byteInput.readInt(); c += ((d << 5) | (d >>> 27)) + ((e & a) | ((~e) & b)) + 0x5A827999 + w02; e = (e << 30) | (e >>> 2);
      var w03:int = byteInput.readInt(); b += ((c << 5) | (c >>> 27)) + ((d & e) | ((~d) & a)) + 0x5A827999 + w03; d = (d << 30) | (d >>> 2);
      var w04:int = byteInput.readInt(); a += ((b << 5) | (b >>> 27)) + ((c & d) | ((~c) & e)) + 0x5A827999 + w04; c = (c << 30) | (c >>> 2);
      var w05:int = byteInput.readInt(); e += ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + 0x5A827999 + w05; b = (b << 30) | (b >>> 2);
      var w06:int = byteInput.readInt(); d += ((e << 5) | (e >>> 27)) + ((a & b) | ((~a) & c)) + 0x5A827999 + w06; a = (a << 30) | (a >>> 2);
      var w07:int = byteInput.readInt(); c += ((d << 5) | (d >>> 27)) + ((e & a) | ((~e) & b)) + 0x5A827999 + w07; e = (e << 30) | (e >>> 2);
      var w08:int = byteInput.readInt(); b += ((c << 5) | (c >>> 27)) + ((d & e) | ((~d) & a)) + 0x5A827999 + w08; d = (d << 30) | (d >>> 2);
      var w09:int = byteInput.readInt(); a += ((b << 5) | (b >>> 27)) + ((c & d) | ((~c) & e)) + 0x5A827999 + w09; c = (c << 30) | (c >>> 2);
      var w10:int = byteInput.readInt(); e += ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + 0x5A827999 + w10; b = (b << 30) | (b >>> 2);
      var w11:int = byteInput.readInt(); d += ((e << 5) | (e >>> 27)) + ((a & b) | ((~a) & c)) + 0x5A827999 + w11; a = (a << 30) | (a >>> 2);
      var w12:int = byteInput.readInt(); c += ((d << 5) | (d >>> 27)) + ((e & a) | ((~e) & b)) + 0x5A827999 + w12; e = (e << 30) | (e >>> 2);
      var w13:int = byteInput.readInt(); b += ((c << 5) | (c >>> 27)) + ((d & e) | ((~d) & a)) + 0x5A827999 + w13; d = (d << 30) | (d >>> 2);
      var w14:int = byteInput.readInt(); a += ((b << 5) | (b >>> 27)) + ((c & d) | ((~c) & e)) + 0x5A827999 + w14; c = (c << 30) | (c >>> 2);
      var w15:int = byteInput.readInt(); e += ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + 0x5A827999 + w15; b = (b << 30) | (b >>> 2);
      w00 ^= w13 ^ w08 ^ w02; d += ((e << 5) | (e >>> 27)) + ((a & b) | ((~a) & c)) + 0x5A827999 + (w00 = (w00 << 1) | (w00 >>> 31)); a = (a << 30) | (a >>> 2);
      w01 ^= w14 ^ w09 ^ w03; c += ((d << 5) | (d >>> 27)) + ((e & a) | ((~e) & b)) + 0x5A827999 + (w01 = (w01 << 1) | (w01 >>> 31)); e = (e << 30) | (e >>> 2);
      w02 ^= w15 ^ w10 ^ w04; b += ((c << 5) | (c >>> 27)) + ((d & e) | ((~d) & a)) + 0x5A827999 + (w02 = (w02 << 1) | (w02 >>> 31)); d = (d << 30) | (d >>> 2);
      w03 ^= w00 ^ w11 ^ w05; a += ((b << 5) | (b >>> 27)) + ((c & d) | ((~c) & e)) + 0x5A827999 + (w03 = (w03 << 1) | (w03 >>> 31)); c = (c << 30) | (c >>> 2);
      w04 ^= w01 ^ w12 ^ w06; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + 0x6ED9EBA1 + (w04 = (w04 << 1) | (w04 >>> 31)); b = (b << 30) | (b >>> 2);
      w05 ^= w02 ^ w13 ^ w07; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) + 0x6ED9EBA1 + (w05 = (w05 << 1) | (w05 >>> 31)); a = (a << 30) | (a >>> 2);
      w06 ^= w03 ^ w14 ^ w08; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) + 0x6ED9EBA1 + (w06 = (w06 << 1) | (w06 >>> 31)); e = (e << 30) | (e >>> 2);
      w07 ^= w04 ^ w15 ^ w09; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) + 0x6ED9EBA1 + (w07 = (w07 << 1) | (w07 >>> 31)); d = (d << 30) | (d >>> 2);
      w08 ^= w05 ^ w00 ^ w10; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) + 0x6ED9EBA1 + (w08 = (w08 << 1) | (w08 >>> 31)); c = (c << 30) | (c >>> 2);
      w09 ^= w06 ^ w01 ^ w11; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + 0x6ED9EBA1 + (w09 = (w09 << 1) | (w09 >>> 31)); b = (b << 30) | (b >>> 2);
      w10 ^= w07 ^ w02 ^ w12; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) + 0x6ED9EBA1 + (w10 = (w10 << 1) | (w10 >>> 31)); a = (a << 30) | (a >>> 2);
      w11 ^= w08 ^ w03 ^ w13; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) + 0x6ED9EBA1 + (w11 = (w11 << 1) | (w11 >>> 31)); e = (e << 30) | (e >>> 2);
      w12 ^= w09 ^ w04 ^ w14; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) + 0x6ED9EBA1 + (w12 = (w12 << 1) | (w12 >>> 31)); d = (d << 30) | (d >>> 2);
      w13 ^= w10 ^ w05 ^ w15; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) + 0x6ED9EBA1 + (w13 = (w13 << 1) | (w13 >>> 31)); c = (c << 30) | (c >>> 2);
      w14 ^= w11 ^ w06 ^ w00; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + 0x6ED9EBA1 + (w14 = (w14 << 1) | (w14 >>> 31)); b = (b << 30) | (b >>> 2);
      w15 ^= w12 ^ w07 ^ w01; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) + 0x6ED9EBA1 + (w15 = (w15 << 1) | (w15 >>> 31)); a = (a << 30) | (a >>> 2);
      w00 ^= w13 ^ w08 ^ w02; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) + 0x6ED9EBA1 + (w00 = (w00 << 1) | (w00 >>> 31)); e = (e << 30) | (e >>> 2);
      w01 ^= w14 ^ w09 ^ w03; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) + 0x6ED9EBA1 + (w01 = (w01 << 1) | (w01 >>> 31)); d = (d << 30) | (d >>> 2);
      w02 ^= w15 ^ w10 ^ w04; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) + 0x6ED9EBA1 + (w02 = (w02 << 1) | (w02 >>> 31)); c = (c << 30) | (c >>> 2);
      w03 ^= w00 ^ w11 ^ w05; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + 0x6ED9EBA1 + (w03 = (w03 << 1) | (w03 >>> 31)); b = (b << 30) | (b >>> 2);
      w04 ^= w01 ^ w12 ^ w06; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) + 0x6ED9EBA1 + (w04 = (w04 << 1) | (w04 >>> 31)); a = (a << 30) | (a >>> 2);
      w05 ^= w02 ^ w13 ^ w07; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) + 0x6ED9EBA1 + (w05 = (w05 << 1) | (w05 >>> 31)); e = (e << 30) | (e >>> 2);
      w06 ^= w03 ^ w14 ^ w08; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) + 0x6ED9EBA1 + (w06 = (w06 << 1) | (w06 >>> 31)); d = (d << 30) | (d >>> 2);
      w07 ^= w04 ^ w15 ^ w09; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) + 0x6ED9EBA1 + (w07 = (w07 << 1) | (w07 >>> 31)); c = (c << 30) | (c >>> 2);
      w08 ^= w05 ^ w00 ^ w10; e += ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) - 0x70E44324 + (w08 = (w08 << 1) | (w08 >>> 31)); b = (b << 30) | (b >>> 2);
      w09 ^= w06 ^ w01 ^ w11; d += ((e << 5) | (e >>> 27)) + ((a & b) | (a & c) | (b & c)) - 0x70E44324 + (w09 = (w09 << 1) | (w09 >>> 31)); a = (a << 30) | (a >>> 2);
      w10 ^= w07 ^ w02 ^ w12; c += ((d << 5) | (d >>> 27)) + ((e & a) | (e & b) | (a & b)) - 0x70E44324 + (w10 = (w10 << 1) | (w10 >>> 31)); e = (e << 30) | (e >>> 2);
      w11 ^= w08 ^ w03 ^ w13; b += ((c << 5) | (c >>> 27)) + ((d & e) | (d & a) | (e & a)) - 0x70E44324 + (w11 = (w11 << 1) | (w11 >>> 31)); d = (d << 30) | (d >>> 2);
      w12 ^= w09 ^ w04 ^ w14; a += ((b << 5) | (b >>> 27)) + ((c & d) | (c & e) | (d & e)) - 0x70E44324 + (w12 = (w12 << 1) | (w12 >>> 31)); c = (c << 30) | (c >>> 2);
      w13 ^= w10 ^ w05 ^ w15; e += ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) - 0x70E44324 + (w13 = (w13 << 1) | (w13 >>> 31)); b = (b << 30) | (b >>> 2);
      w14 ^= w11 ^ w06 ^ w00; d += ((e << 5) | (e >>> 27)) + ((a & b) | (a & c) | (b & c)) - 0x70E44324 + (w14 = (w14 << 1) | (w14 >>> 31)); a = (a << 30) | (a >>> 2);
      w15 ^= w12 ^ w07 ^ w01; c += ((d << 5) | (d >>> 27)) + ((e & a) | (e & b) | (a & b)) - 0x70E44324 + (w15 = (w15 << 1) | (w15 >>> 31)); e = (e << 30) | (e >>> 2);
      w00 ^= w13 ^ w08 ^ w02; b += ((c << 5) | (c >>> 27)) + ((d & e) | (d & a) | (e & a)) - 0x70E44324 + (w00 = (w00 << 1) | (w00 >>> 31)); d = (d << 30) | (d >>> 2);
      w01 ^= w14 ^ w09 ^ w03; a += ((b << 5) | (b >>> 27)) + ((c & d) | (c & e) | (d & e)) - 0x70E44324 + (w01 = (w01 << 1) | (w01 >>> 31)); c = (c << 30) | (c >>> 2);
      w02 ^= w15 ^ w10 ^ w04; e += ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) - 0x70E44324 + (w02 = (w02 << 1) | (w02 >>> 31)); b = (b << 30) | (b >>> 2);
      w03 ^= w00 ^ w11 ^ w05; d += ((e << 5) | (e >>> 27)) + ((a & b) | (a & c) | (b & c)) - 0x70E44324 + (w03 = (w03 << 1) | (w03 >>> 31)); a = (a << 30) | (a >>> 2);
      w04 ^= w01 ^ w12 ^ w06; c += ((d << 5) | (d >>> 27)) + ((e & a) | (e & b) | (a & b)) - 0x70E44324 + (w04 = (w04 << 1) | (w04 >>> 31)); e = (e << 30) | (e >>> 2);
      w05 ^= w02 ^ w13 ^ w07; b += ((c << 5) | (c >>> 27)) + ((d & e) | (d & a) | (e & a)) - 0x70E44324 + (w05 = (w05 << 1) | (w05 >>> 31)); d = (d << 30) | (d >>> 2);
      w06 ^= w03 ^ w14 ^ w08; a += ((b << 5) | (b >>> 27)) + ((c & d) | (c & e) | (d & e)) - 0x70E44324 + (w06 = (w06 << 1) | (w06 >>> 31)); c = (c << 30) | (c >>> 2);
      w07 ^= w04 ^ w15 ^ w09; e += ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) - 0x70E44324 + (w07 = (w07 << 1) | (w07 >>> 31)); b = (b << 30) | (b >>> 2);
      w08 ^= w05 ^ w00 ^ w10; d += ((e << 5) | (e >>> 27)) + ((a & b) | (a & c) | (b & c)) - 0x70E44324 + (w08 = (w08 << 1) | (w08 >>> 31)); a = (a << 30) | (a >>> 2);
      w09 ^= w06 ^ w01 ^ w11; c += ((d << 5) | (d >>> 27)) + ((e & a) | (e & b) | (a & b)) - 0x70E44324 + (w09 = (w09 << 1) | (w09 >>> 31)); e = (e << 30) | (e >>> 2);
      w10 ^= w07 ^ w02 ^ w12; b += ((c << 5) | (c >>> 27)) + ((d & e) | (d & a) | (e & a)) - 0x70E44324 + (w10 = (w10 << 1) | (w10 >>> 31)); d = (d << 30) | (d >>> 2);
      w11 ^= w08 ^ w03 ^ w13; a += ((b << 5) | (b >>> 27)) + ((c & d) | (c & e) | (d & e)) - 0x70E44324 + (w11 = (w11 << 1) | (w11 >>> 31)); c = (c << 30) | (c >>> 2);
      w12 ^= w09 ^ w04 ^ w14; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) - 0x359D3E2A + (w12 = (w12 << 1) | (w12 >>> 31)); b = (b << 30) | (b >>> 2);
      w13 ^= w10 ^ w05 ^ w15; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) - 0x359D3E2A + (w13 = (w13 << 1) | (w13 >>> 31)); a = (a << 30) | (a >>> 2);
      w14 ^= w11 ^ w06 ^ w00; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) - 0x359D3E2A + (w14 = (w14 << 1) | (w14 >>> 31)); e = (e << 30) | (e >>> 2);
      w15 ^= w12 ^ w07 ^ w01; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) - 0x359D3E2A + (w15 = (w15 << 1) | (w15 >>> 31)); d = (d << 30) | (d >>> 2);
      w00 ^= w13 ^ w08 ^ w02; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) - 0x359D3E2A + (w00 = (w00 << 1) | (w00 >>> 31)); c = (c << 30) | (c >>> 2);
      w01 ^= w14 ^ w09 ^ w03; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) - 0x359D3E2A + (w01 = (w01 << 1) | (w01 >>> 31)); b = (b << 30) | (b >>> 2);
      w02 ^= w15 ^ w10 ^ w04; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) - 0x359D3E2A + (w02 = (w02 << 1) | (w02 >>> 31)); a = (a << 30) | (a >>> 2);
      w03 ^= w00 ^ w11 ^ w05; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) - 0x359D3E2A + (w03 = (w03 << 1) | (w03 >>> 31)); e = (e << 30) | (e >>> 2);
      w04 ^= w01 ^ w12 ^ w06; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) - 0x359D3E2A + (w04 = (w04 << 1) | (w04 >>> 31)); d = (d << 30) | (d >>> 2);
      w05 ^= w02 ^ w13 ^ w07; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) - 0x359D3E2A + (w05 = (w05 << 1) | (w05 >>> 31)); c = (c << 30) | (c >>> 2);
      w06 ^= w03 ^ w14 ^ w08; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) - 0x359D3E2A + (w06 = (w06 << 1) | (w06 >>> 31)); b = (b << 30) | (b >>> 2);
      w07 ^= w04 ^ w15 ^ w09; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) - 0x359D3E2A + (w07 = (w07 << 1) | (w07 >>> 31)); a = (a << 30) | (a >>> 2);
      w08 ^= w05 ^ w00 ^ w10; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) - 0x359D3E2A + (w08 = (w08 << 1) | (w08 >>> 31)); e = (e << 30) | (e >>> 2);
      w09 ^= w06 ^ w01 ^ w11; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) - 0x359D3E2A + (w09 = (w09 << 1) | (w09 >>> 31)); d = (d << 30) | (d >>> 2);
      w10 ^= w07 ^ w02 ^ w12; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) - 0x359D3E2A + (w10 = (w10 << 1) | (w10 >>> 31)); c = (c << 30) | (c >>> 2);
      w11 ^= w08 ^ w03 ^ w13; e += ((a << 5) | (a >>> 27)) + (b ^ c ^ d) - 0x359D3E2A + (w11 = (w11 << 1) | (w11 >>> 31)); b = (b << 30) | (b >>> 2);
      w12 ^= w09 ^ w04 ^ w14; d += ((e << 5) | (e >>> 27)) + (a ^ b ^ c) - 0x359D3E2A + (w12 = (w12 << 1) | (w12 >>> 31)); a = (a << 30) | (a >>> 2);
      w13 ^= w10 ^ w05 ^ w15; c += ((d << 5) | (d >>> 27)) + (e ^ a ^ b) - 0x359D3E2A + (w13 = (w13 << 1) | (w13 >>> 31)); e = (e << 30) | (e >>> 2);
      w14 ^= w11 ^ w06 ^ w00; b += ((c << 5) | (c >>> 27)) + (d ^ e ^ a) - 0x359D3E2A + (w14 = (w14 << 1) | (w14 >>> 31)); d = (d << 30) | (d >>> 2);
      w15 ^= w12 ^ w07 ^ w01; a += ((b << 5) | (b >>> 27)) + (c ^ d ^ e) - 0x359D3E2A + (w15 = (w15 << 1) | (w15 >>> 31)); c = (c << 30) | (c >>> 2);

      h0 += a;
      h1 += b;
      h2 += c;
      h3 += d;
      h4 += e;
    }

    var result:String = uint(h4).toString(16);
    var zeros:Array = staticZeros;
    if (result.length < 8) {
      result = zeros[8 - result.length] + result;
    }
    result = uint(h3).toString(16) + result;
    if (result.length < 16) {
      result = zeros[16 - result.length] + result;
    }
    result = uint(h2).toString(16) + result;
    if (result.length < 24) {
      result = zeros[24 - result.length] + result;
    }
    result = uint(h1).toString(16) + result;
    if (result.length < 32) {
      result = zeros[32 - result.length] + result;
    }
    result = uint(h0).toString(16) + result;
    return result.length < 40 ? (zeros[40 - result.length] + result) : result;
  }
}

const staticZeros:Array = ["", "0", "00", "000", "0000", "00000", "000000", "0000000"];

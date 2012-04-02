package {
  import flash.utils.ByteArray;

  public function sha1(input:String):String {
    var byteInput:ByteArray = new ByteArray();
    byteInput.endian = "bigEndian";
    byteInput.writeUTFBytes(input);

    var originalLength:uint = byteInput.length;
    var i:uint;

    // sha-1 requires a single bit be appended to the input
    byteInput.writeByte(0x80);

    // sha-1 adds a 64-bit integer that has the size
    // BUT enough zeros need to be added so that they'll be at the end of a chunk
    var zerosNeeded:uint = Math.ceil((byteInput.length + 8) / 64) * 64 - byteInput.length - 8;
    for (i = 0; i < zerosNeeded; i++) {
      byteInput.writeByte(0x00);
    }

    // append the original size of the input
    // the size is in bits, not bytes, so we have to do some bit-shifting to fit them
    byteInput.writeUnsignedInt(originalLength >>> 29);
    byteInput.writeUnsignedInt(originalLength << 3);

    // set up initial variables
    var h0:uint = 0x67452301;
    var h1:uint = 0xEFCDAB89;
    var h2:uint = 0x98BADCFE;
    var h3:uint = 0x10325476;
    var h4:uint = 0xC3D2E1F0;
    
    for (i = 0, byteInput.position = 0; i < byteInput.length; i += 64) {
      // set up variables for this chunk
      var a:uint = h0;
      var b:uint = h1;
      var c:uint = h2;
      var d:uint = h3;
      var e:uint = h4;
      var tmp:uint;

      // this does all the heavy processing on the input
      var w0:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w0; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w1:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w1; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w2:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w2; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w3:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w3; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w4:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w4; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w5:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w5; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w6:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w6; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w7:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w7; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w8:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w8; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w9:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w9; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w10:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w10; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w11:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w11; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w12:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w12; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w13:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w13; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w14:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w14; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w15:uint = byteInput.readUnsignedInt();
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w15; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w0 ^= w13 ^ w8 ^ w2; w0 = (w0 << 1) | (w0 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w0; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w1 ^= w14 ^ w9 ^ w3; w1 = (w1 << 1) | (w1 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w1; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w2 ^= w15 ^ w10 ^ w4; w2 = (w2 << 1) | (w2 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w2; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w3 ^= w0 ^ w11 ^ w5; w3 = (w3 << 1) | (w3 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w3; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w4 ^= w1 ^ w12 ^ w6; w4 = (w4 << 1) | (w4 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w4; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w5 ^= w2 ^ w13 ^ w7; w5 = (w5 << 1) | (w5 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w5; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w6 ^= w3 ^ w14 ^ w8; w6 = (w6 << 1) | (w6 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w6; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w7 ^= w4 ^ w15 ^ w9; w7 = (w7 << 1) | (w7 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w7; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w8 ^= w5 ^ w0 ^ w10; w8 = (w8 << 1) | (w8 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w8; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w9 ^= w6 ^ w1 ^ w11; w9 = (w9 << 1) | (w9 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w9; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w10 ^= w7 ^ w2 ^ w12; w10 = (w10 << 1) | (w10 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w10; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w11 ^= w8 ^ w3 ^ w13; w11 = (w11 << 1) | (w11 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w11; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w12 ^= w9 ^ w4 ^ w14; w12 = (w12 << 1) | (w12 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w12; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w13 ^= w10 ^ w5 ^ w15; w13 = (w13 << 1) | (w13 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w13; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w14 ^= w11 ^ w6 ^ w0; w14 = (w14 << 1) | (w14 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w14; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w15 ^= w12 ^ w7 ^ w1; w15 = (w15 << 1) | (w15 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w15; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w0 ^= w13 ^ w8 ^ w2; w0 = (w0 << 1) | (w0 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w0; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w1 ^= w14 ^ w9 ^ w3; w1 = (w1 << 1) | (w1 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w1; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w2 ^= w15 ^ w10 ^ w4; w2 = (w2 << 1) | (w2 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w2; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w3 ^= w0 ^ w11 ^ w5; w3 = (w3 << 1) | (w3 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w3; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w4 ^= w1 ^ w12 ^ w6; w4 = (w4 << 1) | (w4 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w4; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w5 ^= w2 ^ w13 ^ w7; w5 = (w5 << 1) | (w5 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w5; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w6 ^= w3 ^ w14 ^ w8; w6 = (w6 << 1) | (w6 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w6; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w7 ^= w4 ^ w15 ^ w9; w7 = (w7 << 1) | (w7 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w7; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w8 ^= w5 ^ w0 ^ w10; w8 = (w8 << 1) | (w8 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w8; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w9 ^= w6 ^ w1 ^ w11; w9 = (w9 << 1) | (w9 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w9; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w10 ^= w7 ^ w2 ^ w12; w10 = (w10 << 1) | (w10 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w10; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w11 ^= w8 ^ w3 ^ w13; w11 = (w11 << 1) | (w11 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w11; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w12 ^= w9 ^ w4 ^ w14; w12 = (w12 << 1) | (w12 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w12; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w13 ^= w10 ^ w5 ^ w15; w13 = (w13 << 1) | (w13 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w13; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w14 ^= w11 ^ w6 ^ w0; w14 = (w14 << 1) | (w14 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w14; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w15 ^= w12 ^ w7 ^ w1; w15 = (w15 << 1) | (w15 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w15; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w0 ^= w13 ^ w8 ^ w2; w0 = (w0 << 1) | (w0 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w0; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w1 ^= w14 ^ w9 ^ w3; w1 = (w1 << 1) | (w1 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w1; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w2 ^= w15 ^ w10 ^ w4; w2 = (w2 << 1) | (w2 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w2; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w3 ^= w0 ^ w11 ^ w5; w3 = (w3 << 1) | (w3 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w3; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w4 ^= w1 ^ w12 ^ w6; w4 = (w4 << 1) | (w4 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w4; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w5 ^= w2 ^ w13 ^ w7; w5 = (w5 << 1) | (w5 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w5; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w6 ^= w3 ^ w14 ^ w8; w6 = (w6 << 1) | (w6 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w6; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w7 ^= w4 ^ w15 ^ w9; w7 = (w7 << 1) | (w7 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w7; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w8 ^= w5 ^ w0 ^ w10; w8 = (w8 << 1) | (w8 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w8; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w9 ^= w6 ^ w1 ^ w11; w9 = (w9 << 1) | (w9 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w9; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w10 ^= w7 ^ w2 ^ w12; w10 = (w10 << 1) | (w10 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w10; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w11 ^= w8 ^ w3 ^ w13; w11 = (w11 << 1) | (w11 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w11; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w12 ^= w9 ^ w4 ^ w14; w12 = (w12 << 1) | (w12 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w12; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w13 ^= w10 ^ w5 ^ w15; w13 = (w13 << 1) | (w13 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w13; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w14 ^= w11 ^ w6 ^ w0; w14 = (w14 << 1) | (w14 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w14; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w15 ^= w12 ^ w7 ^ w1; w15 = (w15 << 1) | (w15 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w15; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w0 ^= w13 ^ w8 ^ w2; w0 = (w0 << 1) | (w0 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w0; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w1 ^= w14 ^ w9 ^ w3; w1 = (w1 << 1) | (w1 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w1; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w2 ^= w15 ^ w10 ^ w4; w2 = (w2 << 1) | (w2 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w2; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w3 ^= w0 ^ w11 ^ w5; w3 = (w3 << 1) | (w3 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w3; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w4 ^= w1 ^ w12 ^ w6; w4 = (w4 << 1) | (w4 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w4; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w5 ^= w2 ^ w13 ^ w7; w5 = (w5 << 1) | (w5 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w5; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w6 ^= w3 ^ w14 ^ w8; w6 = (w6 << 1) | (w6 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w6; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w7 ^= w4 ^ w15 ^ w9; w7 = (w7 << 1) | (w7 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w7; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w8 ^= w5 ^ w0 ^ w10; w8 = (w8 << 1) | (w8 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w8; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w9 ^= w6 ^ w1 ^ w11; w9 = (w9 << 1) | (w9 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w9; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w10 ^= w7 ^ w2 ^ w12; w10 = (w10 << 1) | (w10 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w10; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w11 ^= w8 ^ w3 ^ w13; w11 = (w11 << 1) | (w11 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w11; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w12 ^= w9 ^ w4 ^ w14; w12 = (w12 << 1) | (w12 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w12; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w13 ^= w10 ^ w5 ^ w15; w13 = (w13 << 1) | (w13 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w13; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w14 ^= w11 ^ w6 ^ w0; w14 = (w14 << 1) | (w14 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w14; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      w15 ^= w12 ^ w7 ^ w1; w15 = (w15 << 1) | (w15 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w15; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;

      h0 += a;
      h1 += b;
      h2 += c;
      h3 += d;
      h4 += e;
    }

    return intToHex(h0) + intToHex(h1) + intToHex(h2) + intToHex(h3) + intToHex(h4);
  }
}

function intToHex(num:uint):String {
  var result:String = num.toString(16);

  // append zeros
  while (result.length < 8) {
    result = "0" + result;
  }
 
  return result;
}

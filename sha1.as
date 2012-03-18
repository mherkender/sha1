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
      var w16:uint = w13 ^ w8 ^ w2 ^ w0; w16 = (w16 << 1) | (w16 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w16; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w17:uint = w14 ^ w9 ^ w3 ^ w1; w17 = (w17 << 1) | (w17 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w17; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w18:uint = w15 ^ w10 ^ w4 ^ w2; w18 = (w18 << 1) | (w18 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w18; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w19:uint = w16 ^ w11 ^ w5 ^ w3; w19 = (w19 << 1) | (w19 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w19; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w20:uint = w17 ^ w12 ^ w6 ^ w4; w20 = (w20 << 1) | (w20 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w20; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w21:uint = w18 ^ w13 ^ w7 ^ w5; w21 = (w21 << 1) | (w21 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w21; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w22:uint = w19 ^ w14 ^ w8 ^ w6; w22 = (w22 << 1) | (w22 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w22; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w23:uint = w20 ^ w15 ^ w9 ^ w7; w23 = (w23 << 1) | (w23 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w23; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w24:uint = w21 ^ w16 ^ w10 ^ w8; w24 = (w24 << 1) | (w24 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w24; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w25:uint = w22 ^ w17 ^ w11 ^ w9; w25 = (w25 << 1) | (w25 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w25; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w26:uint = w23 ^ w18 ^ w12 ^ w10; w26 = (w26 << 1) | (w26 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w26; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w27:uint = w24 ^ w19 ^ w13 ^ w11; w27 = (w27 << 1) | (w27 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w27; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w28:uint = w25 ^ w20 ^ w14 ^ w12; w28 = (w28 << 1) | (w28 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w28; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w29:uint = w26 ^ w21 ^ w15 ^ w13; w29 = (w29 << 1) | (w29 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w29; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w30:uint = w27 ^ w22 ^ w16 ^ w14; w30 = (w30 << 1) | (w30 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w30; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w31:uint = w28 ^ w23 ^ w17 ^ w15; w31 = (w31 << 1) | (w31 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w31; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w32:uint = w29 ^ w24 ^ w18 ^ w16; w32 = (w32 << 1) | (w32 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w32; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w33:uint = w30 ^ w25 ^ w19 ^ w17; w33 = (w33 << 1) | (w33 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w33; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w34:uint = w31 ^ w26 ^ w20 ^ w18; w34 = (w34 << 1) | (w34 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w34; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w35:uint = w32 ^ w27 ^ w21 ^ w19; w35 = (w35 << 1) | (w35 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w35; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w36:uint = w33 ^ w28 ^ w22 ^ w20; w36 = (w36 << 1) | (w36 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w36; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w37:uint = w34 ^ w29 ^ w23 ^ w21; w37 = (w37 << 1) | (w37 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w37; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w38:uint = w35 ^ w30 ^ w24 ^ w22; w38 = (w38 << 1) | (w38 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w38; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w39:uint = w36 ^ w31 ^ w25 ^ w23; w39 = (w39 << 1) | (w39 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w39; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w40:uint = w37 ^ w32 ^ w26 ^ w24; w40 = (w40 << 1) | (w40 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w40; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w41:uint = w38 ^ w33 ^ w27 ^ w25; w41 = (w41 << 1) | (w41 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w41; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w42:uint = w39 ^ w34 ^ w28 ^ w26; w42 = (w42 << 1) | (w42 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w42; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w43:uint = w40 ^ w35 ^ w29 ^ w27; w43 = (w43 << 1) | (w43 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w43; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w44:uint = w41 ^ w36 ^ w30 ^ w28; w44 = (w44 << 1) | (w44 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w44; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w45:uint = w42 ^ w37 ^ w31 ^ w29; w45 = (w45 << 1) | (w45 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w45; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w46:uint = w43 ^ w38 ^ w32 ^ w30; w46 = (w46 << 1) | (w46 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w46; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w47:uint = w44 ^ w39 ^ w33 ^ w31; w47 = (w47 << 1) | (w47 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w47; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w48:uint = w45 ^ w40 ^ w34 ^ w32; w48 = (w48 << 1) | (w48 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w48; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w49:uint = w46 ^ w41 ^ w35 ^ w33; w49 = (w49 << 1) | (w49 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w49; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w50:uint = w47 ^ w42 ^ w36 ^ w34; w50 = (w50 << 1) | (w50 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w50; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w51:uint = w48 ^ w43 ^ w37 ^ w35; w51 = (w51 << 1) | (w51 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w51; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w52:uint = w49 ^ w44 ^ w38 ^ w36; w52 = (w52 << 1) | (w52 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w52; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w53:uint = w50 ^ w45 ^ w39 ^ w37; w53 = (w53 << 1) | (w53 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w53; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w54:uint = w51 ^ w46 ^ w40 ^ w38; w54 = (w54 << 1) | (w54 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w54; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w55:uint = w52 ^ w47 ^ w41 ^ w39; w55 = (w55 << 1) | (w55 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w55; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w56:uint = w53 ^ w48 ^ w42 ^ w40; w56 = (w56 << 1) | (w56 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w56; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w57:uint = w54 ^ w49 ^ w43 ^ w41; w57 = (w57 << 1) | (w57 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w57; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w58:uint = w55 ^ w50 ^ w44 ^ w42; w58 = (w58 << 1) | (w58 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w58; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w59:uint = w56 ^ w51 ^ w45 ^ w43; w59 = (w59 << 1) | (w59 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w59; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w60:uint = w57 ^ w52 ^ w46 ^ w44; w60 = (w60 << 1) | (w60 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w60; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w61:uint = w58 ^ w53 ^ w47 ^ w45; w61 = (w61 << 1) | (w61 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w61; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w62:uint = w59 ^ w54 ^ w48 ^ w46; w62 = (w62 << 1) | (w62 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w62; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w63:uint = w60 ^ w55 ^ w49 ^ w47; w63 = (w63 << 1) | (w63 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w63; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w64:uint = w61 ^ w56 ^ w50 ^ w48; w64 = (w64 << 1) | (w64 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w64; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w65:uint = w62 ^ w57 ^ w51 ^ w49; w65 = (w65 << 1) | (w65 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w65; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w66:uint = w63 ^ w58 ^ w52 ^ w50; w66 = (w66 << 1) | (w66 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w66; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w67:uint = w64 ^ w59 ^ w53 ^ w51; w67 = (w67 << 1) | (w67 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w67; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w68:uint = w65 ^ w60 ^ w54 ^ w52; w68 = (w68 << 1) | (w68 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w68; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w69:uint = w66 ^ w61 ^ w55 ^ w53; w69 = (w69 << 1) | (w69 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w69; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w70:uint = w67 ^ w62 ^ w56 ^ w54; w70 = (w70 << 1) | (w70 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w70; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w71:uint = w68 ^ w63 ^ w57 ^ w55; w71 = (w71 << 1) | (w71 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w71; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w72:uint = w69 ^ w64 ^ w58 ^ w56; w72 = (w72 << 1) | (w72 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w72; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w73:uint = w70 ^ w65 ^ w59 ^ w57; w73 = (w73 << 1) | (w73 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w73; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w74:uint = w71 ^ w66 ^ w60 ^ w58; w74 = (w74 << 1) | (w74 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w74; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w75:uint = w72 ^ w67 ^ w61 ^ w59; w75 = (w75 << 1) | (w75 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w75; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w76:uint = w73 ^ w68 ^ w62 ^ w60; w76 = (w76 << 1) | (w76 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w76; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w77:uint = w74 ^ w69 ^ w63 ^ w61; w77 = (w77 << 1) | (w77 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w77; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w78:uint = w75 ^ w70 ^ w64 ^ w62; w78 = (w78 << 1) | (w78 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w78; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      var w79:uint = w76 ^ w71 ^ w65 ^ w63; w79 = (w79 << 1) | (w79 >>> 31);
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w79; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;

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

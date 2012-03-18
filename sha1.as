package {
  public function sha1(input:String):String {
    var originalLength:uint = input.length;
    var i:uint;

    // sha-1 requires a single bit be appended to the input
    input += "\x80";

    // sha-1 adds a 64-bit integer that has the size
    // BUT enough zeros need to be added so that they'll be at the end of a chunk
    var zerosNeeded:uint = Math.ceil((input.length + 8) / 64) * 64 - input.length - 8;
    for (i = 0; i < zerosNeeded; i++) {
      input += "\x00";
    }

    // append the original size of the input
    // the size is in bits, not bytes, so we have to do some bit-shifting to fit them
    input += intToStr(originalLength >>> 29) + intToStr(originalLength << 3);

    // set up initial variables
    var h0:uint = 0x67452301;
    var h1:uint = 0xEFCDAB89;
    var h2:uint = 0x98BADCFE;
    var h3:uint = 0x10325476;
    var h4:uint = 0xC3D2E1F0;

    var w:Array = new Array(80);
    
    for (i = 0; i < input.length; i += 64) {
      // set up variables for this chunk
      var j:uint;
      var a:uint = h0;
      var b:uint = h1;
      var c:uint = h2;
      var d:uint = h3;
      var e:uint = h4;
      var tmp:uint;
      
      // take 16 bytes of input and make 80 integers out of it
      for (j = 0; j < 16; j++) {
        w[j] = strToInt(input, i + j * 4);
      }
      for (j = 16; j < 80; j++) {
        tmp = w[j - 3] ^ w[j - 8] ^ w[j - 14] ^ w[j - 16];
        w[j] = (tmp << 1) | (tmp >>> 31);
      }

      // this does all the heavy processing on the input
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[0]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[1]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[2]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[3]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[4]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[5]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[6]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[7]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[8]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[9]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[10]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[11]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[12]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[13]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[14]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[15]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[16]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[17]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[18]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | ((~b) & d)) + e + 0x5A827999 + w[19]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[20]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[21]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[22]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[23]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[24]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[25]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[26]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[27]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[28]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[29]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[30]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[31]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[32]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[33]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[34]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[35]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[36]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[37]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[38]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0x6ED9EBA1 + w[39]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[40]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[41]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[42]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[43]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[44]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[45]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[46]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[47]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[48]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[49]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[50]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[51]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[52]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[53]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[54]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[55]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[56]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[57]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[58]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + ((b & c) | (b & d) | (c & d)) + e + 0x8F1BBCDC + w[59]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[60]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[61]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[62]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[63]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[64]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[65]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[66]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[67]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[68]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[69]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[70]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[71]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[72]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[73]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[74]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[75]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[76]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[77]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[78]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;
      tmp = ((a << 5) | (a >>> 27)) + (b ^ c ^ d) + e + 0xCA62C1D6 + w[79]; e = d; d = c; c = (b << 30) | (b >>> 2); b = a; a = tmp;

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

function strToInt(str:String, start:int = 0):uint {
  return (str.charCodeAt(start) << 24) | (str.charCodeAt(start + 1) << 16) | (str.charCodeAt(start + 2) << 8) | str.charCodeAt(start + 3);
}

function intToStr(num:uint):String {
  return String.fromCharCode((num >>> 24), ((num & 0xff0000) >>> 16), ((num & 0xff00) >>> 8), (num & 0xff));
}

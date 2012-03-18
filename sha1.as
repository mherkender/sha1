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
    
    for (i = 0; i < input.length; i += 64) {
      // set up variables for this chunk
      var w:Array = [];
      var j:uint;
      var a:uint = h0;
      var b:uint = h1;
      var c:uint = h2;
      var d:uint = h3;
      var e:uint = h4;
      
      // take 16 bytes of input and make 80 integers out of it
      for (j = 0; j < 16; j++) {
        w.push(strToInt(input, i + j * 4));
      }
      for (j = 16; j < 80; j++) {
        w.push(leftRotate(w[j - 3] ^ w[j - 8] ^ w[j - 14] ^ w[j - 16], 1));
      }

      // this does all the heavy processing on the input
      for (j = 0; j < 80; j++) {
        // every 20 numbers, the operation changes
        // the differences are stored in these variables
        var f:uint;
        var k:uint;

        if (j < 20) {
          f = (b & c) | ((~b) & d);
          k = 0x5A827999;
        } else if (j < 40) {
          f = b ^ c ^ d;
          k = 0x6ED9EBA1;
        } else if (j < 60) {
          f = (b & c) | (b & d) | (c & d);
          k = 0x8F1BBCDC;
        } else {
          f = b ^ c ^ d;
          k = 0xCA62C1D6;
        }

        var temp:uint = leftRotate(a, 5) + f + e + k + w[j];
        e = d;
        d = c;
        c = leftRotate(b, 30);
        b = a;
        a = temp;
      }

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

function leftRotate(num:uint, shift:uint):uint {
  shift %= 32;
  return (num << shift) | (num >>> (32 - shift));
}

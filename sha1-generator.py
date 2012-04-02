for j in xrange(0, 80):
    if j < 20:
      f = "(b & c) | ((~b) & d)"
      k = 0x5A827999
    elif j < 40:
      f = "b ^ c ^ d"
      k = 0x6ED9EBA1
    elif j < 60:
      f = "(b & c) | (b & d) | (c & d)"
      k = 0x8F1BBCDC
    else:
      f = "b ^ c ^ d"
      k = 0xCA62C1D6
    if j < 16:
      print "var w%s:uint = byteInput.readUnsignedInt();" % j
    else:
      print "w%s ^= w%s ^ w%s ^ w%s; w%s = (w%s << 1) | (w%s >>> 31);" % (j % 16, (j - 3) % 16, (j - 8) % 16, (j - 14) % 16, j % 16, j % 16, j % 16)
    print "tmp = ((a << 5) | (a >>> 27)) + (%s) + e + 0x%08X + w%s; " \
      "e = d; " \
      "d = c; " \
      "c = (b << 30) | (b >>> 2); " \
      "b = a; " \
      "a = tmp;" % (f, k, j % 16)

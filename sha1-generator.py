vars = ["a", "b", "c", "d", "e"]
for j in xrange(0, 80):
    a, b, c, d, e = vars[-j % 5:] + vars[:-j % 5] # rotate var array
    if j < 20:
      f = "(%s & %s) | ((~%s) & %s)" % (b, c, b, d)
      k = 0x5A827999
    elif j < 40:
      f = "%s ^ %s ^ %s" % (b, c, d)
      k = 0x6ED9EBA1
    elif j < 60:
      f = "(%s & %s) | (%s & %s) | (%s & %s)" % (b, c, b, d, c, d)
      k = 0x8F1BBCDC
    else:
      f = "%s ^ %s ^ %s" % (b, c, d)
      k = 0xCA62C1D6
    if j < 16:
      print "var w%02d:uint = byteInput.readUnsignedInt();" % j,
      w_access = "w%02d" % (j % 16)
    else:
      print "w%02d ^= w%02d ^ w%02d ^ w%02d;" % (j % 16, (j - 3) % 16, (j - 8) % 16, (j - 14) % 16),
      w_access = "(w%02d = (w%02d << 1) | (w%02d >>> 31))" % (j % 16, j % 16, j % 16)
    print "%s += ((%s << 5) | (%s >>> 27)) + (%s) + 0x%08X + %s;" % (
      e, a, a, f, k, w_access),
    print "%s = (%s << 30) | (%s >>> 2);" % (b, b, b)

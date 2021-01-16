proc f*(n: cint): seq[cint] =
   for i in 0..n:
      for j in 0..i:
         result.add(j)

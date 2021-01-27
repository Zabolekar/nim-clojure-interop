import strutils, tables

type
   BKind = enum Int, String, List, Dict
   B* = object
      case kind*: BKind:
      of Int:
         i*: int
      of String:
         s*: string
      of List:
         l*: seq[B]
      of Dict:
         d*: Table[string, B]

proc bdecode(start: char): B

proc bdecodeInt(): B = 
   var s = ""
   while true:
      let c = stdin.readChar
      if c == 'e':
         break
      s.add($c)
   return B(kind: Int, i: parseInt(s))

proc bdecodeDict(): B =
   var d = initTable[string, B]()
   while true:
      let c = stdin.readChar
      if c == 'e':
         break
      let key = bdecode(c)
      let value = bdecode(stdin.readChar)
      d[key.s] = value # key is expected to be of kind String
   return B(kind: Dict, d: d)

proc bdecodeList(): B =
   var l = newSeq[B]()
   while true:
      let c = stdin.readChar
      if c == 'e':
         break
      l.add(bdecode(c))
   return B(kind: List, l: l)

proc bdecodeString(start: char): B =
   var len = $start
   while true:
      let c = stdin.readChar
      case c:
      of ':':
         break
      else: # one of '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'
         len.add($c)
   var s = ""
   for i in 1..parseInt(len):
      s.add($stdin.readChar)
   return B(kind: String, s: s)

proc bdecode(start: char): B =
   case start:
   of 'i':
      return bdecodeInt()
   of 'd':
      return bdecodeDict()
   of 'l':
      return bdecodeList()
   else: # one of '0' '1' '2' '3' '4' '5' '6' '7' '8' '9'
      return bdecodeString(start)

proc readInput*(): B =
   return bdecode(stdin.readChar)

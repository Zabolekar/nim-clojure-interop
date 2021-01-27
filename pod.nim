import json, strformat, tables
import readbabashkainput
import implementation

setStdIoUnbuffered()

proc parseArg(raw: string): int =
   let elems = raw.parseJson.getElems
   if elems.len == 1 and elems[0].kind == JInt:
      return getInt(elems[0])
   else:
      return 0 # ignoring possible errors

# handshake:
discard readInput()
# respond with: {"format": "json", "namespaces": [{"name": "pod.aaa.nim", "vars": [{"name": "f"}]}]}
write(stdout, "d6:format4:json10:namespacesld4:name11:pod.aaa.nim4:varsld4:name1:feeeee")

while true:
   let input = readInput().d
   
   let id = input["id"].s

   let arg = parseArg(input["args"].s)
   let result = f(arg.cint) # the actual calculation happens here
   let jsonString = $(%*result)
   
   let output = fmt"d2:id{id.len}:{id}6:statusl4:donee5:value{jsonString.len}:{jsonString}e"
   write(stdout, output)

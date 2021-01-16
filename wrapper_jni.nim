import jnim
import implementation

proc Java_Wrapper_f*(env: JNIEnvPtr, class: JClass, n: jint): jintArray {. cdecl, exportc, dynlib .} =
   let data = f(n)
   let size = data.len.jsize
   result = env.NewIntArray(env, size)
   env.SetIntArrayRegion(env, result, 0.jsize, size, data[0].unsafeAddr)

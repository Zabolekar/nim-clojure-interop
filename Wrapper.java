public class Wrapper {

   public static native int[] f(int n);

   static {
      System.loadLibrary("wrapper_jni");
   }
}

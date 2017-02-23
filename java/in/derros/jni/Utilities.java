package in.derros.jni;

class Utilities {

    private native void printMethod();
    private native boolean trueFalse();
    private native int power(int b, int e);
    private native byte[] returnAByteArray();
    private native String stringManipulator(String s, String[] s1);
    public Utilities() { System.load("/home/alex/Projects/jnitests/build/libjnitests.so"); }

    public void printUtil() { printMethod();  }
    public boolean boolTest() { return trueFalse();  }
    public int pow(int b, int e) {return power(b, e); }
    public byte[] testReturnBytes() { return returnAByteArray(); }
    public String manipulateStrings(String s, String[] s1) { return stringManipulator(s, s1);  }
    public static void main(String[] args) {
        Utilities util = new Utilities();
        util.printUtil();
        System.out.println(util.boolTest() + "\n");
        System.out.println(util.pow(2, 2) + "\n\n");
        byte[] bs = util.testReturnBytes();
        for ( byte b : bs ) { System.out.println("A Byte is: " + b);  }
        System.out.println("THIS IS THE STRING MANIPULATOR!!");
        System.out.println(
                util.manipulateStrings("asdfxvcbiojdasaisdf hello world,,,", args));
    }
}

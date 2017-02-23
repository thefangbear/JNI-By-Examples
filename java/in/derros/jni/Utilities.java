package in.derros.jni;

class Utilities {

    private native void printMethod();
    private native boolean trueFalse();
    private native int power(int b, int e);
    private native byte[] returnAByteArray();
    public Utilities() { System.load("/home/alex/Projects/jnitests/build/libjnitests.so"); }

    public void printUtil() { printMethod();  }
    public boolean boolTest() { return trueFalse();  }
    public int pow(int b, int e) {return power(b, e); }
    public byte[] testReturnBytes() { return returnAByteArray(); }

    public static void main(String[] args) {
        Utilities util = new Utilities();
        util.printUtil();
        System.out.println(util.boolTest() + "\n");
        System.out.println(util.pow(2, 2) + "\n\n");
        byte[] bs = util.testReturnBytes();
        for ( byte b : bs ) { System.out.println("A Byte is: " + b);  }
    }
}

package in.derros.jni;

class Utilities {

    private native void printMethod();
    private native boolean trueFalse();
    private native int power(int b, int e);

    public Utilities() { System.load("/home/alex/Projects/jnitests/build/libjnitests.so"); }

    public void printUtil() { printMethod();  }
    public boolean boolTest() { return trueFalse();  }
    public int pow(int b, int e) {return power(b, e); }

    public static void main(String[] args) {
        Utilities util = new Utilities();
        util.printUtil();
        System.out.println(util.boolTest() + "\n");
        System.out.println(util.pow(2, 2) + "\n\n");
    }
}

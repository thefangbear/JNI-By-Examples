# (Introductory) Java Native Interface Programming, By Examples

## Table of contents
* [Foreword](#foreword)
* [A Written Introduction to Java Native Interface Programming](#a-written-introduction-to-java-native-interface-programming)
    * [Part I: Writing a Java file that interfaces C/C++ Programs](#part-i-writing-a-java-file-that-interfaces-cc-programs)
    * [Part I.2: Generating C/C++ JNI Headers](#part-i2-generating-cc-jni-headers)
    * [Part II: A glimpse into the JNI environment](#part-ii-a-glimpse-into-the-jni-environment)
    * [Finale: Build](#finale-build)
    * [Remarks](#remarks)
* [Author](#author)
* [License](#license)

## Foreword

**Note**: I wrote this in early 2017 because of a need to offload image serialization tasks to C++ from Java (Java's GC,bad
 bad!) But now things may have changed with newer versions of Java 8 and 9. This repository is now seldomly updated, but
 you may still take it as a simple reference guide to get started. JNI is quite simple to program, and the most difficult
 bit of it is to actually load your dynamic library from your jar file. If you're good with C/C++, you shall be quite easily
 bootstrapped after reading some material.
 
**Note 2**: This example also shows you how to use **CMake** to compile your source files for JNI!

This is an examples repository for Java's JNI. The codes are written in C++ and Java, properly demonstrating the correct
way to interact with JNI through tools like `javah` and `javac`. Alternatively, the CMakeLists.txt utilizes CMake to
compile the C++ library along with JNI implementations, and the jnihelper.sh shell script provides decent helper
utilities to rapidly prototype a JNI library.

## A Written Introduction to Java Native Interface Programming

### Part I: Writing a Java file that interfaces C/C++ Programs

Write something like `java/in/derros/jni/Utilities.java`. You can see the `native` keyword describes the functions
and/or methods in C and C++ you want to interface Java with. Great. Now we have a java file. For a file located in a
package, we use 
```
javac path/to/package/name/Class.java
```
to compile. For regular class files, we use
```
javac ClassName.java
```
to compile. After executing the command, you should see a `.class` file located under the same directory the `.java`
source file is in. Great. Now we have a Java classfile.

### Part I.2: Generating C/C++ JNI Headers

Now we have to find a way to plug ourselves into JVM via JNI. This is incredibly easy, we do:
```
javah ClassName
```
or for classes inside packages:
```
javah package.name.ClassName
```
And now you'll find a strangely named (but not utterly random) `.h` header file in the directory you called javah.
Now here's the crucial step: writing the actual implementation according to the header.

### Part II: A glimpse into the JNI environment

A typical header file such as `java/*.h` exists a bunch of oddly shaped C++/C function declarations. However, you'll
have to write the actual implementations yourself in a separate cpp or c file that references the header.
Implementation is complete as long as you write specific implementations for each and every method. After that it's as
easy as building everything into a shared library using cmake (which is really a piece of cake, if you have JVM properly
installed and configured).

A typical JNI function with a void return has a signature like this (for example):

```
JNIEXPORT void JNICALL Java_in_derros_jni_Utilities_printMethod
        (JNIEnv *env, jobject obj)
```
Note that `env` is especially helpful. For C++ guys `env` is a pointer to an instance of a class allocated on the heap
(not exactly true but you can reason like that to help you navigate through) and for C guys the `env` variable is simply
a pointer to a structure passed in, where the structure stores a bunch of function pointers you can use to access a
bunch of JVM internal functions. A decent IDE is recommended here, as it saves you countless amounts of time to make you
peek into these variables yourself, but you also can find sample implementations of functions of different return types
(sometimes even iterator examples) in the sourcecode folder of this project. For the C++ implementation of JNI functions,
you can find in `Utils.cpp` - and for all the java-related header files and class files you can find in the `java/` folder.

Now, time for some examples...

**Example 1: Converting a C++ `vector` to a Java `ByteArray` and return**
```
    jbyteArray __ba = env->NewByteArray(3);
    std::vector<unsigned char> __c_vec(3);
    __c_vec[0] = 0;
    __c_vec[1] = 1;
    __c_vec[2] = 1;
    unsigned char * __c_ptr = __c_vec.data();
    env->SetByteArrayRegion (__ba, 0, 3, reinterpret_cast<jbyte*>(__c_ptr));
    std::cout << "Printing Byte Array members..." << std::endl;
    std::for_each(__c_vec.begin(), __c_vec.end(), [](const char &c) { std::cout << c ; });
    std::cout << std::endl << std::endl;
    return __ba;
```
Note: `env` is provided in every JNI call to C++.

**Example 2: Manipulating Java Strings in C++**

(Well, actually not too accurate. We're copying over the string
as a C `char*`, doing the manipulation, and returning one back)

```
   std::string s = env->GetStringUTFChars(str, (jboolean)false);
    std::cout << "NOW IN NATIVE STRING ENVIRONMENT!!" << std::endl;
    std::cout << "Your caller says: " << s << std::endl;
    std::cout << "Now iterating over the given string array." << std::endl;
    // iterate over
    for(int i = 0; i < env->GetArrayLength(strObj1); i++) {
        std::cout
                << env->GetStringUTFChars((jstring)env->GetObjectArrayElement(strObj1, (jsize)i), (jboolean)false)
                << std::endl;
    }
    s.append("::::::THIS IS APPENDED TEXT!!!! WARNING!!! WARNING!!!! :)");
    return env->NewStringUTF(s.data());
```

**Example 3: Returning a boolean**

This is to show that most of the primitive types are provided by the JNI header files.
For example, a `boolean` is denoted by `jboolean`.
The best way to code is to employ an IDE or use CTags to scan for types in the JNI header file.
```
    std::cout << "BOOL VALUE: 1 (True)" << std::endl;
    jboolean b = 1;
    return b;
```

**A Practical Tip:** Don't be afraid of casting! JNI is amazingly tolerant for casting between C primitive types
and j-prefixed types. However, for most C++-specific objects, some manual labour is needed. A Java `byte` is roughly
equal to a C++ `char`/`unsigned char`.

For **more examples** and getting a general "gist" of JNI to start, view the source code of this repository.

This is about the end of your journey/actually coding/ a JNI application. Good luck!

### Finale: Build

Build is dramatically easy on systems with CMake as CMake provides a default functionality of finding the appropriate
JNI files. To build, type in:
```
mkdir build/
cd build/
cmake ../
make
```
And then you'll see the `libjnitests.so` file shiningly appearing under the `build` directory! For windows guys it's
`libjnitests.dll` and for MacOS guys it's `libjnitests.dylib`, but they're really all the same.

The final steps is really modifying the Java source file for it to load from the appropriate library using `System.load`
or `System.loadLibrary` (with is extra tricky-dicky), and cross your fingers for good luck!
If you have any extra questions (which I'm pretty sure you have) due to the time limits I cannot describe more of the
housekeeping work here. Proceed to `jnihelper.sh` and have a look at the prototypical shell script's implementations.
I'm sure you'll find some inspirations there.

### Remarks

Till now, you should be programming yourself away in JNI. JNI is a content-rich and powerful interface worth exploring.
Happy hacking!

## Author

Copyright &copy; Rui-Jie Fang 2018.

## License

Licensed under the MIT License.

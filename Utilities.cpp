//
// Created by alex on 2/22/17.
//


#include <vector>
#include <algorithm>
#include "Utilities.h"

#include "java/in_derros_jni_Utilities.h"

/*
 * =================IMPLEMENTATION===============
 * Class:     in_derros_jni_Utilities
 * Method:    printMethod
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_in_derros_jni_Utilities_printMethod
        (JNIEnv *env, jobject obj) {
    std::cout << "Native method called. Printing garbage." << std::endl;
}

/*
 * =================IMPLEMENTATION===============
 * Class:     in_derros_jni_Utilities
 * Method:    trueFalse
 * Signature: ()Z
 */
JNIEXPORT jboolean JNICALL Java_in_derros_jni_Utilities_trueFalse
        (JNIEnv *env, jobject obj) {
    std::cout << "BOOL VALUE: 1 (True)" << std::endl;
    jboolean b = 1;
    return b;
}

/*
 * =================IMPLEMENTATION===============
 * Class:     in_derros_jni_Utilities
 * Method:    power
 * Signature: (II)I
 */
JNIEXPORT jint JNICALL Java_in_derros_jni_Utilities_power
        (JNIEnv *env, jobject obj, jint i1, jint i2) {
    int __i1_n = i1;
    int __i2_n = i2;
    return (jint) std::pow(__i1_n, __i2_n);
}

/*
 * ================IMPLEMENTATION================
 * Class:     in_derros_jni_Utilities
 * Method:    returnAByteArray
 * Signature: ()[B
 */
JNIEXPORT jbyteArray JNICALL Java_in_derros_jni_Utilities_returnAByteArray
        (JNIEnv *env, jobject obj) {
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
}

/*
 * ==============IMPLEMENTATION=================
 * Class:     in_derros_jni_Utilities
 * Method:    stringManipulator
 * Signature: (Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_in_derros_jni_Utilities_stringManipulator
        (JNIEnv *env, jobject obj, jstring str, jobjectArray strObj1) {
    std::string s = env->GetStringUTFChars(str, (jboolean)false);
    std::cout << "NOW IN NATIVE STRING ENVIRONMENT!!" << std::endl;
    std::cout << "Your caller says: " << s << std::endl;
    std::cout << "Now iterating over the given string array." << std::endl;
    // iterate over
    for(int i = 0; i < env->GetArrayLength(strObj1); i++) {
        std::cout
                << env->GetStringUTFChars((jstring)env->GetObjectArrayElement(strObj1, (jsize)i), JNI_FALSE)
                << std::endl;
    }
    s.append("::::::THIS IS APPENDED TEXT!!!! WARNING!!! WARNING!!!! :)");
    return env->NewStringUTF(s.data());
}

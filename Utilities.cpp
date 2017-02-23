//
// Created by alex on 2/22/17.
//


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


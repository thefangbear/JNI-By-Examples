#!/bin/bash

NATIVE_ACCESSER_PATH='in/derros/jni/Utils.java'
NATIVE_ACCESSER_CLASS_NAME='in.derros.jni.Utils'
PWD=`pwd`
echo
echo 'Java Native Interface Helper'
echo 'Created by RJ Fang'
echo 'Options: ./jnihelper.sh'
echo '--refresh-header     Refreshes the header'
echo '--build              Tries CMake build'
echo '--execute-java       Tests library'

refresh_header () {

    cd java
    javah $NATIVE_ACCESSER_PATH
    cd ../
    echo "Generation finished."
}

buildj () {

    rm -rf build
    mkdir build
    cd build
    cmake ../
    make
    ls
    cd ../
    echo 'Build finished.'
}

exej () {

    cd java/
    javac $NATIVE_ACCESSER_PATH
    java $NATIVE_ACCESSER_CLASS_NAME -D$PWD/../build
    cd ../

}


if [ $1=='--refresh-header' ]
then
    refresh_header
fi

if [ $1=='--build' ]
then
    buildj
fi

if [ $1=='--execute-java' ]
then
    exej
fi




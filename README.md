# Image Classification Using Tensorflow Lite in Flutter
TensorFlow Lite is a mobile version of TensorFlow for deploying models on mobile devices.

### Installing TensorFlow Lite in Flutter
To use TensorFlow in your Flutter app, you need to install the following packages:

* **tflite_flutter**: allows you to access the native TensorFlow Lite library. When you invoke the methods of tflite_flutter, it calls the corresponding method of the native TensorFlow Lite SDK.

* **tflite_flutter_helper**: enables you to manipulate TensorFlow inputs and outputs. For example, it converts image data to tensor structure. It reduces the effort required to create pre- and post-processing logic for your model.
Open pubspec.yaml and add them in the dependencies section:
```
tflite_flutter: ^0.9.0
tflite_flutter_helper: ^0.3.1
```


**Note**: If you see an error like Class 'TfliteFlutterHelperPlugin' is not abstract and does not implement abstract member public abstract fun onRequestPermissionsResult(p0: Int, p1: Array<(out) String!>, p2: IntArray) it might be related to this issue. 

To work around it, replace the tflite_flutter_helper: ^0.3.1 dependency with the following git call:
```
tflite_flutter_helper:
 git:
  url: https://github.com/filofan1/tflite_flutter_helper.git
  ref: 783f15e5a87126159147d8ea30b98eea9207ac70
```

Then, if you are building for Android, run the installation script below on macOS/Linux:
```
./install.sh 
```
If you’re on Windows, run install.bat instead:
```
install.bat 
```


**1. Copy all these lines on notepad:**

```
@echo off
setlocal enableextensions

cd %~dp0

set TF_VERSION=2.5
set URL=https://github.com/am15h/tflite_flutter_plugin/releases/download/
set TAG=tf_%TF_VERSION%

set ANDROID_DIR=android\app\src\main\jniLibs\
set ANDROID_LIB=libtensorflowlite_c.so

set ARM_DELEGATE=libtensorflowlite_c_arm_delegate.so
set ARM_64_DELEGATE=libtensorflowlite_c_arm64_delegate.so
set ARM=libtensorflowlite_c_arm.so
set ARM_64=libtensorflowlite_c_arm64.so
set X86=libtensorflowlite_c_x86_delegate.so
set X86_64=libtensorflowlite_c_x86_64_delegate.so

SET /A d = 0

:GETOPT
if /I "%1"=="-d" SET /A d = 1

SETLOCAL
if %d%==1 CALL :Download %ARM_DELEGATE% armeabi-v7a
if %d%==1 CALL :Download %ARM_64_DELEGATE% arm64-v8a
if %d%==0 CALL :Download %ARM% armeabi-v7a
if %d%==0 CALL :Download %ARM_64% arm64-v8a
CALL :Download %X86% x86
CALL :Download %X86_64% x86_64
EXIT /B %ERRORLEVEL%

:Download
curl -L -o %~1 %URL%%TAG%/%~1
mkdir %ANDROID_DIR%%~2\
move /-Y %~1 %ANDROID_DIR%%~2\%ANDROID_LIB%
EXIT /B 0

```


**2. Save the file as install.bat and put the file in root directory of your project.**

**3. then run following in terminal**

```
.\install.bat
```


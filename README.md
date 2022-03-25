# LeapXpert Overview
This Project is about automation test for web, api , and mobile

# Set up Env For testing
## 1. Install Python.
We are using Robot Framework for our automation tests.
Cause RF (Robot Framework) is built by python. So we have to install python in our computer.
Python has different of versions: python 2.x.x and python 3.x.x
We dont use python 2.x.x, So please install and use python 3.x.x only.

### Step 1. Check if your computer has 'Python 3.x.x' installed yet or not.
Open cmd and type the command: 'python --version'
if the output is : 'Python 3.x.x' then you already have python 3 installed (skip step 2)
![check if python3 is installed or not](/img/img1.png )

if you see the output like: python is not recognized.... It means you don't have python yet. You need to install.
![check if python3 is installed or not](/img/img2.png )

### Step 2: Download python 3.x.x
Go to this site : https://www.python.org/downloads/windows/
And download version 3.9.12
![download python](/img/img3.png )

### Step 3: How to install and set path for python 3.x.x
go to this site: https://phoenixnap.com/kb/how-to-install-python-3-windows
and follow steps mentioned in the site (but skip step 7 in the site)
![how to install python](/img/img4.png )
![skip step 7](/img/img5.png )


## 2. Install Java 1.8
Cause our testing include mobile automation and we use 'Appium' Framework so that we need to install 'Java' 

### step 1. Download Java 1.8
go to this site: https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html
![download java](/img/img6.png )

### step 2. Install Java and set path
Follow steps in this site to install Java and Set Path : https://phoenixnap.com/kb/install-java-windows

## 3. Install Android Sdk
Cause our testing is mobile app (android) so that we need to install Android Sdk

### Step 1: download and install android sdk
Follow steps in this site to install android sdk: https://www.androidcentral.com/installing-android-sdk-windows-mac-and-linux-tutorial

### Step 2: Import steps , you have to set up path for Android sdk
Go to Environment Variable and create a variable 'ANDROID_HOME' and set the value is the android 'Sdk'
![go to enviroment variable](/img/img7.png )

then you have to update 'Path' by adding more like below pic
![update PATH](/img/img8.png )

run below command to see if you set path for android sdk is correct or not
open cmd and run command: adb devices
and if you see the output like 'List of devices attached' it means you set path correct
![check if android is installed correct](/img/img9.png )

## 4. Set up your android device to run the test 
Please follow steps mentioned in this site: https://www.tektutorialshub.com/android-studio/run-android-app-on-real-device/

## 5. Install Node
RF use the library 'Browser' bases on the framework 'Playwright' to test NodeJS, also due to Appium is build base on Node so that we have to install Node

### step 1: download Node
follow steps mentioned in this site: https://phoenixnap.com/kb/install-node-js-npm-on-windows

### step 2: set path for node
by default, when you install node it will set path for you, if not you have to set path for node
![set path for nodejs](/img/img11.png )

## 6. Install Appium And set path
We need to install Appium for running test on mobile app

### step 1: install appium 
Open cmd and run the command: npm install -g npm@8.5.5
check below pic:
![install appium](/img/img23.png )

To test if install appium is correct, run the command on cmd: appium
if you see output like : Appium version... then you are good to go
![check appium is installed correct](/img/img24.png )

### step 2: set path for variable APPIUM_PATH
first you need to check where is node_module path
Usually, node is installed at this folder on window : C/Users/${username}/AppData/Roaming/npm
![check node location](/img/img25.png )


so we need to create a path with name "APPIUM_PATH" with value Usually, node is installed at this folder on window :  
follow below steps
open env setting
![open env setting](/img/img26.png )

create new variable with name "APPIUM_PATH" and value is the actually location of node
![create variable ](/img/img27.png )


# Prepare Data Testing
After you clone the repository, try to open in any IDE (Eclipse, Pycharm....). But I prefer pycharm.
open project you will see like this:
![project overview](/img/img12.png )

### step 1: update user login : username, password , company , otp of users which you are using to test.
Before you run the test, you have to update some data example username and password of user1, user2 
Related to data user login you have to update the file: {ROOT}/src/users.robot
note: only change the value on the right side, the value on the left side (starts with '$') do not change
![user name , password, otp of login user](/img/img13.png )

### step 2: for web testing, we need to change some value like: url login, run test on headless or not, or which browser we want to use to run the test
you need to update the file : {ROOT}/src/configuration.robot
![update browser variable](/img/img14.png )

### step 3: for mobile, we need to change some value to configure run test on your own mobile.
you need to update the file : {ROOT}/src/configuration_mobile.robot
note: only change platform version and device name. Dont change other value in this file
![update browser variable](/img/img15.png )

to get platform version of device, please check below pic:
![check version of device](/img/img16.png )

how to get device name, please check below pic: (you need to plug your device on the computer first)
![check device name](/img/img17.png )

### step 4: for api testing, we need to update some value like base url, uri of request....
you need to update the file : {ROOT}/src/api.robot
![check configure for api running](/img/img18.png )

### step 5: you need to download the apk file and put it to the folder ${ROOT}/src/mobile/app
note: due to the apk file is too large, then i can not push into repo. so that you have to downlaod manual and put it to above location /src/mobile/app
like below pic
![put apk in this location](/img/img19.png )

# Noted: you should only change the file configuration_mobile only with 2 files: device name and platform. The rest should not change


# How To Run Test
### step 1: Open cmd and go to the Root folder like this: cd {ROOT}/src
![go to root folder](/img/img20.png )

### step 2: run this command to install library: pip3 install -r requirement.txt
![install libraries ](/img/img21.png )

wait until int complete.

### step 3: we have to run this command to download the driver for our chrome: rfbrowser init
like this pic
![install driver](/img/img22.png )

### step 4: run the test case
First our test case files will be located in this folder:
+ {ROOT}/src/test/api: contains test case files for api test
+ {ROOT}/src/test/web: contains test case files for web test
+ {ROOT}/src/test/mobile: contains test case files for mobile test
Check below pic
![test case location](/img/img28.png )

you can check the detail of test case 
ex: test case detail of api : /src/test/api/UserTestSuite.robot
check below pic
![test case detail of api ](/img/img29.png )

or test case detailf of web : /src/test/web/MessageTestsuite.robot
check below pic
![test case detail of api ](/img/img30.png )

It time to run the test case
Make sure you are stay in the folder ${ROOT}/src
open cmd and run the command: robot --outputdir Report ./test
check below pic
![command to run test ](/img/img31.png )


# Check report
After you run the test case , you will see an output folder 'Reports'
In this folder , there are 3 files: output.xml, report.html, log.html
Open the file report.html on the browser to see detail of test case run status.
![report location ](/img/img32.png )

![report location ](/img/img33.png )


### NOTE: due to the apk file is too large I can not upload with source. When you download the source, you will not see the folder /src/main/mobile/app/...apk
### So you need to create a folder name "app" under /src/mobile and put the download file apk to this folder 
![report location ](/img/img34.png )
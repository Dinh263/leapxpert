*** Variables ***
# this file is used for setting mobile app configuration
*** Variables ***
${REMOTE_URL}                      http://localhost:${APPIUM_PORT}/wd/hub    # do not chanage this value
${PLATFORM_NAME}                   Android    #do not change this value
${PLATFORM_VERSION}                8.1    #change this value according to your phone version
${DEVICE_NAME}                     3300f6486b6883b1    #change this value according to your device name, need to run command : adb devices to check your device name
${APK_FILENAME}                    app-qa-release.apk    #plase update this value according to the name of apk file
${APP_PACKAGE}                     com.leapxpert.manager.qa    #do not change this value
${APP_ACTIVITY}                    com.leapxpertapp.MainActivity    #do not change this value
${DRIVER_PATH_CHROME_APPIUM}       ${EMPTY}
${NEWCOMMANDTIMEOUT}               400000
${APPIUM_PORT}                     4724    #chagne this value if you want to run appium in other port number than 4724
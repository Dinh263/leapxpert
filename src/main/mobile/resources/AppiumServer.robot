*** Settings ***
Library           Process
Library           OperatingSystem
Library           String
Library           ../lib/custommobilelibs.py
Resource          ../../../../src/configuration_mobile.robot


*** Keywords ***
Start Appium Server
    [Documentation]    This keyword is used for start appium server automatically.
    Terminate All Current Session
    ${system}=    Evaluate    platform.system()    platform
    ${system}=    Convert To Lower Case    ${system}
    ${window}=    Evaluate    "window" in """${system}"""
    Run Keyword if    '${window}'=='True'    Start Appium On Window
    Run Keyword if     '${window}'!='True'    Start Appium On Mac
    Process Should Be Running    appiumserver
    Sleep    15s


Start Appium On Window
    Start Process    %{APPIUM_PATH}    -p    ${APPIUM_PORT}    shell=True    alias=appiumserver    stdout=${CURDIR}/appium_stdout.txt    stderr=${CURDIR}/appium_stderr.txt

Start Appium On Mac
    Start Process    appium    -p    ${APPIUM_PORT}    shell=True    alias=appiumserver    stdout=${CURDIR}/log/appium_stdout.txt    stderr=${CURDIR}/log/appium_stderr.txt

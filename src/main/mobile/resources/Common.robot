*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../../../../src/configuration_mobile.robot



*** Keywords ***
Open App On Android Device
    [Documentation]    This keyword is used for setting profile for android example: platfrom name, platfrom version, device name, app id, app package , app activity
    ${path}=    Set Variable    ${CURDIR}
    ${path}=    Replace String    ${path}    resources    app    #get path of apk file.
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${path}/${APK_FILENAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    ...    newCommandTimeout=${NEWCOMMANDTIMEOUT}
    ...    adbExecTimeout=${NEWCOMMANDTIMEOUT}

Wait Mobile Element Is Visible And Click
    [Documentation]    This keyword is used for waiting an element is visible and click it on mobile
    [Arguments]    ${p_element}
    Wait Until Element Is Visible    ${p_element}
    Click Element    ${p_element}

Wait Mobile Element Is Visible And Input Text
    [Documentation]    This keyword is used for waiting an element is visible and click it on mobile
    [Arguments]    ${p_element}    ${p_value}
    Wait Until Element Is Visible    ${p_element}
    Input Text    ${p_element}    ${p_value}
*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../screens/WelcomeScreen.robot



*** Keywords ***
Login App Via Mobile Device
    [Documentation]    This keyword is used for login application via mobile app in device
    [Arguments]    ${p_activate_code}    ${p_password}   ${p_otp}
    Click Btn Skip At Welcome Screen
    Set Txt Activation Code At Welcome Screen    ${p_activate_code}
    Set Txt Password Mobile App    ${p_password}
    Click Btn Sign In Mobile App
    Set Txt OTP Login In Mobile App    ${p_otp}
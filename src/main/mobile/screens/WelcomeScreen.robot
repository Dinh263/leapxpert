*** Settings ***
Library            AppiumLibrary    timeout=30s
Library            String
Resource           ../resources/Common.robot


*** Keywords ***
Click Btn Skip At Welcome Screen
    [Documentation]    This keyword is used for clicking the button skip at the welcome screen
    ${btn_skip}=    Set Variable    xpath=//*[@text='Skip']
    Wait Mobile Element Is Visible And Click    ${btn_skip}

Set Txt Activation Code At Welcome Screen
    [Documentation]    This keyword is used for setting the activate code to login
    [Arguments]    ${p_activation_code}
    Wait Until Element Is Visible    xpath=//*[@content-desc='activation_0']
    @{arr_code}=    Split String To Characters    ${p_activation_code}
    FOR    ${INDEX}    IN RANGE     0    10
        ${txt_activate_code}=    Set Variable    xpath=//*[@content-desc='activation_${INDEX}']
        Input Text    ${txt_activate_code}    ${arr_code}[${INDEX}]
    END

Set Txt Password Mobile App
    [Documentation]    This keyword is used for setting password to login on mobile app
    [Arguments]    ${p_password}
    ${txt_password}=    Set Variable    xpath=//*[@content-desc='login_password']
    Wait Mobile Element Is Visible And Input Text    ${txt_password}    ${p_password}

Click Btn Sign In Mobile App
    [Documentation]    This keyword is used for button sign in after inputting password to login on mobile app
    ${btn_sign_in}=    Set Variable    xpath=//*[@text='Sign In']
    Wait Mobile Element Is Visible And Click     ${btn_sign_in}

Set Txt OTP Login In Mobile App
    [Documentation]    This keyword is used for setting the otp code to login in mobile app
    [Arguments]    ${p_otp_code}
    Wait Until Element Is Visible    xpath=//*[@content-desc='otp_0']
    @{arr_code}=    Split String To Characters    ${p_otp_code}
    FOR    ${INDEX}    IN RANGE     0    6
        ${txt_otp_code}=    Set Variable    xpath=//*[@content-desc='otp_${INDEX}']
        Input Text   ${txt_otp_code}    ${arr_code}[${INDEX}]
    END
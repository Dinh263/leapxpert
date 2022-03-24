*** Settings ***
Library           Browser    timeout=30s
Resource          ../resources/WebCommon.robot


*** Keywords ***
Set Txt Company Name At Login Page
    [Documentation]    This keyword is used for setting value 'company name' at the screen login
    [Arguments]    ${p_company_name}
    ${txt_comp_name}=    Set Variable    css=input[placeholder='Company']
    Wait Until Textbox Is Visible And Input Text    ${txt_comp_name}    ${p_company_name}

Click Btn Next At Login Company Page
    [Documentation]    This keyword is used for button 'Next' at the screen login
    ${btn_next}=    Set Variable    css=span[class^='Login_button']
    Wait Until Element Is Visible And Click    ${btn_next}

Set Txt User Name At Login Page
    [Documentation]    This keyword is used for setting value 'user name' at the screen login
    [Arguments]    ${p_username}
    ${txt_uname}=    Set Variable    css=input[placeholder='Username']
    Wait Until Textbox Is Visible And Input Text    ${txt_uname}    ${p_username}

Set Txt Password At Login Page
    [Documentation]    This keyword is used for setting value 'password' at the screen login
    [Arguments]    ${p_password}
    ${txt_pw}=    Set Variable    css=input[placeholder='Password']
    Wait Until Textbox Is Visible And Input Text    ${txt_pw}    ${p_password}

Click Btn Login At Login Page
    [Documentation]    This keyword is used for clicking button 'Login' at the screen login
    ${btn_login}=    Set Variable    css=span[class^='Login_button']
    Wait Until Element Is Visible And Click    ${btn_login}

Set Txt OTP At Login Page
    [Documentation]    This keyword is used for setting value 'OTP' at the screen login
    [Arguments]    ${p_otp}
    ${txt_otp}=    Set Variable    css=div[class^='OTPInput_container']
    Wait For Elements State    ${txt_otp}    visible
    Keyboard Input    insertText    ${p_otp}

Wait Until Page Log In Log Complete
    ${el}=    Set Variable    css=a[class^='ProfileButton_avatar']
    Wait For Elements State    ${el}    visible    timeout=60s

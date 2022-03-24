*** Settings ***
Library             Browser    timeout=30s
Resource            ../pages/LoginPage.robot
Resource            ../resources/WebCommon.robot



*** Keywords ***
Open Browser And Login To Application
    [Documentation]    This keyword is used for login to app with below steps:
    ...    step 1: open browser
    ...    step 2: input company name in the text box and click next button
    ...    step 3: input username and input password and click login button
    [Arguments]    ${p_url}    ${p_company_name}    ${p_username}    ${p_password}    ${p_otp}
    Open Web Application    ${p_url}
    Set Txt Company Name At Login Page    ${p_company_name}
    Click Btn Next At Login Company Page
    Set Txt User Name At Login Page    ${p_username}
    Set Txt Password At Login Page    ${p_password}
    Click Btn Login At Login Page
    Set Txt OTP At Login Page    ${p_otp}
    Wait Until Page Log In Log Complete

Assert User Login Successfully
    ${actual_title}=    Get Title
    ${expected_title}=    Set Variable    Leap Work
    Should Be True    '${actual_title}'=='${expected_title}'    msg=Login not successfully, expected title is '${expected_title}' but actual title is: ${actual_title}


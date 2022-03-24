*** Settings ***
Library           Browser
Resource          ../resources/WebCommon.robot


*** Keywords ***
Click Btn Link Devices
    [Documentation]    this keyword is used for clicking link device button
    ${btn_link_devices}=    Set Variable    css=button[class*='DeviceTab_link']
    Wait Until Element Is Visible And Click    ${btn_link_devices}

Get Lbel Activation Code
    [Documentation]    this keyword is used for getting the activation code at the screen link devices
    ${lbel_activation_code}=    Set Variable     css=div[class*='code-name']
    ${activate_code}=    Wait Until Element Is Visible And Get Text    ${lbel_activation_code}
    [Return]    ${activate_code}




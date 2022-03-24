*** Settings ***
Library           Browser
Resource          ../resources/WebCommon.robot


*** Keywords ***
Click Menu Devices
    [Documentation]    this keyword is used for clicking the menu Devices on the profile Page.
    ${menu_devices}=    Set Variable    xpath=(//*[contains(@class,'Account_button-btn')])[2]
    Wait Until Element Is Visible And Click    ${menu_devices}



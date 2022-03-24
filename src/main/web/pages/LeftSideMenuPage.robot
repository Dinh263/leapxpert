*** Settings ***
Library           Browser
Resource          ../resources/WebCommon.robot


*** Keywords ***
Click Menu User Account On The Left Side Menu
    [Documentation]    this keyword is used for clicking on the image profile on the left side menu
    ${menu_profile}=    Set Variable    css=div[class^='ProfileButton_container'] > div > a
    Wait Until Element Is Visible And Click    ${menu_profile}

Click Menu Chat On The Left Side Menu
    [Documentation]    this keyword is used for clicking on the chat menu on the left side menu
    ${menu_chat}=    Set Variable    css=div[title='Chat']
    Wait Until Element Is Visible And Click    ${menu_chat}
    Wait Until Page Does Not Contain    Please wait for a few seconds
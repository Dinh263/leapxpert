*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../resources/Common.robot

*** Keywords ***
Click btn Chat At The Contact Profile Screen
    [Documentation]    This keyword is used for clicking the button 'Chat' at the screen Contact Profile
    ${btn_chat}=    Set Variable    xpath=//*[@text='Chats']
    Wait Mobile Element Is Visible And Click    ${btn_chat}
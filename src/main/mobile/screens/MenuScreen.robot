*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../resources/Common.robot

*** Keywords ***
Click Menu Contact On The Bottom Screen
    [Documentation]    This keyword is used for clicking the menu 'Contact' at the bottom screen.
    ${menu_contact}=    Set Variable    xpath=//*[@content-desc='bottomTab_contact']
    Wait Mobile Element Is Visible And Click    ${menu_contact}
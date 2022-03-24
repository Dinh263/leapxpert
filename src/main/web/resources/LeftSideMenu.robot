*** Settings ***
Library             Browser    timeout=30s
Resource            ../pages/LeftSideMenuPage.robot
Resource            ../resources/WebCommon.robot



*** Keywords ***
Go To The Account Page Of User
    [Documentation]    This keyword is used for going to the account page of user
    Click Menu User Account On The Left Side Menu

Go To Chat Page Of User
    [Documentation]    This keyword is used for going to the chat page of user
    Click Menu Chat On The Left Side Menu







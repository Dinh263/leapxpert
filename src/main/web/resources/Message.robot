*** Settings ***
Library             Browser    timeout=30s
Resource            ../pages/DevicesPage.robot
Resource            ../pages/ProfilePage.robot
Resource            ../pages/ChatPage.robot
Resource            WebCommon.robot
Resource            LeftSideMenu.robot



*** Keywords ***
Select Chat Room From User
    [Documentation]    This keyword is used for checking if user recieve message correctly
    [Arguments]    ${p_from_user}
    Go To Chat Page Of User
    Click Chat Name Room    ${p_from_user}

Assert Recieve Message Correct
    [Arguments]    ${p_expected_message}
    ${status}    Chat Page Contains Message    ${p_expected_message}
    Should Be True    ${status}==True    msg=User did not receive the message: ${p_expected_message}










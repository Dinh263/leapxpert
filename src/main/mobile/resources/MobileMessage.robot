*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../screens/MenuScreen.robot
Resource           ../screens/ContactScreen.robot
Resource           ../screens/ContactProfileScreen.robot
Resource           ../screens/ChatScreen.robot



*** Keywords ***
Search A Contact In Team And Send Message
    [Documentation]    This keyword is used for search a contact and send a message
    [Arguments]    ${p_contact}    ${p_message}
    Click Menu Contact On The Bottom Screen
    Click Tab Team On The Contact Screen
    Set Txt Search Contact By Name Or Email On The Contact Screen    ${p_contact}
    Click Lbel Found Contact On Result Search    ${p_contact}
    Click btn Chat At The Contact Profile Screen
    Set Txt Chat Message At Chat Screen    ${p_message}
    Click Btn Send Chat Message At The Chat Screen

Assert Send Message Successfully
    [Documentation]    This keyword is used for checking if the send message is shown on the chat screen after you click send button
    [Arguments]   ${p_expected_message}
    ${status}=    Screen Contains Message User Sent    ${p_expected_message}
    Should Be True    ${status}==True    msg=Message use sent ${p_expected_message} did not show on screen.





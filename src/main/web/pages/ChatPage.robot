*** Settings ***
Library           Browser
Resource          ../resources/WebCommon.robot


*** Keywords ***
Click Chat Name Room
    [Arguments]    ${p_room_name}
    [Documentation]    this keyword is used for clicking the chat group with name is the name of user.
    ${chat_room}=    Set Variable    xpath=//div[@data-testid='room-name']/span[contains(@title,'${p_room_name}')]
    Wait Until Element Is Visible And Click    ${chat_room}

Chat Page Contains Message
    [Arguments]    ${p_message}
    ${xpath_el}=    Set Variable    xpath=//span[contains(@class,'MessageItem')]/span[text()='${p_message}']
    ${status}=    Run Keyword And Return Status    Wait For Elements State    ${xpath_el}    visible    timeout=60s
    [Return]    ${status}



*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../resources/Common.robot

*** Keywords ***
Set Txt Chat Message At Chat Screen
    [Arguments]    ${p_message}
    ${txt_input_message}=    Set Variable    xpath=//*[@content-desc='chatDetail_input']
    Wait Mobile Element Is Visible And Input Text    ${txt_input_message}    ${p_message}

Click Btn Send Chat Message At The Chat Screen
    ${btn_send_message}=    Set Variable    xpath=//*[@content-desc='chatDetail_sendMessage']
    Wait Mobile Element Is Visible And Click    ${btn_send_message}

Screen Contains Message User Sent
    [Arguments]    ${p_expected_message}
    Sleep    15s
    ${xpath_el}=    Set Variable    xpath=//*[@text='${p_expected_message}']
    ${status}    Run Keyword And Return Status    Wait Until Page Contains Element    ${xpath_el}    timeout=30s
    [Return]    ${status}


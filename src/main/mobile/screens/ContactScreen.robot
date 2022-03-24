*** Settings ***
Library            AppiumLibrary    timeout=30s
Resource           ../resources/Common.robot

*** Keywords ***
Click Tab Team On The Contact Screen
    [Documentation]    This keyword is used for clicking the tab 'Team' at the Contact screen.
    ${tab_team}=    Set Variable    xpath=//*[@content-desc='tab_teams']
    Wait Mobile Element Is Visible And Click    ${tab_team}

Set Txt Search Contact By Name Or Email On The Contact Screen
    [Documentation]    This keyword is used for setting the search contact values
    [Arguments]    ${p_contact}
    ${txt_search}=    Set Variable    xpath=//*[contains(@text,'Search by name, email')]
    Wait Mobile Element Is Visible And Input Text    ${txt_search}    ${p_contact}

Click Lbel Found Contact On Result Search
    [Documentation]    This keyword is used for clicking on the search result contact found
    [Arguments]    ${p_contact}
    ${lbel_search}=    Set Variable    xpath=//*[contains(@content-desc,'${p_contact}')]
    Wait Mobile Element Is Visible And Click    ${lbel_search}



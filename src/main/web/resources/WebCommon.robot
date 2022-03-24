*** Settings ***
Library             Browser    timeout=30s
Resource            ../../../../src/configuration.robot



*** Keywords ***
Open Web Application
    [Documentation]    This keyword is used for open browser and go to the url
    [Arguments]    ${p_url}
    Open Browser    url=${p_url}    browser=${BROWSER_TYPE}    headless=${HEADLESS}    pause_on_failure=False

Wait Until Textbox Is Visible And Input Text
    [Documentation]    This keyword is used for waiting an element is visible and input text to that element.
    [Arguments]    ${p_element}    ${p_text}
    Wait For Elements State    ${p_element}    visible
    Type Text    ${p_element}    ${p_text}    clear=True

Wait Until Element Is Visible And Click
    [Documentation]    This keyword is used for waiting an element is visible and click on that element.
    [Arguments]    ${p_element}
    Wait For Elements State    ${p_element}    visible
    Click    ${p_element}

Wait Until Element Is Visible And Get Text
    [Documentation]    This keyword is used for waiting an element is visible and get the text of element
    [Arguments]    ${p_element}
    Wait For Elements State    ${p_element}    visible
    ${val}=    Browser.Get Text    ${p_element}
    [Return]    ${val}

Close Application
    [Documentation]    This keyword is used for closing all application
    Close Browser    ALL




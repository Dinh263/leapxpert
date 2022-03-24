*** Settings ***
Library           JSONLibrary
Resource          ../../web/resources/Login.robot


*** Keywords ***
Login And Get Bearer Token
    [Arguments]    ${p_url}    ${p_company_name}    ${p_username}    ${p_password}    ${p_otp}
    Open Browser And Login To Application    ${p_url}    ${p_company_name}    ${p_username}    ${p_password}    ${p_otp}
    ${session_value}=    Local Storage Get Item    session
    ${json}=    Convert String to JSON    ${session_value}
    ${token}=    Get Value From Json    ${json}    $.accessToken
    [Return]    ${token}[0]
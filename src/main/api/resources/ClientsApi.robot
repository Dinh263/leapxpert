*** Settings ***
Documentation     This library contains the keyword of clients api
Library           JSONLibrary
Library           RequestsLibrary

Resource         ../../../api.robot


*** Keywords ***
Make GET Request To Get All Client
    [Documentation]    This keyword is used for send GET request to get all clients information
    [Arguments]    ${p_token}
    Create Session    session    ${BASE_URL}
    ${headers}    Create Dictionary    accept=*/*    Authorization=Bearer ${p_token}
    ${response}    GET On Session    session    ${URI_CLIENT}    headers=${headers}
    [Return]    ${response}

Make GET Request To Get All Client By Id
    [Documentation]    This keyword is used for send GET request to get client by client id
    [Arguments]    ${p_token}    ${p_search_client_id}
    Create Session    session    ${BASE_URL}
    ${headers}    Create Dictionary    accept=*/*    Authorization=Bearer ${p_token}
    ${response}    GET On Session    session    ${URI_CLIENT}/${p_search_client_id}    headers=${headers}
    [Return]    ${response}

Assert Make GET Request To Get All Client Successfully
    [Arguments]    ${p_response_from_api_get_clients}
    ${status_code}=    Set Variable    ${p_response_from_api_get_clients.status_code}
    ${resp_content}=    Set Variable    ${p_response_from_api_get_clients.text}
    Should Be True    ${status_code}==200    msg=Status code return not correct. Expected: 200 but actual: ${status_code}
    ${json}=    convert string to json    ${resp_content}
    ${code}=    get value from json    ${json}    $.code
    ${message}=    get value from json    ${json}    $.message
    Should Be True    ${code}[0]==0    msg=code return is not correct. expected 0 but actual: ${code}[0]
    Should Be True    '${message}[0]'=='Success'    msg=message return is not correct. expected 'Success' but actual: ${message}[0]

Assert Make GET Request To Get All Client By Id Successfully
    [Arguments]    ${p_response_from_api_get_clients}    ${p_expected_client_id}
    ${status_code}=    Set Variable    ${p_response_from_api_get_clients.status_code}
    ${resp_content}=    Set Variable    ${p_response_from_api_get_clients.text}
    Log    ${status_code}
    Log    ${resp_content}
    ${json}=    convert string to json    ${resp_content}
    ${code}=    get value from json    ${json}    $.code
    ${message}=    get value from json    ${json}    $.message
    ${actual_id}=    get value from json    ${json}    $.record.id
    Should Be True    ${code}[0]==0    msg=code return is not correct. expected 0 but actual: ${code}[0]
    Should Be True    '${message}[0]'=='Success'    msg=message return is not correct. expected 'Success' but actual: ${message}[0]
    Should Be True    '${actual_id}[0]'=='${p_expected_client_id}'    msg=client id return is not correct. expected '${p_expected_client_id}' but actual: ${actual_id}[0]




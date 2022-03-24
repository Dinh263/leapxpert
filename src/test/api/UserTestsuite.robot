*** Settings ***
Documentation        This test suite is about testing the feature 'User' example search user, get user....

Library              Browser
Resource             ../../../src/configuration_api.robot
Resource             ../../main/api/resources/CommonApi.robot
Resource             ../../main/api/resources/ClientsApi.robot

Suite Setup    Get Token Of User
Suite Teardown    Close Browser    ALL

*** Test Cases ***
As a user I want to get all clients via api successfully
    [Documentation]    This keyword is used for sending api to get all clients information
    [Tags]    api    client
    ${response}=    Make GET Request To Get All Client    ${BEARERTOKEN}
    Assert Make GET Request To Get All Client Successfully    ${response}

As a user I want to search client by client id via api successfully
    [Documentation]    This keyword is used for sending api to get client by client id information
    [Tags]    api    client
    ${client_id}=    Set Variable    60408137fba7e773f5ae0ebe
    ${response}=    Make GET Request To Get All Client By Id    ${BEARERTOKEN}    ${client_id}
    Assert Make GET Request To Get All Client By Id Successfully    ${response}    ${client_id}


*** Keywords ***
Get Token Of User
    ${url}=    Set Variable    ${WEB_URL_DEV}
    ${company_name}=    Set Variable    ${COMPANY_NAME_DEV}
    ${user}=    Set Variable    ${USER_DEV}
    ${pass}=    Set Variable    ${PASSWORD_DEV}
    ${otp}=    Set Variable    ${OTP_DEV}
    ${token}=    Login And Get Bearer Token    ${url}    ${company_name}    ${user}    ${pass}    ${otp}
    Set Global Variable    ${BEARERTOKEN}    ${token}
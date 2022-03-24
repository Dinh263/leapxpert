*** Settings ***
Documentation        This test suite is about testing the feature 'Message'

Library              FakerLibrary
Library              AppiumLibrary    timeout=30s

Resource             ../../main/web/resources/Login.robot
Resource             ../../main/web/resources/LeftSideMenu.robot
Resource             ../../main/web/resources/Account.robot
Resource             ../../main/web/resources/Message.robot

Resource             ../../main/mobile/resources/AppiumServer.robot
Resource             ../../main/mobile/resources/Common.robot
Resource             ../../main/mobile/resources/MobileLogin.robot
Resource             ../../main/mobile/resources/MobileMessage.robot

Resource             ../../../src/configuration.robot
Resource             ../../../src/users.robot


Test Teardown    Run Keywords    Close Browser    ALL    AND    Quit Application    #teardown, close all browser.

*** Test Cases ***
As a user I want to check user can send message via mobile and receive message via web successfully
    [Documentation]    This test is used for checking function send message between 2 users
    ...    step 1: user01 login to web app and assert user login successfully by checking title is correct or not
    ...    step 2: user01 generate activate code
    ...    step 3: user01 login on mobile with username, pass and activate code.
    ...    step 4: user01 send random massage to user02
    ...    step 5: user02 login on web with correct username and pass
    ...    step 6: user02 go to chat group and check receive correct message.
    [Tags]    message    web    mobile
    ${url}=    Set Variable    ${WEB_URL}
    ${company_name}=    Set Variable    ${COMPANY_NAME}
    ${user_01}=    Set Variable    ${USERNAME_01}
    ${pass_01}=    Set Variable    ${PASSWORD_01}
    ${user_02}=    Set Variable    ${USERNAME_02}
    ${pass_02}=    Set Variable    ${PASSWORD_02}
    ${otp}=    Set Variable    ${OTP}
    ${rd_number}=    Random Int    min=3    max=7    #generate random number between 3 and 7
    ${message}=    Sentence    ${rd_number}    #generate sentence with rd_number words
    #${message}=    Set Variable    Ball give account.
    Open Browser And Login To Application    ${url}    ${company_name}    ${user_01}    ${pass_01}    ${otp}
    Assert User Login Successfully
    Go To The Account Page Of User
    ${activate_code}=    Request The QR Code From Web
    #${activate_code}=    Set Variable    gnmckaikmu
    Start Appium Server
    Open App On Android Device
    Login App Via Mobile Device    ${activate_code}    ${pass_01}    ${otp}
    Search A Contact In Team And Send Message    ${user_02}    ${message}
    Assert Send Message Successfully    ${message}
    Open Browser And Login To Application    ${url}    ${company_name}    ${user_02}    ${pass_02}    ${otp}
    Assert User Login Successfully
    Select Chat Room From User    ${user_01}
    Assert Recieve Message Correct    ${message}
*** Settings ***
Library             Browser    timeout=30s
Resource            ../pages/DevicesPage.robot
Resource            ../pages/ProfilePage.robot
Resource            ../resources/WebCommon.robot



*** Keywords ***
Request The QR Code From Web
    [Documentation]    This keyword is used for request qr code to be able to login via mobile app.
    Click Menu Devices
    Click Btn Link Devices
    ${activation_code}=    Get Lbel Activation Code
    [Return]    ${activation_code}






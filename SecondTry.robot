Language: En

*** Keywords ***
Login
    Input Text    id=user-name    ${name}
    Input Password    id=password    ${password}
    Click Button    id=login-button

GoToHomePage
    Open Browser    ${url}    edge

*** Variables ***
${url}            https://www.saucedemo.com
${name}           standard_user
${password}       secret_sauce
@{CREDENTIALS}    standard_user    secret_sauce
&{LOGIN}          Username=standard_user    Password=secret_sauce

*** Settings ***
Suite Setup       GoToHomePage
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Test Cases ***
TC_002
    SeleniumLibrary.Open Browser    https://www.selenium.dev/    chrome
    Close Browser
    SeleniumLibrary.Open Browser    https://www.selenium.dev/    edge
    Close Browser
    Log To Console    Operation ended succesfully

TC_003_Login
    [Tags]    Login
    Open Browser    ${url}    edge
    Input Text    id=user-name    ${name}
    Input Password    id=password    ${password}
    Click Button    id=login-button
    Close Browser

TC_004_LoginCredentilas
    [Tags]    Login
    Open Browser    ${url}    edge
    Input Text    id=user-name    ${CREDENTIALS}[0]
    Input Password    id=password    ${CREDENTIALS}[1]
    Click Button    id=login-button
    Close Browser

TC_005_Login_Dict
    [Tags]    Login
    Open Browser    ${url}    edge
    Input Text    id=user-name    ${LOGIN}[Username]
    Input Password    id=password    ${LOGIN}[Password]
    Click Button    id=login-button
    Close Browser
    Log To Console    %{username} ran this on %{os}

TC_006_Login_Keyword
    [Tags]    Login
    [Setup]    Log To Console    TC_006 Started
    Open Browser    ${url}    edge
    Login
    Close Browser
    [Teardown]    Log To Console    TC_006 Completed

TC_007_Login_SetupAndTeardown
    [Tags]    Login
    [Setup]    Log To Console    TC_007 Started
    Login
    [Teardown]    Log To Console    TC_007 Completed

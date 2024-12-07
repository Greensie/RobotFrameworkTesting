Language: En

*** Variables ***
${url}            https://www.saucedemo.com
${name}           standard_user
${password}       secret_sauce
@{CREDENTIALS}    standard_user    secret_sauce
&{LOGIN}          Username=standard_user    Password=secret_sauce

*** Settings ***
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

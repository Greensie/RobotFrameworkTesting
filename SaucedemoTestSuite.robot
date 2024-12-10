Language: En

*** Keywords ***
GoToHomePage
    Open Browser    ${url}    edge

Login
    Input Text    id=user-name    ${name}
    Input Password    id=password    ${password}
    Click Button    id=login-button

Logout
    Click Element    id=react-burger-menu-btn
    Sleep    1 seconds
    Click Element    id=logout_sidebar_link

*** Variables ***
${url}            https://www.saucedemo.com
${name}           standard_user
${password}       secret_sauce
@{CREDENTIALS}    standard_user    problem_user    error_user    visual_user
&{LOGIN}          Username=standard_user    Password=secret_sauce
@{CREDENTIALSBAD}    locked_out_user    performance_glitch_user

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC_001_Login_standard_user
    [Tags]    Login
    GoToHomePage
    Login
    Logout
    Close Browser

TC_002_Login_All_possible_users
    GoToHomePage
    FOR    ${item}    IN    @{CREDENTIALS}
        Input Text    id=user-name    ${item}
        Input Password    id=password    ${password}
        Click Button    id=login-button
        Click Element    id=react-burger-menu-btn
        Sleep    1 seconds
        Click Element    id=logout_sidebar_link
        Sleep    3 seconds
    END
    Close Browser

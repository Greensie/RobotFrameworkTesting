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

LoginBadUser
    Input Text    id=user-name    ${bad_user}
    Input Password    id=password    ${password}
    Click Button    id=login-button

*** Variables ***
${url}            https://www.saucedemo.com
${name}           standard_user
${password}       secret_sauce
@{CREDENTIALS}    standard_user    problem_user    error_user    visual_user
&{LOGIN}          Username=standard_user    Password=secret_sauce
${bad_user}       locked_out_user

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
    [Tags]    Login
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

TC_003_Login_Fail
    [Tags]    Login
    GoToHomePage
    Run Keyword And Expect Error    Epic sadface: Sorry, this user has been locked out.    LoginBadUser
    Close Browser

TC_004_AddingItemToCart
    [Tags]    Cart
    GoToHomePage
    Login
    Sleep    1 second
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    1 second
    Click Element    id=shopping_cart_container
    Sleep    1 second
    Click Button    id=remove-sauce-labs-backpack
    Logout

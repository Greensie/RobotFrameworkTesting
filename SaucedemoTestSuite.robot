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

GoToHomePage2
    Open Browser    ${url}    Chrome

LoginAllGoodUsers
    FOR    ${item}    IN    @{CREDENTIALS}
        Input Text    id=user-name    ${item}
        Input Password    id=password    ${password}
        Click Button    id=login-button
        Click Element    id=react-burger-menu-btn
        Sleep    1 seconds
        Click Element    id=logout_sidebar_link
        Sleep    3 seconds
    END

AddTestItemToCart
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    1 second
    Click Element    id=shopping_cart_container
    Sleep    1 second
    Click Button    id=remove-sauce-labs-backpack

*** Variables ***
${url}            https://www.saucedemo.com
${name}           standard_user
${password}       secret_sauce
@{CREDENTIALS}    standard_user    problem_user    error_user    visual_user
&{LOGIN}          Username=standard_user    Password=secret_sauce
${bad_user}       locked_out_user
@{browsers}       edge    chrome
@{items_add}      id=add-to-cart-sauce-labs-backpack    id=add-to-cart-sauce-labs-bike-light    id=add-to-cart-sauce-labs-bolt-t-shirt    id=add-to-cart-sauce-labs-fleece-jacket    id=add-to-cart-sauce-labs-onesie
@{items_remove}    id=remove-sauce-labs-backpack    id=remove-sauce-labs-bike-light    id=remove-sauce-labs-onesie    id=remove-sauce-labs-bolt-t-shirt    id=remove-sauce-labs-fleece-jacket
@{TestUser}       John    Doe    00-999

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC_001_LoginStandardUser
    [Documentation]    Test Objective: Check login procedure of standard user
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login standard_user
    ...    3. Logout
    ...    4. Close Edge
    ...    5. Open Open https://www.saucedemo.com/ on Edge
    ...    6. Login standard_user
    ...    7. Logout
    ...    8. Close Chrome
    ...
    ...    Pass Criteria: Succesfull login and logout procedure of standard user on both browsers.
    [Tags]    Login    Chrome    Edge
    FOR    ${web}    IN    @{browsers}
    Open Browser    ${url}    ${web}
    Login
    Logout
    Close Browser
    END

TC_002_LoginAllPossibleUsers_Edge
    [Documentation]    Test Objective: Check login procedure of all working users
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login user from list
    ...    3. Logout user
    ...    4. Take next user from list and repeat step 2 and 3
    ...    5. Close browser
    ...
    ...
    ...    Pass Criteria: Succesfull login and logout procedure of all users on Edge.
    [Tags]    Login    Edge
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

TC_002_LoginAllPossibleUsers_Chrome
    [Documentation]    Test Objective: Check login procedure of all working users
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login user from list
    ...    3. Logout user
    ...    4. Take next user from list and repeat step 2 and 3
    ...    5. Close browser
    ...
    ...    Pass Criteria: Succesfull login and logout procedure of all users on Edge.
    [Tags]    Login    Chrome
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

TC_003_LoginFail
    [Documentation]    INCOMPLETE
    ...    Test Objective: Check login procedure of all not working users
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login user from list
    ...    3. Check if error appears
    ...    4. Take next user from list and repeat step 2 and 3
    ...    5. Close browser
    ...
    ...    Pass Criteria: Lack of succesfull login and of wrong users on both browsers.
    [Tags]    Login
    GoToHomePage
    Run Keyword And Expect Error    Epic sadface: Sorry, this user has been locked out.    LoginBadUser
    Close Browser

TC_004_AddingItemToCart_Edge
    [Documentation]    Test Objective: Check adding an item to a cart and removing it
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login standard_user
    ...    3. Add item to a cart
    ...    4. Enter cart
    ...    5. Remove item from cart
    ...    6. Logout
    ...    7. Close browser
    ...
    ...    Pass Criteria: Succesfull adding and removing an item from cart.
    [Tags]    Cart    Edge
    GoToHomePage
    Login
    Sleep    1 second
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    1 second
    Click Element    id=shopping_cart_container
    Sleep    1 second
    Click Button    id=remove-sauce-labs-backpack
    Logout
    Close Browser

TC_004_AddingItemToCart_Chrome
    [Documentation]    Test Objective: Check adding an item to a cart and removing it
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Chrome
    ...    2. Login standard_user
    ...    3. Add item to a cart
    ...    4. Enter cart
    ...    5. Remove item from cart
    ...    6. Logout
    ...    7. Close browser
    ...
    ...
    ...    Pass Criteria: Succesfull adding and removing an item from cart.
    [Tags]    Cart    Chrome
    GoToHomePage
    Login
    Sleep    1 second
    Click Button    id=add-to-cart-sauce-labs-backpack
    Sleep    1 second
    Click Element    id=shopping_cart_container
    Sleep    1 second
    Click Button    id=remove-sauce-labs-backpack
    Logout
    Close Browser

TC_005_AddingMultipleItemsToCart_Edge
    [Documentation]    Test Objective: Check adding multiple items to a cart and removing them
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login standard_user
    ...    3. Add items to a cart
    ...    4. Enter cart
    ...    5. Remove items from cart
    ...    6. Logout
    ...    7. Close browser
    ...
    ...    Pass Criteria: Succesfull adding and removing items from cart.
    [Tags]    Login    Cart    Edge
    GoToHomePage
    Login
    FOR    ${item}    IN    @{items_add}
        Click Button    ${item}
        Sleep    1 second
    END
    Click Element    id=shopping_cart_container
    Sleep    1 second
    FOR    ${item}    IN    @{items_remove}
        Click Button    ${item}
        Sleep    1 second
    END
    Logout
    Close Browser

TC_005_AddingMultipleItemsToCart_Chrome
    [Documentation]    Test Objective: Check adding multiple items to a cart and removing them
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Chrome
    ...    2. Login standard_user
    ...    3. Add items to a cart
    ...    4. Enter cart
    ...    5. Remove items from cart
    ...    6. Logout
    ...    7. Close browser
    ...
    ...    Pass Criteria: Succesfull adding and removing items from cart.
    [Tags]    Login    Cart    Chrome
    GoToHomePage
    Login
    FOR    ${item}    IN    @{items_add}
        Click Button    ${item}
        Sleep    1 second
    END
    Click Element    id=shopping_cart_container
    Sleep    1 second
    FOR    ${item}    IN    @{items_remove}
        Click Button    ${item}
        Sleep    1 second
    END
    Logout
    Close Browser

TC_006_OrderingAnItem_Edge
    [Documentation]    Test Objective: Check ordering procedure
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login standard_user
    ...    3. Add item to a cart
    ...    4. Enter cart
    ...    5. Enter checkout
    ...    6. Enter user data
    ...    7. Finish checkout
    ...    8. Go back to main page
    ...    9. Logout
    ...    10. Close browser
    ...
    ...    Pass Criteria: Succesfull processing whole ordering process
    [Tags]    Cart    Order
    GoToHomePage
    Login
    AddTestItemToCart
    Sleep    500ms
    Click Element    id=shopping_cart_container
    Sleep    500ms
    Click Button    id=checkout
    Sleep    500ms
    Input Text    id=first-name    ${TestUser}[0]
    Input Text    id=last-name    ${TestUser}[1]
    Input Text    id=postal-code    ${TestUser}[2]
    Sleep    500ms
    Click Button    id=continue
    Sleep    500ms
    Click Button    id=finish
    Sleep    500ms
    Click Button    id=back-to-products
    Logout
    Close Browser

TC_006_OrderingAnItem_Chrome
    [Documentation]    Test Objective: Check ordering procedure
    ...
    ...    Test steps:
    ...    1. Open https://www.saucedemo.com/ on Edge
    ...    2. Login standard_user
    ...    3. Add item to a cart
    ...    4. Enter cart
    ...    5. Enter checkout
    ...    6. Enter user data
    ...    7. Finish checkout
    ...    8. Go back to main page
    ...    9. Logout
    ...    10. Close browser
    ...
    ...    Pass Criteria: Succesfull processing whole ordering process
    [Tags]    Cart    Order    Chrome
    GoToHomePage
    Login
    AddTestItemToCart
    Sleep    500ms
    Click Element    id=shopping_cart_container
    Sleep    500ms
    Click Button    id=checkout
    Sleep    500ms
    Input Text    id=first-name    ${TestUser}[0]
    Input Text    id=last-name    ${TestUser}[1]
    Input Text    id=postal-code    ${TestUser}[2]
    Sleep    500ms
    Click Button    id=continue
    Sleep    500ms
    Click Button    id=finish
    Sleep    500ms
    Click Button    id=back-to-products
    Logout
    Close Browser

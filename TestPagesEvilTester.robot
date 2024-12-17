Language: En

*** Keywords ***
GoToTestPageEdge
    Open Browser    ${url}    edge

GoToTestPageChrome
    Open Browser    ${url}    Chrome

GoToMainPageAndCloseBrowser
    Click Element    href=index.html
    Close Browser

CleanupAfterTest
    Close Browser

*** Variables ***
${url}            https://testpages.eviltester.com/styled/index.html

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TC_001_BasicWebPageExample
    [Documentation]    Test Objective: Get text from a website paragraphs
    ...
    ...    Test steps:
    ...    [SETUP] Open Browser and enter https://testpages.eviltester.com/styled/index.html
    ...    1. Click element Basic Web Page Example
    ...    2. Check if paragraph 1 contains correct massage
    ...    3. Check if paragraph 2 contains correct massage
    ...    [TEARDOWN]
    ...    Clowse Browser
    [Setup]    GoToTestPageEdge
    Click Element    id=basicpagetest
    Element Should Contain    id=para1    A paragraph of text
    Element Should Contain    id=para2    Another paragraph of text
    [Teardown]    CleanupAfterTest

TC_002_ElementAttributesExamples
    [Documentation]    Test Objective: Get text from a website paragraphs
    ...
    ...    Test steps:
    ...    [SETUP] Open Browser and enter https://testpages.eviltester.com/styled/index.html
    ...    1. Click element Element Attributes Examples
    ...    2. Check if paragraph 1 contains correct massage
    ...    3. Check if paragraph 2 contains correct massage
    ...    4. Click shown button
    ...    5. Check if paragraph 3 contains correct massage
    ...    [TEARDOWN]
    ...    Clowse Browser
    [Setup]    GoToTestPageEdge
    Click Element    id=elementattributestest
    Element Should Contain    id=domattributes    This paragraph has attributes
    Element Should Contain    id=jsattributes    This paragraph has dynamic attributes
    Click Button    class=styled-click-button
    Element Should Contain    id=jsautoattributes    This paragraph has dynamic attributes
    [Teardown]    CleanupAfterTest

TC_003_FindByPlayground
    [Documentation]    Test Objective: Get text from a website paragraphs by name and id and compare them
    ...
    ...    Test steps:
    ...    [SETUP] Open Browser and enter https://testpages.eviltester.com/styled/index.html
    ...    1. Click element Find By Playground - Locator Examples
    ...    2. Check if paragraph entered by id contains text
    ...    3. Check if paragraph entered by name contains text
    ...    [TEARDOWN]
    ...    Clowse Browser
    [Setup]    GoToTestPageEdge
    Click Element    id=findbytest
    ${p}=    Set Variable    //div[@id='div1']/p[@id='p
    ${pName}=    Set Variable    //div[@id='div1']/p[@name='pName
    ${closure}=    Set Variable    ']
    FOR    ${i}    IN RANGE    1    25
    ${id}=    Set Variable    ${p}${i}${closure}
    ${name}=    Set Variable    ${pName}${i}${closure}
    ${str1}=    Get Text    ${id}
    ${str2}=    Get Text    ${name}
    END
    [Teardown]    CleanupAfterTest

TC_004_HTMLTABLETag
    [Documentation]    Test Objective: Get text from a HTML table displayed on page
    ...
    ...    Test steps:
    ...    [SETUP] Open Browser and enter https://testpages.eviltester.com/styled/index.html
    ...    1. Click element HTML TABLE Tag
    ...    2. Check num of rows
    ...    3. Get data for name and amount
    ...    4. Log the data
    ...    5. Reapeat steps 3-4 for every row found
    ...    [TEARDOWN]
    ...    Clowse Browser
    [Setup]    GoToTestPageEdge
    Click Element    id=tablestest
    Sleep    300ms
    ${rows}=    Get Element Count    //table[@id='mytable']/tbody/tr
    ${locator}=    Set Variable    //table[@id='mytable']/tbody/tr[
    ${name_closing}=    Set Variable    ]/td[1]
    ${amount_closing}=    Set Variable    ]/td[2]
    FOR    ${row_num}    IN RANGE    2    ${rows+1}
        ${name_cell}=    Get Text    ${locator}${row_num}${name_closing}
        ${amount_cell}=    Get Text    ${locator}${row_num}${amount_closing}
        Log    ${row_num}
        Log    ${name_cell}
        Log    ${amount_cell}
    END
    [Teardown]    CleanupAfterTest

TC_004_HTMLTABLETagBasic
    [Documentation]    Test Objective: Get text from a HTML table displayed on page - Debug Tool
    ...
    ...    Test steps:
    ...    [SETUP] Open Browser and enter https://testpages.eviltester.com/styled/index.html
    ...    1. Click element HTML TABLE Tag
    ...    2. Check num of rows
    ...    3. Get name data
    ...    4. Get amount data
    ...    5. Log the data
    ...    [TEARDOWN]
    ...    Clowse Browser
    [Setup]    GoToTestPageEdge
    Click Element    id=tablestest
    Sleep    300ms
    ${rows}=    Get Element Count    //table[@id='mytable']/tbody/tr
    ${name_cell}=    Get Text    //table[@id='mytable']/tbody/tr[2]/td[1]
    ${amount_cell}=    Get Text    //table[@id='mytable']/tbody/tr[2]/td[2]
    Log    ${name_cell}
    Log    ${amount_cell}
    [Teardown]    CleanupAfterTest

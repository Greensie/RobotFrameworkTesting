Language: En

*** Keywords ***
GoToTestPageEdge
    Open Browser    ${url}    edge

GoToTestPageEdgeChrome
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
    [Setup]    GoToTestPageEdge
    Click Element    id=basicpagetest
    Sleep    500 ms
    Element Should Contain    id=para1    A paragraph of text
    Element Should Contain    id=para2    Another paragraph of text
    [Teardown]    CleanupAfterTest

TC_002_ElementAttributesExamples
    [Setup]    GoToTestPageEdge
    Click Element    id=elementattributestest
    Sleep    100 ms
    Element Should Contain    id=domattributes    This paragraph has attributes
    Element Should Contain    id=jsattributes    This paragraph has dynamic attributes
    Click Button    class=styled-click-button
    Element Should Contain    id=jsautoattributes    This paragraph has dynamic attributes
    [Teardown]    CleanupAfterTest

TC_003_FindByPlayground
    [Setup]    GoToTestPageEdge
    Click Element    id=findbytest
    ${p}=    Set Variable    //div[@id='div1']/p[@id='p
    ${pName}=    Set Variable    //div[@id='div1']/p[@name='pName
    ${closure}=    Set Variable    ']
    FOR    ${i}    IN RANGE    1    25
    ${id}=    Set Variable    ${p}${i}${closure}
    ${name}=    Set Variable    ${pName}${i}${closure}
    Sleep    100 ms
    ${str1}=    Get Text    ${id}
    ${str2}=    Get Text    ${name}
    IF    '${str1}==${str2}'
        Log To Console    OK${str1}
    END
    END

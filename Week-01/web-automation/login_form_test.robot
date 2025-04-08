*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}        https://practicetestautomation.com/practice-test-login/
${browser}        chrome
${username}        student
${password}        Password123

*** Keywords ***

*** Test Cases ***
Valid Login Test
    Open Browser        ${url}    ${browser}
    Input Text    id=username    ${username}
    Input Password    id=password    ${password}
    Click Button    id=submit
    Wait Until Element Is Visible    xpath=//h1[contains(text(), 'Logged In Successfully')]    5s
    Element Should Contain    xpath=//h1    Logged In Successfully
    Capture Page Screenshot
    Close Browser
*** Settings ***
Library     SeleniumLibrary
*** Variables ***
${URL}        https://robotframework.org/SeleniumLibrary/
${BROWSER}        chrome

*** Test Cases ***
Open Login Page
    Open Browser        ${URL}    ${BROWSER}
    Sleep    2s
    Capture Page Screenshot
    Close Browser
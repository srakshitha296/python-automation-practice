*** Settings ***
Library    OperatingSystem
Library    Process
Library    SeleniumLibrary
Library    Collections
*** Variables ***
${host}    google.com

*** Test Cases ***
Ping Check
    ${RESPONSE}=    Run Process    Ping    ${host}    -n    1    shell=${True}      stdout=PIPE
    ${OUTPUT}=    Convert To String    ${RESPONSE.stdout}
    ${rechable}=    Run Keyword And Return Status    Should Contain    ${OUTPUT}    Reply from
    Run Keyword If   ${rechable}
    ...    Log to console    ${host} is Rechable
    ...    ELSE   
    ...    Log To Console    ${host} is not Rechable
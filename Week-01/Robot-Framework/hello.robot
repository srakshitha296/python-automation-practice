*** Settings ***
Library        BuiltIn
Library    String

*** Variables ***
@{customers}    lavish    om    parth    priyansh

*** Keywords ***
hello customers
    FOR    ${customer}    IN    @{customers}
        Log To Console    ${customer}
    END

*** Test Cases ***
Say Hello
    Log To Console    Welcome

Say hello to my customers
    hello customers         


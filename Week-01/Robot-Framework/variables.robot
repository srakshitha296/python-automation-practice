*** Settings ***
Library        BuiltIn
Library        String

*** Test Cases ***
Math Ops
    ${result}=    Evaluate    2 + 3
    Log To Console    Result is ${result}

String Ops
    ${upper}=    Convert To Upper Case    robot
    Log To Console    ${upper}

Wait
    Sleep    2s

*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${api_url}        https://jsonplaceholder.typicode.com

*** Keywords ***
Validate Status code
    [Arguments]    ${expected_code}
    Status Should Be    ${expected_code}    ${response}

Display response
    [Arguments]    ${res}
    &{resp_body}=    Convert To Dictionary    ${res.json()}
    Log To Console    ID: ${resp_body['id']}
    Log To Console    Title: ${resp_body['title']}
    Log To Console    Body: ${resp_body['body']}


Validate contents     
    [Arguments]    ${provided}    ${res}
    &{resp_body}=    Convert To Dictionary    ${res.json()}
    Should Be Equal As Strings    ${resp_body['title']}     ${provided['title']}
    Should Be Equal As Strings    ${resp_body['body']}    ${provided['body']}

Create New post
    [Arguments]    ${title}    ${body}
    Create Session    new_session    ${api_url}
    &{data}=    Create Dictionary    title=${title}       body=${body}        userId=11
    ${response}=        POST On Session    new_session    /posts    json=${data}
    Set Test Variable    ${response} 
    Validate Status code    201
    Validate contents    ${data}    ${response}
    Display response    ${response}


Update post
    [Arguments]        ${title}    ${body}    ${id}
    &{new_data}=        Create Dictionary    title=${title}    body=${body}    id=${id}
    ${response}=    PUT On Session    new_session    /posts/${id}   json=&{new_data} 
    Set Test Variable    ${response}
    Validate Status code    200
    Validate contents    ${new_data}     ${response}
    Display response    ${response}

Delete post
    [Arguments]        ${id}
    ${response}=        DELETE On Session    new_session    /posts/${id}
    Set Test Variable    ${response}
    Validate Status code    200

*** Test Cases ***
API TESTING
    Create New post         new Post        New post from Robotframework
    update post             updated post    updated post form robot framework    1
    Delete post             1            
    
    
   



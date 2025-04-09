*** Settings ***
Library     OperatingSystem
Library    BuiltIn
Library    Collections

*** Variables ***
${folder_name}        new_folder

*** Keywords ***
Create a folder
    Create Directory    ${folder_name}
    Log To Console    Folder created

Create a file
    [Arguments]    ${file_name}
    Create File    ${folder_name}/${file_name}   
    Log To Console    File created

Add contents
    [Arguments]    ${file_name}    ${text}
    Append To File    ${folder_name}/${file_name}    ${text}

Read 
    [Arguments]       ${file_name}
    File Should Exist    ${folder_name}/${file_name}
    ${contents}=    Get File   ${folder_name}/${file_name}
    Log To Console    ${contents}

Merge files    
    [Arguments]    ${f1}    ${f2}    ${f3}
    ${content1}=    Get File    ${folder_name}/${f1}
    ${content2}=    Get File    ${folder_name}/${f2}
    ${merged_content}=    Catenate    SEPARATOR=\n       ${content1}    ${content2}
    Create a file    ${f3}
    Add contents    ${f3}    ${merged_content}   


Rename file
    [Arguments]    ${old_name}    ${new_name}
    Move File    ${folder_name}/${old_name}    ${folder_name}/${new_name}
    File Should Exist    ${folder_name}/${new_name}
    File Should Not Exist    ${folder_name}/${old_name}
    Log To Console    Renamed: ${old_name} to ${new_name}
    Log To Console    ${new_name} exists ${old_name} removed.
    
Delete folder
    Remove Directory    ${folder_name}    recursive=True
    Log To Console    Folder Deleted

*** Test Cases ***
Test file automation
    Create a folder   

    Create a file    file1.txt
    Create a file    file2.txt
    

    Add contents     file1.txt        First line.\nSecond line.\nThird Line.
    Add contents     file2.txt        Second File
    Read        file1.txt

    Merge files    file1.txt    file2.txt    file3.txt
    Read       file3.txt
    
    Rename file    file3.txt    final.txt

    #Delete folder


        

    
    
    

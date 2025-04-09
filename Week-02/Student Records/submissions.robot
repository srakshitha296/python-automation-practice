*** Settings ***
Library    OperatingSystem
Library    Collections

*** Keywords ***
Create Student folders
    Create Directory    8th Sem
    FOR    ${i}    IN RANGE    1    5
        Create Directory    8th Sem/4JK21CS0${i}       
    END

    ${directories}=    List Directories In Directory    8th Sem
    FOR    ${directory}    IN    @{directories}
       Create File    8th Sem/${directory}/Report.txt
       Create File    8th Sem/${directory}/Resume.txt     
    END

Delete files
    Remove File     8th Sem/4JK21CS01/Report.txt
    Remove File     8th Sem/4JK21CS03/Resume.txt
    Remove File     8th Sem/4JK21CS04/Report.txt

Write missing to CSV
    [Arguments]    ${list}
    Create File    8th Sem/pending_submissions.CSV    USN\n
    FOR    ${student}    IN    @{list}
        Append To File    8th Sem/pending_submissions.CSV    ${student}\n
        
    END

Write missing to TXT
    [Arguments]    ${list}
    Create File    8th Sem/pending_submissions.txt    USN\n
    FOR    ${student}    IN    @{list}
        Append To File    8th Sem/pending_submissions.txt   ${student}\n
        
    END

Test student uploads
    ${missing}=    Create List
    ${directories}=    List Directories In Directory    8th Sem
    FOR    ${directory}    IN    @{directories}
        ${report_exists}=    Run Keyword And Return Status    File Should Exist    8th Sem/${directory}/Report.txt    
        ${resume_exists}=    Run Keyword And Return Status    File Should Exist    8th Sem/${directory}/Resume.txt   

        Run Keyword If    not ${report_exists} or not ${resume_exists}
        ...    Append To List    ${missing}    ${directory}
    END
    
    ${count}=    Get Length    ${missing}
    Run Keyword If   ${count}==0
    ...        Log To Console    All Submitted
    ...    ELSE
    ...        Run Keywords
    ...        Write missing to CSV   ${missing}
    ...        AND
    ...        Write missing to TXT   ${missing}   


   
*** Test Cases ***
Submissin check
    Create Student folders
    Delete files
    Test student uploads

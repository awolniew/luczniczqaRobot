*** Settings ***
Library           SSHLibrary
Resource          CommonResources.robot

*** Keywords ***
Establish Ssh
    [Arguments]    ${ip}    ${user}    ${password}    ${port}=22    ${prompt}=\#    ${timeout}=600
    ...    ${terminal}=xterm
    [Documentation]    Establishes Ssh connection to an host.
    ${connection}    SSHLibrary.Open Connection    ${ip}    port=${port}    timeout=${timeout}    alias=Main
    SSHLibrary.Login    ${user}    ${password}
    Set Client Configuration    prompt=${prompt}
    [Return]    ${connection}

Remove File
    [Arguments]    ${path}
    Execute Command    rm -rf ${path}
    ${rc}    Execute Command    ls ${path}    return_stdout=False    return_rc=True
    Run Keyword If    ${rc} == 0    Fail    File ${path} still exists!

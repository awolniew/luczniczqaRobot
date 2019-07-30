*** Settings ***
Test Setup        Establish Ssh    ${IP_ADDRESS}    ${USER}    ${PASSWORD}
Test Teardown     Close All Connections
Force Tags        SshTests
Resource          labs/Lab01.robot
Resource          lib/SshResources.robot

*** Test Cases ***
Check Free Space
    [Tags]    CENTOS-1    Daily    THREAD-1    nonCritical
    ${freeSpace}    Execute Command    df / | awk '{ print $4 }' | tail -1
    Run Keyword If    ${freeSpace} < 99999999999999999    Fail    Disk is almost full! Only ${freeSpace} KB left!!

Create Directory
    [Tags]    CENTOS-2    Weekly
    [Setup]    Create Directory Setup
    Execute Command    mkdir ${DIRECTORY_PATH}
    ${rc}    Execute Command    ls ${DIRECTORY_PATH}    return_stdout=False    return_rc=True
    Run Keyword If    ${rc} != 0    Fail    Directory ${DIRECTORY_PATH} does not exist!
    Sleep    10s
    [Teardown]    Create Directory Teardown

*** Keywords ***
Create Directory Setup
    Set Test Variable    ${DIRECTORY_PATH}    /root/Desktop/luczniczqaTestDirectory
    Establish Ssh    ${IP_ADDRESS}    ${USER}    ${PASSWORD}
    Remove File    ${DIRECTORY_PATH}
    [Teardown]

Create Directory Teardown
    Establish Ssh    ${IP_ADDRESS}    ${USER}    ${PASSWORD}
    Remove File    ${DIRECTORY_PATH}
    [Teardown]    Close All Connections

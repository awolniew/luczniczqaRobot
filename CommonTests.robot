*** Settings ***
Force Tags        CommonTests
Resource          labs/Lab01.robot
Resource          lib/CommonResources.robot
Resource          lib/WebUiResources.robot
Library           Collections
Library           lib/MyPythonLibrary.py

*** Test Cases ***
For Loop Up
    [Tags]    DAILY    THREAD-1
    : FOR    ${i}    IN RANGE    10
    \    Run Keyword If    ${i}%2==0    Log    ${i}    WARN

For Loop Desc
    [Tags]    DAILY    THREAD-1
    ${i}    Set Variable    10
    : FOR    ${i}    IN RANGE    10    0    -1
    \    Run Keyword If    ${i}%2==0    Log    ${i}    WARN

For Loop Nested
    [Tags]    DAILY    THREAD-2
    ${i}    Set Variable    5
    : FOR    ${i}    IN RANGE    ${i}    0    -1
    \    Log    ==== ${i} ====    WARN
    \    Say Hello X Times    ${i}

Documentation Example
    [Tags]    SKIP
    Documentation Show

External Library
    [Tags]    WEEKLY    THREAD-2
    ${returnedString}    My Simple External Python Keyword    ExampleName
    log    ${returnedString}    WARN

Robot Variables
    [Documentation]    This is sample documentation.
    [Tags]    WEEKLY    THREAD-1
    Log    CURDIR=${CURDIR}    WARN
    Log    EXECDIR=${EXECDIR}    WARN
    Log    TEST_NAME=${TEST_NAME}    WARN
    Log    TEST_DOCUMENTATION=${TEST_DOCUMENTATION}    WARN
    [Teardown]    Robot Variables Teardown

If Example
    [Documentation]    This is sample documentation.
    [Tags]    WEEKLY    THREAD-1
    ${firstValue}    Set Variable    123
    ${secondValue}    Set Variable    456
    ${stringExample}    Set Variable    someString
    Run Keyword If    ${firstValue} < 200    Log    ${firstValue} is lower than 200
    ...    ELSE IF    ${firstValue} > 200    Log    ${firstValue} is greater than 200
    ...    ELSE    Log    ${firstValue} equals 200
    Run Keyword If    (${firstValue} == 123 and ${secondValue} == 123) or "${stringExample}" == "someString"    Log    stringExample equals as a string.    WARN
    ...    ELSE IF    ${firstValue} == 123 and ${secondValue} == 456    Log    Both equals    WARN
    ${conditionalVariable}    Set Variable If    ${firstValue} == 123 and ${secondValue} == 789    ConditionOK    ConditionNOK
    Log    ${conditionalVariable}    WARN
    [Teardown]    Robot Variables Teardown

*** Keywords ***
Robot Variables Teardown
    Pass Execution If    "${testStatus}" == "PASS"    Teardown skipped - test has been finished successfully.

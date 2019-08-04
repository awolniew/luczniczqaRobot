*** Settings ***
Library           Collections
Library           DateTime
Library           Dialogs
Library           OperatingSystem
Library           Process
Library           String
Library           Screenshot
Library           XML

*** Test Cases ***
Example Test Case
    Comment    List example
    @{someList}    Create List    firstElement    secondElement    thirdElement
    Log List    ${someList}    warn
    Log    @{someList}[2]    warn
    ${sec}    Collections.Get From List    ${someList}    2
    Log    ${sec}    warn
    Comment    Dictionary example
    &{someDictionary}    Create Dictionary    first key=first Value
    Dictionary Should Not Contain Key    ${someDictionary}    someNotNeededKey
    ${currentDate}    DateTime.Get Current Date
    Collections.Set To Dictionary    ${someDictionary}    current date is=${currentDate}
    Log Dictionary    ${someDictionary}    warn
    Log    &{someDictionary}[current date is]    warn
    ${sec}    Get From Dictionary    ${someDictionary}    current date is
    log    What is the date? It is${sec}.    warn
    :FOR    ${item}    IN    @{someDictionary}
    \    Log    ${someDictionary}[${item}]    warn

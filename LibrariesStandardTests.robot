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
    &{someDictionary}    Create Dictionary    first key=first Value
    Dictionary Should Not Contain Key    ${someDictionary}    someNotNeededKey
    ${currentDate}    DateTime.Get Current Date
    Collections.Set To Dictionary    ${someDictionary}    current date is=${currentDate}
    Log Dictionary    ${someDictionary}    warn

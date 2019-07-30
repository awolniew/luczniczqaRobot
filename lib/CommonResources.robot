*** Keywords ***
Documentation Show
    [Documentation]    1. _italic text_
    ...
    ...    2. *bold text*
    ...
    ...    3. Table example
    ...    | *Table* | with | _three_ columns |
    ...    | And | two rows |
    Log To Console    I just show documentation ;)

Say Hello X Times
    [Arguments]    ${iterations}
    : FOR    ${i}    IN RANGE    ${iterations}
    \    Log    Hello    WARN

*** Settings ***
Library           Selenium2Library

*** Keywords ***
Check Title
    [Arguments]    ${address}    ${title}    ${browser}=Firefox
    [Documentation]    This keyword checks _title_ of the page indicated by *address* variable.
    ...
    ...    Usage example:
    ...    | Check Title | http://www.python.org | Welcome to Python.org |
    Open Browser    ${address}    browser=${browser}
    Title Should Be    ${title}
    [Teardown]    Close All Browsers

Chrome - Wait And Click Main Menu Button By Text
    [Arguments]    ${text}
    Wait And Click Element    xpath=//nav[@id="mainnav"]//a[text()="${text}"]

Firefox - Wait And Click Main Menu Button By Text
    [Arguments]    ${text}
    Wait And Click Element    xpath=//nav[@class="meta-navigation container"]//a[text()="${text}"]

Wait And Click Element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10    0.1    Click Element    ${locator}

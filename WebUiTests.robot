*** Settings ***
Resource          labs/Lab01.robot
Resource          lib/WebUiResources.robot

*** Test Cases ***
Check Title
    [Setup]    Open Browser    http://www.python.org    browser=Firefox
    Title Should Be    Welcome to Python.org
    [Teardown]    Close Browser

Check Title v2
    Check Title    ${PAGE_ADDRESS}    Welcome to Python.org

Failing Check Title
    Check Title    ${PAGE_ADDRESS}    błędny tytuł

Chrome - Check Main Navigation Menu
    [Setup]    Open Browser    http://www.python.org    browser=Chrome
    Chrome - Wait And Click Main Menu Button By Text    Community
    [Teardown]    Close Browser

Firefox - Check Main Navigation Menu
    [Setup]    Open Browser    http://www.python.org    browser=Firefox
    Firefox - Wait And Click Main Menu Button By Text    Community
    [Teardown]    Close Browser

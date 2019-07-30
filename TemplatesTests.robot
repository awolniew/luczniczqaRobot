*** Settings ***
Test Teardown     Close All Browsers
Force Tags        TemplatesTests
Test Template     Validate Page
Resource          lib/WebUiResources.robot
Resource          labs/Lab01.robot

*** Test Cases ***    Page         Phrase                                         Browser
FF PSF                PSF          We Support The Python Community                Firefox

FF Community - Pass
                      Community    Great software is supported by great people    Firefox

FF Community - Fail
                      [Tags]       nonCritical
                      Community    Our community is so small... :-(               Firefox

Chrome About          About        Getting Started                                Chrome

Chrome Downloads      Downloads    Looking for a specific release?                Chrome

*** Keywords ***
Validate Page
    [Arguments]    ${page}    ${phrase}    ${browser}
    Open Browser    ${PAGE_ADDRESS}    browser=${browser}
    Run Keyword If    "${BROWSER}" == "Firefox"    Firefox - Wait And Click Main Menu Button By Text    ${page}
    Run Keyword If    "${BROWSER}" == "Chrome"    Chrome - Wait And Click Main Menu Button By Text    ${page}
    ${passed}    Run Keyword And Return Status    Wait Until Page Contains    ${phrase}    timeout=10s
    Run Keyword If    "${passed}" != "True"    Capture Page Screenshot
    Run Keyword If    "${passed}" != "True"    Fail    Phrase "${phrase}" did not appear on the :${page}" page! Please check screenshot in the report.

*** Settings ***
Test Teardown     Close All Browsers
Force Tags        BddTests
Resource          lib/WebUiResources.robot
Resource          labs/Lab01.robot

*** Test Cases ***
Firefox PSF
    Given Homepage is open with "Firefox"
    When User clicks "PSF"
    Then "We Support The Python Community through..." phrase appears

Firefox Community
    Given Homepage is open with "Firefox"
    When User clicks "Community"
    Then "Great software is supported by great people" phrase appears

Chrome About
    Given Homepage is open with "Chrome"
    When User clicks "About"
    Then "Getting Started" phrase appears

Chrome Downloads
    Given Homepage is open with "Chrome"
    When User clicks "Downloads"
    Then "Looking for a specific release?" phrase appears

*** Keywords ***
Homepage has been opened with "${browser}"
    Open Browser    ${PAGE_ADDRESS}    browser=${browser}
    Set Test Variable    ${BROWSER}    ${browser}

User clicks "${button}"
    Run Keyword If    "${BROWSER}" == "Firefox"    Firefox - Wait And Click Main Menu Button By Text    ${button}
    Run Keyword If    "${BROWSER}" == "Chrome"    Chrome - Wait And Click Main Menu Button By Text    ${button}

"${phrase}" phrase appears
    Wait Until Page Contains    ${phrase}    timeout=10s
    Capture Page Screenshot

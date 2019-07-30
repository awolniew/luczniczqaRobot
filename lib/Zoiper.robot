*** Settings ***
Library           ImageHorizonLibrary
Resource          ../labs/Lab01.robot

*** Keywords ***
Check If Call Has Been Performed
    Wait Until Keyword Succeeds    15s    1s    Is Calling Screen Visible

Close Application
    Wait And Click Image    closebutton

Find Contact For A Call
    [Arguments]    ${contactNumber}
    Wait And Click Image    findacontact
    Wait Until Keyword Succeeds    15s    1s    ImageHorizonLibrary.Type    ${contactNumber}

Is Calling Screen Visible
    ${wasCalling}    ImageHorizonLibrary.Does Exist    iscalling
    Log    ${wasCalling}
    Run Keyword If    "${wasCalling}" != "True"    Fail    Call has not been performed.

Launch Application
    Wait And Click Image    zoipericon

Perform Call
    Wait And Click Image    call

Wait And Click Image
    [Arguments]    ${image}
    Wait Until Keyword Succeeds    15s    1s    ImageHorizonLibrary.Click Image    ${image}

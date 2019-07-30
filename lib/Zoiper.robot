*** Settings ***
Library           ImageHorizonLibrary
Resource          ../labs/Lab01.robot

*** Keywords ***
Check If Call Has Been Performed
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    10s    0.1    Is Calling Screen Visible

Find Contact For A Call
    [Arguments]    ${contactNumber}
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    5s    0.1    ImageHorizonLibrary.Click Image    findacontact
    Wait Until Keyword Succeeds    5s    0.1    ImageHorizonLibrary.Type    ${contactNumber}

Is Calling Screen Visible
    ${wasCalling}    ImageHorizonLibrary.Does Exist    iscalling
    Log    ${wasCalling}
    Run Keyword If    "${wasCalling}" != "True"    Fail    Call has not been performed.

Perform Call
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    5s    0.1    ImageHorizonLibrary.Click Image    call

Launch Application
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    5s    0.1    ImageHorizonLibrary.Click Image    zoipericon

Close Application
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    5s    0.1    ImageHorizonLibrary.Click Image    closebutton

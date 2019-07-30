*** Settings ***
Library           ImageHorizonLibrary
Resource          ../labs/Lab01.robot

*** Keywords ***
Check If Call Has Been Performed
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    10s    1s    Is Calling Screen Visible

Close Application
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    10s    1s    ImageHorizonLibrary.Click Image    closebutton

Find Contact For A Call
    [Arguments]    ${contactNumber}
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    10s    1s    ImageHorizonLibrary.Click Image    findacontact
    Wait Until Keyword Succeeds    10s    1s    ImageHorizonLibrary.Type    ${contactNumber}

Is Calling Screen Visible
    ${wasCalling}    ImageHorizonLibrary.Does Exist    iscalling
    Log    ${wasCalling}
    Run Keyword If    "${wasCalling}" != "True"    Fail    Call has not been performed.

Launch Application
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    10s    1s    ImageHorizonLibrary.Click Image    zoipericon

Perform Call
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    Wait Until Keyword Succeeds    10s    1s    ImageHorizonLibrary.Click Image    call

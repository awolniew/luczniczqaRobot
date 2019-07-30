*** Settings ***
Library           ImageHorizonLibrary
Resource          ../labs/Lab01.robot

*** Keywords ***
Run
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    ImageHorizonLibrary.Click Image    zoipericon
    Sleep    5s

Find Contact For A Call
    [Arguments]    ${contactNumber}
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    ImageHorizonLibrary.Click Image    findacontact
    ImageHorizonLibrary.Type    ${contactNumber}
    Sleep    2s

Perform Call
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    ImageHorizonLibrary.Click Image    call

Check If Call Has Been Performed
    ImageHorizonLibrary.Set Reference Folder    ${IMAGE_HORIZON_REFERENCE_FOLDER}
    ${wasCalling}    ImageHorizonLibrary.Does Exist    iscalling
    Log    ${wasCalling}
    Run Keyword If    "${wasCalling}" != "True"    Fail    Call has not been performed.

*** Settings ***
Library           AppiumLibrary
Library           FtpLibrary.py
Library           HttpLibrary.HTTP
Library           ImageHorizonLibrary    reference_folder=graphicsSap
Library           REST    https://jsonplaceholder.typicode.com
Library           SapGuiLibrary
Library           SeleniumLibrary
Library           SSHLibrary
Library           WhiteLibrary
Library           IOSLibrary    # Works only with robotframework==2.8.2-2.8.7

*** Test Cases ***
ImageHorizonLibraryExample
    ImageHorizonLibrary.Click Image    zoipericon
    Sleep    5s
    ImageHorizonLibrary.Click Image    findacontact
    ImageHorizonLibrary.Press Combination    1    2    3    5    6
    Sleep    2s
    ImageHorizonLibrary.Click Image    call

*** Settings ***
Force Tags        LibrariesExternalTests
Library           AppiumLibrary
Library           FtpLibrary.py
Library           HttpLibrary.HTTP
Library           ImageHorizonLibrary    reference_folder=graphics
Library           REST    https://jsonplaceholder.typicode.com
Library           SapGuiLibrary
Library           SeleniumLibrary
Library           SSHLibrary
Library           WhiteLibrary
Library           IOSLibrary    # Works only with robotframework==2.8.2-2.8.7
Resource          labs/Lab01.robot
Resource          lib/Zoiper.robot

*** Test Cases ***
ImageHorizonLibraryExample
    [Documentation]    This test case runs Zoiper softphone and performs a call.
    Zoiper.Launch Application
    Zoiper.Findcontactforacall    ${PHONE_NUMBER}    # It shows that robot is case and space insensitive.
    Zoiper.Perform Call
    Zoiper.Check If Call Has Been Performed

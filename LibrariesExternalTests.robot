*** Settings ***
Force Tags        LibrariesExternalTests
Library           AppiumLibrary
Library           FtpLibrary.py
Library           HttpLibrary.HTTP
Library           REST    https://jsonplaceholder.typicode.com
Library           SapGuiLibrary
Library           SeleniumLibrary
Library           SSHLibrary
Library           WhiteLibrary
Library           IOSLibrary    # Works only with robotframework==2.8.2-2.8.7
Resource          labs/Lab01.robot
Library           SikuliLibrary    mode=NEW

*** Test Cases ***
Example Test Case
    [Setup]
    Log    I am just an example.
    [Teardown]

*** Settings ***
Library           AppiumLibrary
Library           FtpLibrary.py
Library           HttpLibrary.HTTP
Library           ImageHorizonLibrary
Library           REST    https://jsonplaceholder.typicode.com
Library           SapGuiLibrary
Library           SeleniumLibrary
Library           SSHLibrary
Library           WhiteLibrary
Library           IOSLibrary    # Works only with robotframework==2.8.2-2.8.7

*** Test Cases ***
Example Test Case

*** Settings ***
Documentation                       Loan application test
Library                             Selenium2Library


*** Variables ***

${BROWSER}          chrome
${URL}              https://wnioski.aliorbank.pl/spinner-process/?partnerId=POR_P_ZERO_S&transactionCode=pozyczki

*** Test Cases ***
User can open page
    Page load

User can fill the form
    Fill the form

Phone number is validated correctly
    Validation


*** Keywords ***
Page load
    Open Browser                    ${URL}    ${BROWSER}
    Wait Until Element Is visible    xpath=//a[contains(text(),'Zamknij')]
    Click Element                    xpath=//a[contains(text(),'Zamknij')]

Fill the form
        Input Text                       id=firstName  Jan
        Input Text                       id=lastName  Kowalski
        Input Text                       id=emailAddress  jankowalski@randommail.com
        Input Text                       name=mobileNumber  000000000
        Input Text                       name=cashAmount  500
        Click Element                    name=installmentYears
        Click Element                    xpath=//*[@id="installmentYears"]/div/span/div/div[2]/div/div[2]/span
        Click Element                    name=installmentMonths
        Click Element                    xpath=//*[@id="installmentMonths"]/div/span/div/div[2]/div/div[12]/span
        Click Element                    class=agreement-label
        Click Element                    xpath=//*[@id="app"]/div[2]/root/div[1]/external/div/modal/div/div/div[2]/external-spinner/div/main/steps/step/spinner-contact-data/div[2]/form/div/ng-transclude/div[8]/div/spinner-agreement/fieldset/div[2]/div/div[1]/div[2]/label
        Click Element                    xpath=//*[@id="app"]/div[2]/root/div[1]/external/div/modal/div/div/div[2]/external-spinner/div/main/steps/step/spinner-contact-data/div[2]/form/div/ng-transclude/div[8]/div/spinner-agreement/fieldset/div[2]/div/div[2]/div[2]/label
        Click Button                     tag=button

Validation
        Element Should Be Visible        xpath=//*[@id="app"]/div[2]/root/div[1]/external/div/modal/div/div/div[2]/external-spinner/div/main/steps/step/spinner-contact-data/div[2]/form/div/ng-transclude/div[3]/div/div[2]/div[2]/fieldset/span/span      message=Walidacja negatywna
        Close Browser
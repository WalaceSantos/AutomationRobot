*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}                          chrome
${URL}                              https://takehome.zeachable.com

*** Keywords ***
#### Setup and Teardown
Abrir navegador
    Open Browser                      about:blank   ${BROWSER}
    Maximize Browser Window

Close the browser
    Close Browser

#### Actions
Access the web page
    Go To                             ${URL}
    Wait Until Element Is Visible     xpath=//*[@id="navbar"]/div/div/a
    Title Should Be                   Homepage | takehome

Go to login page
    Click Element                     xpath=//a[@href ='/sign_in']

Go to signup page
    Click Element                     id=header-sign-up-btn

Do the logout
    Click Element                     xpath=//a[@href ='#']
    Click Element                     xpath=//a[@href ='/sign_out']

Type "${EMAIL}" and "${PASSWORD}" in login page
    Wait Until Element Is Visible     name=email
    Input Text                        name=email       ${EMAIL}
    Input Text                        name=password    ${PASSWORD}

Type "${NAME}", "${EMAIL}" and "${PASSWORD}" in signup page
    Wait Until Element Is Visible     id=user_name
    Input Text                        id=user_name        ${NAME}
    Input Text                        id=user_email       ${EMAIL}
    Input Text                        id=password         ${PASSWORD}

Click on the submit button
    Click Element                     name=commit

Check if he is in the home page
    Element Should Be Visible         id=search-courses

Check if he is not in the home page
    Element Should Not Be Visible     id=search-courses

Check if an error message was displayed
    Element Text Should Be            xpath=/html/body/main/div/div             Your email or password is incorrect.

Check if an error message was displayed related to invalid email
    Element Text Should Be            xpath=/html/body/main/div/div/ul/li       Email is invalid

Check if an error message was displayed related to duplicated email
    Element Text Should Be            xpath=/html/body/main/div/div             Email is already in use. Please log in to your account.

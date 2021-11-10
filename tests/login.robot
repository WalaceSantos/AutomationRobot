*** Settings ***
Resource        ../resource/Resource.robot
Test Setup      Abrir navegador
Test Teardown   Close the browser

*** Variables ***
${URL}          https://takehome.zeachable.com
${BROWSER}      chrome

# robot -d ./results tests/login.robot


*** Test Case ***
Scenario 01: User logs in
    Given the user accessed the web page
    And he tried to login with the credentials "takehome@test.com" and "Teachable"
    When he triggers the submit button
    Then the home page should be visible

Scenario 02: User tries to login with wrong email
    Given the user accessed the web page
    And he tried to login with the credentials "xxx@test.com" and "Teachable"
    When he triggers the submit button
    Then the home page should not be visible
    And an error message should be displayed

Scenario 03: User tries to login with wrong password
    Given the user accessed the web page
    And he tried to login with the credentials "takehome@test.com" and "TeachXable"
    When he triggers the submit button
    Then the home page should not be visible
    And an error message should be displayed

Scenario 04: User tries to login with wrong email and password
    Given the user accessed the web page
    And he tried to login with the credentials "xxx@test.com" and "TeachXable"
    When he triggers the submit button
    Then the home page should not be visible
    And an error message should be displayed

Scenario 05: User signs up
    Given the user accessed the web page
    And he tried to signup with the credentials "Walace Santos", "walace31@test.com" and "Teste123"
    When he triggers the submit button
    Then the home page should be visible

Scenario 05: User tries to signup with invalid email
    Given the user accessed the web page
    And he tried to signup with the credentials "Walace Santos", "walace6@test" and "Teste123"
    When he triggers the submit button
    Then the home page should not be visible
    And an error message should be displayed related to invalid email

Scenario 07: User tries to signup with email already registered
    Given the user accessed the web page
    And he tried to signup with the credentials "take home", "takehome@test.com" and "Teachable"
    When he triggers the submit button
    Then the home page should not be visible
    And an error message should be displayed related to duplicated email

Scenario 08: User signs up, logout and login
    Given the user accessed the web page
    And he tried to signup with the credentials "Walace Santos", "walace21@test.com" and "Teste123"
    When he triggers the submit button
    And he finishes the signup, he logout and login with credentials "walace10@test.com" and "Teste123"
    Then the home page should be visible

*** Keywords ***
Given the user accessed the web page
    Access the web page

And he tried to login with the credentials "${EMAIL}" and "${PASSWORD}"
    Go to login page
    Type "${EMAIL}" and "${PASSWORD}" in login page

And he tried to signup with the credentials "${NAME}", "${EMAIL}" and "${PASSWORD}"
    Go to signup page
    Type "${NAME}", "${EMAIL}" and "${PASSWORD}" in signup page

When he triggers the submit button
    Click on the submit button

And he finishes the signup, he logout and login with credentials "${EMAIL}" and "${PASSWORD}"
    Check if he is in the home page
    Do the logout
    Go to login page
    Type "${EMAIL}" and "${PASSWORD}" in login page
    Click on the submit button

Then the home page should be visible
    Check if he is in the home page

Then the home page should not be visible
    Check if he is not in the home page

And an error message should be displayed
    Check if an error message was displayed

And an error message should be displayed related to invalid email
    Check if an error message was displayed related to invalid email

And an error message should be displayed related to duplicated email
    Check if an error message was displayed related to duplicated email

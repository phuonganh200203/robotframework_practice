*** Settings ***
Documentation     Automation Exercise - Signup
Library           Browser
Resource          ../resources/keywords/kw_common.robot

Suite Setup       Open Browser Suite    ${URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***

${URL}        https://automationexercise.com/
${BROWSER}    chromium
${EMAIL}      a22awwu12aeuau22test123@gmail.com
${PASSWORD}   123456


*** Test Cases ***

Open Home Page Successfully
    Get Text    body    contains    AutomationExercise


Go To Signup Page Successfully
    Click Link By Text    Signup / Login
    Get Text    body    contains    New User Signup!


Register New Account
    Click Link By Text    Signup / Login

    I input testuser into the signup-name field
    I input ${EMAIL} into the signup-email field

    Click Button By Text    Signup
    Get Text    body    contains    ENTER ACCOUNT INFORMATION

    Click    id=id_gender2

    I input ${PASSWORD} into the password field
    I input Test into the first_name field
    I input User into the last_name field
    I input 123 Street into the address1 field
    I input HCM into the state field
    I input HCM into the city field
    I input 700000 into the zipcode field
    I input 0123456789 into the mobile_number field

    Click Button By Text    Create Account
    Get Text    body    contains    ACCOUNT CREATED!


Login And Delete Account Successfully
    Click Link By Text    Signup / Login
    Click Link By Text    Logout

    Get Text    body    contains    Login to your account

    I input ${EMAIL} into the login-email field
    I input ${PASSWORD} into the login-password field

    Click Button By Text    Login
    Get Text    body    contains    Logged in as

    Click Link By Text    Delete Account
    Get Text    body    contains    ACCOUNT DELETED!


Login With Incorrect Email And Password
    Click Link By Text    Signup / Login
    Get Text    body    contains    Login to your account

    I input wrongemail@test.com into the login-email field
    I input wrongpassword into the login-password field

    Click Button By Text    Login
    Get Text    body    contains    Your email or password is incorrect!


Signup With Existing Email
    Click Link By Text    Signup / Login
    Get Text    body    contains    New User Signup!

    I input TestUser into the signup-name field
    I input ${EMAIL} into the signup-email field

    Click Button By Text    Signup
    Get Text    body    contains    Email Address already exist!
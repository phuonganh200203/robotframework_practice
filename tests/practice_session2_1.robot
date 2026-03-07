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

    Input Text By DataQA    signup-name     testuser
    Input Text By DataQA    signup-email    ${EMAIL}

    Click Button By Text    Signup
    Get Text    body    contains    ENTER ACCOUNT INFORMATION

    Click    id=id_gender2
    Input Text By Label    password        ${PASSWORD}
    Input Text By Label    first_name      Test
    Input Text By Label    last_name       User
    Input Text By Label    address1        123 Street
    Input Text By Label    state           HCM
    Input Text By Label    city            HCM
    Input Text By Label    zipcode         700000
    Input Text By Label    mobile_number   0123456789
    Click Button By Text    Create Account

    Get Text    body    contains    ACCOUNT CREATED!

Login And Delete Account Successfully
    Click Link By Text    Signup / Login
    Click Link By Text    Logout
    Get Text    body    contains    Login to your account

    Input Text By DataQA    login-email       ${EMAIL}
    Input Text By DataQA    login-password    ${PASSWORD}

    Click Button By Text    Login
    Get Text    body    contains    Logged in as

    Click Link By Text    Delete Account

    Get Text    body    contains    ACCOUNT DELETED!

Login With Incorrect Email And Password
    Click Link By Text    Signup / Login
    Get Text    body    contains    Login to your account

    Input Text By DataQA    login-email       wrongemail@test.com
    Input Text By DataQA    login-password    wrongpassword

    Click Button By Text    Login

    Get Text    body    contains    Your email or password is incorrect!

Signup With Existing Email
    Click Link By Text    Signup / Login
    Get Text    body    contains    New User Signup!

    Input Text By DataQA    signup-name     TestUser
    Input Text By DataQA    signup-email    ${EMAIL}

    Click Button By Text    Signup

    Get Text    body    contains    Email Address already exist!
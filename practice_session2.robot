*** Settings ***
Documentation     Automation Exercise - Signup & Delete
Library           Browser
Suite Setup       Open Browser Suite
Suite Teardown    Close Browser

*** Variables ***
${URL}        https://automationexercise.com/
${BROWSER}    chromium
${EMAIL}      tau22awwu12wwauau@gmail.com
${PASSWORD}   aaaaaaa

*** Test Cases ***
Open Home Page Successfully
    [Documentation]    Verify home page is visible
    [Tags]    smoke
    Get Text    body    contains    AutomationExercise

Go To Signup Page Successfully
    [Documentation]    Verify signup page is displayed
    [Tags]    regression
    Click    text=Signup / Login
    Get Text    body    contains    New User Signup!

Register New Account
    [Documentation]    Verify user can register new account
    [Tags]    smoke    register
    Click    text=Signup / Login
    Fill Signup Form
    Get Text    body    contains    ACCOUNT CREATED!
    Click    text=Continue
    Get Text    body    contains    Logged in as
    Click    text=Logout

Login With Valid Account
    [Documentation]    Verify user can login successfully
    [Tags]    smoke    login
    Click    text=Signup / Login
    Login With Account
    Get Text    body    contains    Logged in as
    Click    text=Logout

Delete Account After Login
    [Documentation]    Verify user can delete account
    [Tags]    regression    delete
    Click    text=Signup / Login
    Login With Account
    Click    text=Delete Account
    Get Text    body    contains    ACCOUNT DELETED!

*** Keywords ***
Open Browser Suite
    New Browser    ${BROWSER}    headless=False
    New Context
    New Page    ${URL}


Fill Signup Form
    Fill Text    input[data-qa="signup-name"]     testuser
    Fill Text    input[data-qa="signup-email"]    ${EMAIL}
    Click        button[data-qa="signup-button"]

    Click    id=id_gender2
    Fill Text    id=password         ${PASSWORD}
    Fill Text    id=first_name       Test
    Fill Text    id=last_name        User
    Fill Text    id=address1         123 Street
    Fill Text    id=state            HCM
    Fill Text    id=city             HCM
    Fill Text    id=zipcode          700000
    Fill Text    id=mobile_number    0123456789
    Click        button[data-qa="create-account"]


Login With Account
    Fill Text    input[data-qa="login-email"]       ${EMAIL}
    Fill Text    input[data-qa="login-password"]    ${PASSWORD}
    Click        button[data-qa="login-button"]
    
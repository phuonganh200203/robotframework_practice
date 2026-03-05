*** Settings ***
Documentation     Automation Exercise - Signup
Library           Browser
Resource          ../resources/keywords/kw_common.robot

Suite Setup       Open Browser Suite    ${URL}    ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***

${URL}        https://automationexercise.com/
${BROWSER}    chromium
${EMAIL}      22awwu12wwaeuautest123@gmail.com
${PASSWORD}   123456

*** Test Cases ***

Open Home Page Successfully
    [Documentation]    Verify home page is visible
    [Tags]    smoke

    Get Text    body    contains    AutomationExercise

Go To Signup Page Successfully
    [Documentation]    Verify signup page is displayed
    [Tags]    regression

    Click Link By Text    Signup / Login
    Get Text    body    contains    New User Signup!


Register New Account
    [Documentation]    Verify user can register new account
    [Tags]    smoke    register

    Click Link By Text    Signup / Login

    Input Text By DataQA    signup-name     testuser
    Input Text By DataQA    signup-email    ${EMAIL}

    Click Button By Text    Signup

    Get Text    body    contains    ENTER ACCOUNT INFORMATION

    Click    id=id_gender2

    Input Text By Name    password        ${PASSWORD}
    Input Text By Name    first_name      Test
    Input Text By Name    last_name       User
    Input Text By Name    address1        123 Street
    Input Text By Name    state           HCM
    Input Text By Name    city            HCM
    Input Text By Name    zipcode         700000
    Input Text By Name    mobile_number   0123456789

    Click Button By Text    Create Account

    Get Text    body    contains    ACCOUNT CREATED!

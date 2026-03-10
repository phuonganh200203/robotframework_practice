*** Settings ***
Documentation     Automation Exercise - Signup
Library           Browser
Resource          ../resources/keywords/kw_common.robot

Suite Setup       Open Browser Suite    ${URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***

${URL}        https://automationexercise.com/
${BROWSER}    chromium
${EMAIL}      awwu1ua3est123@gmail.com
${PASSWORD}   123456


*** Test Cases ***

Open Home Page Successfully
    I verify AutomationExercise text is visible


Go To Signup Page Successfully
    Click Link By Text    Signup / Login
    I verify New User Signup text is visible
    I verify Signup button is visible


Register New Account
    Click Link By Text    Signup / Login

    I input testuser into the signup-name field
    I input ${EMAIL} into the signup-email field

    I verify Signup button is visible
    Click Button By Text    Signup

    I verify Enter Account Information text is visible

    Click    id=id_gender2

    I input ${PASSWORD} into the password field
    I input Test into the first_name field
    I input User into the last_name field
    I input 123 Street into the address1 field
    I input HCM into the state field
    I input HCM into the city field
    I input 700000 into the zipcode field
    I input 0123456789 into the mobile_number field

    I verify Create Account button is visible
    Click Button By Text    Create Account

    I verify Account Created! text is visible
    I verify Continue button is visible
    Click Link By Text    Continue
    Click Link By Text     Delete Account


Login With Incorrect Email And Password
    Click Link By Text    Signup / Login

    I verify Login to your account text is visible
    I verify Login button is visible

    I input wrongemail@test.com into the login-email field
    I input wrongpassword into the login-password field

    Click Button By Text    Login

    I verify Your email or password is incorrect text is visible
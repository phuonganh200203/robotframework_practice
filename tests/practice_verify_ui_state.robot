*** Settings ***
Documentation     Automation Exercise - Signup
Library           Browser
Resource          ../resources/keywords/kw_common.robot

Suite Setup       Open Browser Suite    ${URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Variables ***

${URL}        https://automationexercise.com/
${BROWSER}    chromium
${EMAIL}      testq21hbq1s@mail.com
${PASSWORD}   123456


*** Test Cases ***

Open Home Page Successfully
    I verify AutomationExercise text is visible


Go To Signup Page Successfully
    I click the Signup / Login link
    I verify New User Signup text is visible


Register New Account
    I click the Signup / Login link

    I input testuser into the signup-name field
    The signup-name text field should be testuser
    
    I input ${EMAIL} into the signup-email field
    The signup-email text field should be ${EMAIL}

    I click the Signup button
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

    I click the Create Account button
    I verify Account Created text is visible
    I click the Continue link
    I click the Delete Account link


Login With Incorrect Email And Password
    I click the Signup / Login link

    I verify Login to your account text is visible

    I input wrongemail@test.com into the login-email field
    I input wrongpassword into the login-password field

    I click the Login button

    I verify Your email or password is incorrect text is visible
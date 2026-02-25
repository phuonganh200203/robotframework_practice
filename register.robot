*** Settings ***
Library    Browser

*** Test Cases ***
Sign up and delete account
    New Browser    chromium 
    New Context
    New Page    https://automationexercise.com/
    Get Text    body    contains    AutomationExercise

    Click    a[href="/login"]
    Get Text    body    contains    New User Signup!

    Fill Text    input[data-qa="signup-name"]    testuser
    Fill Text    input[data-qa="signup-email"]    a1234uwc123@gmail.com
    Click    button[data-qa="signup-button"]

    Get Text    body    contains    ENTER ACCOUNT INFORMATION
    Click    id=id_gender2
    Fill Text    id=password         aaaaaaa
    Fill Text    id=first_name       Test
    Fill Text    id=last_name        User
    Fill Text    id=address1         123 Street
    Fill Text    id=state            HCM
    Fill Text    id=city             HCM
    Fill Text    id=zipcode          700000
    Fill Text    id=mobile_number    0123456789
    Click    button[data-qa="create-account"]

    Get Text    body    contains    ACCOUNT CREATED!
    Click    text=Continue
    Get Text    body    contains    Logged in as

    Click    text=Delete Account
    Get Text    body    contains    ACCOUNT DELETED!
    Close Browser
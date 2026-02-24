*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Sign up and delete account
    Open Browser    https://automationexercise.com/    chrome
    Maximize Browser Window
    Page Should Contain    AutomationExercise
    Click Element     link=Signup / Login
    Page Should Contain    New User Signup!

    Input Text    name=name    testuser
    Input Text    css=input[data-qa="signup-email"]    a123uwc123@gmail.com
    Click Button    Signup
    
    Page Should Contain    Enter Account Information
    Click Element    id=id_gender2
    Input Text    id=password     aaaaaaa
    Input Text    id=first_name   Test
    Input Text    id=last_name    User
    Input Text    id=address1     123 Street
    Input Text    id=state        HCM
    Input Text    id=city         HCM
    Input Text    id=zipcode      700000
    Input Text    id=mobile_number    0123456789
    Click Button    css=button[data-qa="create-account"]

    Page Should Contain    Account Created!
    Click Element    link=Continue
    Page Should Contain    Logged in as

    Click Element    link= Delete Account
    Page Should Contain    ACCOUNT DELETED!
    Close Browser




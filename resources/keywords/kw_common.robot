*** Settings ***
Library     Browser
Resource    ../../locators/loc_common.robot


*** Keywords ***

Open Browser Suite
    [Arguments]    ${URL}    ${BROWSER}

    New Browser    ${BROWSER}
    New Context
    New Page    ${URL}


Input Text By Placeholder
    [Arguments]    ${placeholder}    ${text}

    Fill Text    xpath=//input[@placeholder="${placeholder}"]    ${text}


Input Text By Name
    [Arguments]    ${name}    ${text}

    Fill Text    xpath=//input[@name="${name}"]    ${text}


Input Text By DataQA
    [Arguments]    ${value}    ${text}

    Fill Text    xpath=//input[@data-qa="${value}"]    ${text}


Click Button By Text
    [Arguments]    ${text}

    Click    xpath=//button[normalize-space()="${text}"]


Click Link By Text
    [Arguments]    ${text}

    Click    xpath=//a[normalize-space()="${text}"]
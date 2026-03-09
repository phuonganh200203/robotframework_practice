*** Settings ***
Library     Browser
Resource    ../../locators/loc_common.robot


*** Keywords ***

Open Browser Suite
    [Arguments]    ${URL}    ${BROWSER}

    New Browser    ${BROWSER}
    New Context
    New Page    ${URL}


Get Visible Textbox
    [Arguments]    ${field_label}

    ${locator}=    Textbox By Name Or Placeholder    ${field_label}
    Wait For Elements State    ${locator}    visible

    RETURN    ${locator}


I input ${value} into the ${field_label} field
    ${locator}=    Get Visible Textbox    ${field_label}
    Clear Text     ${locator}
    Fill Text      ${locator}    ${value}


Click Button By Text
    [Arguments]    ${text}

    ${locator}=    Button By Text    ${text}
    Click    ${locator}


Click Link By Text
    [Arguments]    ${text}

    ${locator}=    Link By Text    ${text}
    Click    ${locator}
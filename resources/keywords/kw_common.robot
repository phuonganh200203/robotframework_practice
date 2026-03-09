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
    [Arguments]    ${field}

    ${locator}=    Textbox By Name Or Placeholder    ${field}
    Wait For Elements State    ${locator}    visible

    RETURN    ${locator}


Input Text Into Field
    [Arguments]    ${field}    ${value}

    ${locator}=    Get Visible Textbox    ${field}
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
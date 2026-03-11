*** Settings ***
Library     Browser
Resource    ../../locators/loc_common.robot


*** Keywords ***

Open Browser Suite
    [Arguments]    ${URL}    ${BROWSER}

    New Browser    ${BROWSER}
    New Context
    New Page       ${URL}


Get Visible Textbox
    [Arguments]    ${field_label}

    ${locator}=    Textbox By Label Or Placeholder    ${field_label}
    Wait For Elements State    ${locator}    visible
    RETURN    ${locator}


I input ${value} into the ${field_label} field
    ${locator}=    Get Visible Textbox    ${field_label}
    Fill Text      ${locator}    ${value}


I click the ${button_name} button
    ${locator}=    Button By Text    ${button_name}
    Wait For Elements State    ${locator}    visible
    Click    ${locator}


I click the ${link_name} link
    ${locator}=    Link By Text    ${link_name}
    Wait For Elements State    ${locator}    visible
    Click    ${locator}


I verify ${button_name} button is ${status} status
    ${locator}=    Button By Text    ${button_name}
    Wait For Elements State    ${locator}    ${status}


I verify ${text_value} text is ${status} status
    ${locator}=    Text By Value    ${text_value}
    Wait For Elements State    ${locator}    ${status}

I verify ${field_label} text field is ${status} status
    ${locator}=    Textbox By Label Or Placeholder    ${field_label}
    Wait For Elements State    ${locator}    ${status}

The ${field_label} text field should be ${value}
    ${locator}=    Textbox By Label Or Placeholder    ${field_label}
    Wait For Elements State    ${locator}    visible
    ${actual}=    Get Attribute    ${locator}    value
    Should Be Equal    ${actual}    ${value}
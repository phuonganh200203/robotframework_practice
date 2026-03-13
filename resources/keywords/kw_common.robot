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

#compare
The ${field_label} text field should be ${value}
    ${locator}=    Textbox By Label Or Placeholder    ${field_label}
    Wait For Elements State    ${locator}    visible
    ${actual}=    Get Attribute    ${locator}    value
    Should Be Equal    ${actual}    ${value}

#Verify textbox empty
The ${field_label} text field should be empty
    ${locator}=    Textbox By Label Or Placeholder    ${field_label}
    ${value}=    Get Attribute    ${locator}    value
    Should Be Empty    ${value}

#checkbox
I check the ${checkbox_name} checkbox
    ${locator}=    Checkbox By Label    ${checkbox_name}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    IF    not ${state}
        Check Checkbox    ${locator}
    END

I verify the ${checkbox_name} checkbox should be checked
    ${locator}=    Checkbox By Label    ${checkbox_name}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Be True    ${state}


I uncheck the ${checkbox_name} checkbox
    ${locator}=    Checkbox By Label    ${checkbox_name}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    IF    ${state}
        Uncheck Checkbox    ${locator}
    END

I verify the ${checkbox_name} checkbox should be unchecked
    ${locator}=    Checkbox By Label    ${checkbox_name}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Be False    ${state}

I verify the ${checkbox_name} checkbox should be enabled
    ${locator}=    Checkbox By Label    ${checkbox_name}
    Wait For Elements State    ${locator}    enabled

I verify the ${checkbox_name} checkbox should be disabled
    ${locator}=    Checkbox By Label    ${checkbox_name}
    Wait For Elements State    ${locator}    disabled

#radio
I select the ${radio_name} radio
    ${locator}=    Radio By Label    ${radio_name}
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

I verify the ${radio_name} radio should be selected
    ${locator}=    Radio By Label    ${radio_name}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Be True    ${state}

I verify the ${radio_name} radio should not be selected
    ${locator}=    Radio By Label    ${radio_name}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Be False    ${state}

I verify the ${radio_name} radio should be enabled
    ${locator}=    Radio By Label    ${radio_name}
    Wait For Elements State    ${locator}    enabled

I verify the ${radio_name} radio should be disabled
    ${locator}=    Radio By Label    ${radio_name}
    Wait For Elements State    ${locator}    disabled

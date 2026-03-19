*** Settings ***
Library     Browser
Resource    ../../locators/loc_common.robot


*** Keywords ***

Open Browser Suite
    [Arguments]    ${URL}    ${BROWSER}

    New Browser    ${BROWSER}    headless=False
    New Context
    New Page       ${URL}


Get Visible Textbox
    [Arguments]    ${field_label}

    ${locator}=    Textbox By Label Or Placeholder    ${field_label}
    Wait For Elements State    ${locator}    visible
    RETURN    ${locator}


I input ${value} into the ${field_label} field
    ${locator}=    Get Visible Textbox    ${field_label}
    Click    ${locator}
    Fill Text      ${locator}    ${value}

I click the ${button_name} button
    ${locator}=    Button By Text    ${button_name}
    Wait For Elements State    ${locator}    visible
    Click    ${locator}


I click the ${link_name} link
    ${locator}=    Link By Text    ${link_name}
    Wait For Elements State    ${locator}    visible
    Click    ${locator}


I verify the ${button_name} button is ${status} status
    ${locator}=    Button By Text    ${button_name}
    Wait For Elements State    ${locator}    ${status}


I verify the ${text_value} text is ${status} status
    ${locator}=    Text By Value    ${text_value}
    Wait For Elements State    ${locator}    ${status}

I verify the ${field_label} text field is ${status} status
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
I select the ${option} option under the ${checkbox_name} checkbox
    ${locator}=    Checkbox By Label    ${checkbox_name}    ${option}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    IF    not ${state}
        Check Checkbox    ${locator}
    END

I unselect the ${option} option under the ${checkbox_name} checkbox
    ${locator}=    Checkbox By Label    ${checkbox_name}    ${option}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    IF    ${state}
        Uncheck Checkbox    ${locator}
    END 

I verify the ${option} option under the ${checkbox_name} checkbox is checked
    ${locator}=    Checkbox By Label    ${checkbox_name}    ${option}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Be True    ${state}

I verify the ${option} option under the ${checkbox_name} checkbox is unchecked
    ${locator}=    Checkbox By Label    ${checkbox_name}    ${option}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Not Be True    ${state}

I verify the ${option} option under the ${checkbox_name} checkbox is ${status} status
    ${locator}=    Checkbox By Label    ${checkbox_name}    ${option}
    Wait For Elements State    ${locator}    ${status}

#radio
I select the ${option} option under the ${radio_name} radio button
    ${locator}=    Radio By Label    ${radio_name}    ${option}
    Wait For Elements State    ${locator}    visible
    Click    ${locator}

I verify the ${option} option under the ${radio_name} radio button is selected
    ${locator}=    Radio By Label    ${radio_name}    ${option}  
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Be True    ${state}

I verify the ${option} option under the ${radio_name} radio button is unselected
    ${locator}=    Radio By Label    ${radio_name}    ${option}
    Wait For Elements State    ${locator}    visible
    ${state}=    Get Checkbox State    ${locator}
    Should Not Be True    ${state}    

I verify the ${option} option under the ${radradio_name} checkbox is ${status} status
    ${locator}=    Radio By Label    ${radradio_name}    ${option}
    Wait For Elements State    ${locator}    ${status}

#combo box
I select the ${option} option under the ${combobox_name} combobox
    ${locator}=    Combobox Select By Name    ${combobox_name}
    Wait For Elements State    ${locator}    visible
    Select Options By    ${locator}    label    ${option}

I verify the ${option} option under the ${combobox_name} combobox is selected
    ${locator}=    Combobox Select By Name    ${combobox_name}
    Wait For Elements State    ${locator}    visible
    ${selected}=    Get Selected Options    ${locator}
    Should Contain    ${selected}    ${option}

I verify the ${option} option under the ${combobox_name} combobox is unselected
    ${locator}=    Combobox Select By Name    ${combobox_name}
    Wait For Elements State    ${locator}    visible
    ${selected}=    Get Selected Options    ${locator}
    Should Not Contain    ${selected}    ${option}

I verify the ${combobox_name} combobox is ${status} status
    ${locator}=    Combobox Select By Name    ${combobox_name}
    Wait For Elements State    ${locator}    ${status}
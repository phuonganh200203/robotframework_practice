*** Keywords ***

Textbox By Name Or Placeholder
    [Arguments]    ${value}
    RETURN
    ...    xpath=//input[@name="${value}" or @placeholder="${value}" or @data-qa="${value}"]


Button By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=(//button[normalize-space()="${text}"])


Link By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=(//a[normalize-space()="${text}"])


Text By Value
    [Arguments]    ${text}
    RETURN
    ...    xpath=(//*[contains(normalize-space(), "${text}")])[1]
*** Keywords ***

Textbox By Label Or Placeholder
    [Arguments]    ${label}
    RETURN
    ...    xpath=//input[@placeholder="${label}" or @name="${label}" or @data-qa="${label}"]


Button By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=(//button[normalize-space()="${text}"])


Link By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=//a[contains(normalize-space(), "${text}")]


Text By Value
    [Arguments]    ${text}
    RETURN
    ...    xpath=(//*[contains(normalize-space(), "${text}")])[1]

Checkbox By Label
    [Arguments]    ${label}
    RETURN
    ...    xpath=//input[@type="checkbox" and (@name="${label}" or @id="${label}")]

Radio By Label
    [Arguments]    ${label}
    RETURN
    ...    xpath=//input[@type="radio" and (@name="${label}" or @value="${label}" or @data-qa="${label}" or @id="${label}")]
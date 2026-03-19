*** Keywords ***

Textbox By Label Or Placeholder
    [Arguments]    ${label}
    RETURN
    ...    xpath=//input[@data-qa="${label}" or @name="${label}" or @placeholder="${label}"]


Button By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=//button[contains(normalize-space(), "${text}")]


Link By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=//a[contains(normalize-space(), "${text}")]


Text By Value
    [Arguments]    ${text}
    RETURN
    ...    xpath=(//*[contains(normalize-space(), "${text}")])[1]

Checkbox By Label
    [Arguments]    ${label}    ${option}
    RETURN
    ...    xpath=//*[contains(normalize-space(), "${label}")]//input[@type="checkbox" and (@name="${option}" or @id="${option}")]

Radio By Label
    [Arguments]    ${label}    ${option}
    RETURN
    ...    xpath=//input[@type="radio" and @name="${label}" and @value="${option}"]

Combobox Select By Name
    [Arguments]    ${name}
    RETURN
    ...    xpath=//select[@name="${name}"]

Combobox Select Option By Text
    [Arguments]    ${option}
    RETURN
    ...    xpath=//option[normalize-space()="${option}"]
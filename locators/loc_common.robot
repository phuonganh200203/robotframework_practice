*** Keywords ***

Textbox By Label
    [Arguments]    ${label}
    RETURN
    ...    xpath=//input[@name="${label}"]


Textbox By Placeholder
    [Arguments]    ${placeholder}
    RETURN
    ...    xpath=//input[@placeholder="${placeholder}"]


Textbox By DataQA
    [Arguments]    ${value}
    RETURN
    ...    xpath=//input[@data-qa="${value}"]


Button By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=//button[normalize-space()="${text}"]


Link By Text
    [Arguments]    ${text}
    RETURN
    ...    xpath=//a[normalize-space()="${text}"]
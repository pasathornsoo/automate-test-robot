*** Settings ***
Resource          ../common.resource.robot

*** Variables ***
${CREDIT_CARD_METHOD_LOCATOR}    css=div.method-list.d-flex.h-100

*** Keywords ***
Select Credit Card Payment Method
    Wait For Elements State    ${CREDIT_CARD_METHOD_LOCATOR}    visible    timeout=15s
    Scroll To Element          ${CREDIT_CARD_METHOD_LOCATOR}
    Click                      ${CREDIT_CARD_METHOD_LOCATOR}
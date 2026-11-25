*** Settings ***
Resource          ../common.resource.robot

*** Variables ***
${BEST_SELLER_1Y_LOCATOR}    css=div.price-save
${SUMMARY_PLAN_LOCATOR}      css=span.font-weight-bold.summary-plan
${SUMMARY_TOTAL_LOCATOR}     css=span.summary-total
${SUMMARY_DISCOUNT_LOCATOR}  css=span.summary-discount
${SUMMARY_AMOUNT_LOCATOR}    css=span.summary-amount

${CREDIT_CARD_METHOD_LOCATOR}    css=div.method-list.d-flex.h-100

*** Keywords ***
Select Best Seller 1 Year Package
    Wait For Elements State    ${BEST_SELLER_1Y_LOCATOR}    visible    timeout=15s
    Scroll To Element          ${BEST_SELLER_1Y_LOCATOR}
    Click                      ${BEST_SELLER_1Y_LOCATOR}

Select Credit Card Payment Method
    Wait For Elements State    ${CREDIT_CARD_METHOD_LOCATOR}    visible    timeout=15s
    Scroll To Element          ${CREDIT_CARD_METHOD_LOCATOR}
    Click                      ${CREDIT_CARD_METHOD_LOCATOR}

Verify Order Summary Matches Package
    [Arguments]    ${expected_plan}    ${expected_total}    ${expected_discount}    ${expected_amount}
    ${actual_plan}=        Get Text    ${SUMMARY_PLAN_LOCATOR}
    ${actual_total}=       Get Text    ${SUMMARY_TOTAL_LOCATOR}
    ${actual_discount}=    Get Text    ${SUMMARY_DISCOUNT_LOCATOR}
    ${actual_amount}=      Get Text    ${SUMMARY_AMOUNT_LOCATOR}

    Should Be Equal As Strings    ${actual_plan.strip()}        ${expected_plan}
    Should Be Equal As Strings    ${actual_total.strip()}       ${expected_total}
    Should Be Equal As Strings    ${actual_discount.strip()}    ${expected_discount}
    Should Be Equal As Strings    ${actual_amount.strip()}      ${expected_amount}
*** Settings ***
Resource          ../resources/pages/OrderPage.resource.robot
Resource          ../resources/pages/PaymentPage.resource.robot
Test Teardown     Close All Browsers

*** Test Cases ***
Verify Best Seller 1 Year With Credit Card Payment
    [Documentation]    เข้าหน้า Order -> เลือก Best Seller 1 Year -> เลือก Credit Card -> ตรวจ Summary[cite: 7]
    Open BullVPN Order Page
    Select Best Seller 1 Year Package
    Select Credit Card Payment Method
    Verify Order Summary Matches Package
    ...    expected_plan=1 Year (365 + 5)
    ...    expected_total=1,990 THB
    ...    expected_discount=0
    ...    expected_amount=1,990 THB
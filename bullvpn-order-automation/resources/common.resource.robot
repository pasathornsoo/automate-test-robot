*** Settings ***
Library           Browser
Library           String

*** Variables ***
${ORDER_URL}      https://www.bullvpn.com/order
${BROWSER}        chromium
${HEADLESS}       ${False}

*** Keywords ***
Open BullVPN Order Page
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1366, 'height': 900}
    New Page       ${ORDER_URL}
    Wait For Load State    networkidle

Close All Browsers
    Close Browser    ALL
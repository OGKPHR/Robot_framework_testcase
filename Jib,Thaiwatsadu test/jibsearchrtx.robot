*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}          chrome
${URL}              https://www.jib.co.th/web/
${FANCYBOX_CLOSE}   xpath=//a[@class="fancybox-item fancybox-close"]
${COOKIE_BANNER}    xpath=//a[@class='cc_btn cc_btn_accept_all' and @data-cc-event='click:dismiss']
${CATEGORY_LINK}    xpath=//a[@class='click_all' and contains(@href, 'product_category')]
${NVIDIA_LINK}      xpath=//a[@class='hover_cate3' and contains(@href, 'product_list/3/2615')]
${SORT_OPTION}      id=sort
${BUY_NOW_BUTTON}   xpath=//div[@class='cart_modal buy_promo' and @data-name='VGA (การ์ดแสดงผล) ASUS TUF GAMING GEFORCE RTX 4090 OC EDITION 24GB GDDR6X']
${MODAL_CONTENT}    xpath=//div[@class='modal-content']
${GO_TO_CART_BUTTON}    xpath=//button[@class='btn btn-warning']
${ADDRESS_LINK}     xpath=//a[@class='btn btn-primary btn-md cart-link' and contains(@href, 'cart/address/2')]

*** Test Cases ***
Open Website, Handle Popup, and Click Additional Link
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
    # Handle cookie consent banner if it appears
    Run Keyword And Ignore Error    Handle Cookie Banner    ${COOKIE_BANNER}

    # Wait for the fancybox close button to appear
    Wait Until Element Is Visible    ${FANCYBOX_CLOSE}    10s

    # Click on the fancybox close button
    Click Element    ${FANCYBOX_CLOSE}
    
    # Wait for the fancybox to close
    Wait Until Element Is Not Visible    ${FANCYBOX_CLOSE}    10s

    # Click on the Product Category link
    Wait Until Element Is Visible    ${CATEGORY_LINK}    10s
    Click Element    ${CATEGORY_LINK}

    # Wait for the Nvidia GeForce 40 Series link to be visible
    Wait Until Element Is Visible    ${NVIDIA_LINK}    10s
    Click Element    ${NVIDIA_LINK}

    # Wait for the sort dropdown to be visible
    Wait Until Element Is Visible    ${SORT_OPTION}    10s

    # Select the option "ราคา : มาก -> น้อย" (value=3) from the sort dropdown
    Select From List By Value    ${SORT_OPTION}    3

    # Wait for the "ซื้อเลย" button to be visible
    Wait Until Element Is Visible    ${BUY_NOW_BUTTON}    10s

    # Click on the "ซื้อเลย" button
    Click Element    ${BUY_NOW_BUTTON}

    # Wait for the modal content to be visible
    Wait Until Element Is Visible    ${MODAL_CONTENT}    10s

    # Click on the "ไปที่ตะกร้าสินค้า" button
    Click Element    ${GO_TO_CART_BUTTON}

    # Wait for the "ที่อยู่จัดส่ง" link to be visible
    Wait Until Element Is Visible    ${ADDRESS_LINK}    10s

    # Click on the "ที่อยู่จัดส่ง" link
    Click Element    ${ADDRESS_LINK}

    # Additional actions can be added here as needed

    # Close the browser
    Close Browser

*** Keywords ***
Handle Cookie Banner
    [Arguments]    ${banner_xpath}
    Wait Until Element Is Visible    ${banner_xpath}    10s
    Click Element    ${banner_xpath}

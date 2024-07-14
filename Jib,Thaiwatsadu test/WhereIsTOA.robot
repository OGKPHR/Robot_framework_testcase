
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               firefox
${URL}                   https://www.google.com/
${SEARCH_TEXT}           THAI WATSADU
${PRODUCT_URL}           https://www.thaiwatsadu.com/th/product/%E0%B8%AA%E0%B8%B5%E0%B8%99%E0%B9%89%E0%B8%B3%E0%B8%81%E0%B8%B6%E0%B9%88%E0%B8%87%E0%B9%80%E0%B8%87%E0%B8%B2-%E0%B8%A0%E0%B8%B2%E0%B8%A2%E0%B8%99%E0%B8%AD%E0%B8%81-TOA-%E0%B8%A3%E0%B8%B8%E0%B9%88%E0%B8%99-Supershield-Advance-%E0%B8%82%E0%B8%99%E0%B8%B2%E0%B8%94-9-%E0%B8%A5%E0%B8%B4%E0%B8%95%E0%B8%A3-%E0%B8%AA%E0%B8%B5%E0%B9%80%E0%B8%9A%E0%B8%AA-A-60000860
${TARGET_QUANTITY}       3
${POSTAL_CODE}           หนองจอก

*** Test Cases ***
Search Google, Close Popup, Click on Brand Link, and Click on TOA Brand
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text      name=q    ${SEARCH_TEXT}
    Press Keys      name=q    ENTER
    Wait Until Element Is Visible    css:a[href*="thaiwatsadu.com"]
    Click Element   css:a[href*="thaiwatsadu.com"]
    
    # Wait for the popup to appear and close it
    Wait Until Element Is Visible    css:i.bi.bi-x.font-extrabold.text-2xl.text-white
    Click Element    css:i.bi.bi-x.font-extrabold.text-2xl.text-white
    
    # Click on the brand link
    Wait Until Element Is Visible    css:a.header_navMenu__1sTYG.select-none
    Click Element    css:a.header_navMenu__1sTYG.select-none
    
    # Wait until the 'T' element is visible and clickable
    Wait Until Element Is Visible    xpath://div[@class="px-1 xl:px-0 bg-background sticky top-[3rem] lg:top-[6.5rem] mt-2"]//div[@class="flex items-center py-2 overflow-y-hidden overflow-x-scroll bg-background justify-between h-8"]//div[@class="mx-1 whitespace-nowrap rounded-xl leading-4 select-none cursor-pointer border border-transparent hover:border-primary " and child::div[contains(text(), 'T')]]    
    Click Element    xpath://div[@class="px-1 xl:px-0 bg-background sticky top-[3rem] lg:top-[6.5rem] mt-2"]//div[@class="flex items-center py-2 overflow-y-hidden overflow-x-scroll bg-background justify-between h-8"]//div[@class="mx-1 whitespace-nowrap rounded-xl leading-4 select-none cursor-pointer border border-transparent hover:border-primary " and child::div[contains(text(), 'T')]]

    # Click on the TOA brand link
    Click Element    css:a[href="/th/brand/TOA"]
    
    # Open the specific product page
    Go To    ${PRODUCT_URL}
    
    # Wait for a specific element on the product page to confirm it has loaded
    Wait Until Element Is Visible    css:input[aria-label="Quantity"]
    
    # Update the quantity value to 3 by clicking the "+" button
    ${current_value} =    Get Value    css:input[aria-label="Quantity"]
    ${current_value} =    Convert To Integer    ${current_value}
    WHILE    ${current_value} < ${TARGET_QUANTITY}
        Click Element    xpath://div[@class='w-1/4 bg-white hover:bg-[#6c757d] hover:text-white active:bg-[#6c757dee] px-1 text-center border h-7 flex items-center justify-center rounded-r' and contains(@class, 'rounded-r')]
        Sleep    1s  # Add a slight delay to ensure the click is registered
        ${current_value} =    Get Value    css:input[aria-label="Quantity"]
        ${current_value} =    Convert To Integer    ${current_value}
    END
    
    # Click on the 'ใส่รถเข็น' button
    Wait Until Element Is Visible    xpath://div[@class="w-1/3 lg:w-1/2 ps-2"]//button[@aria-label="add to cart"]
    Click Element    xpath://div[@class="w-1/3 lg:w-1/2 ps-2"]//button[@aria-label="add to cart"]
   
    # Type the postal code
    Wait Until Element Is Visible    css:input.pac-target-input
    Input Text    css:input.pac-target-input    ${POSTAL_CODE}
     Sleep    2s
      # Simulate arrow down using JavaScript
    Execute JavaScript    document.querySelector('input.pac-target-input').focus(); document.querySelector('input.pac-target-input').dispatchEvent(new KeyboardEvent('keydown', {'keyCode': 40, 'which': 40}));

    # Press the enter key
    Press Key    css:input.pac-target-input    \\10
 
    
     # Wait for the branch selection button to appear
    Wait Until Element Is Visible    //button[contains(text(), "เลือกสาขา")]
    
    # Click on the branch selection button associated with the branch name "หนองจอก"
    Click Element    //div[contains(., "หนองจอก")]/ancestor::div[@class="py-1.5 border-b flex px-1.5 "]//button[contains(text(), "เลือกสาขา")]


    
    # Wait for the confirmation button to appear
    Wait Until Element Is Visible    //button[@class="swal2-confirm swal2-styled swal2-default-outline"]
    
    # Click on the confirmation button
    Click Element    //button[@class="swal2-confirm swal2-styled swal2-default-outline"]
        # Wait for the cart icon to appear
    Sleep    2s
    Wait Until Element Is Visible    //a[@href="/th/cart"]
    
    # Click on the cart icon
    Click Element    //a[@href="/th/cart"]
    # Wait for the button to become visible
    Sleep    2s
    Wait Until Element Is Visible    //div[contains(text(), "ดำเนินการต่อ")]
  
    # Click on the button
    Click Element    //div[contains(text(), "ดำเนินการต่อ")]


    # Close the browser
    Close Browser

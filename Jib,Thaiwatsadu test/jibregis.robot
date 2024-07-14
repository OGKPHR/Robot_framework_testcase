*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}              https://www.jib.co.th/web/signin/register
${BROWSER}          edge
${NAME}             Johnsdads
${LASTNAME}         Doesdsds
${USER_TYPE}        บุคคลธรรมดา
${MOBILE}           0834234234
${EMAIL}            johndoesdasdss@outlook.co.th
${PASSWORD}         Mm?9?yxD%2e9Beb
${GENDER}           ชาย
${BIRTHDAY}         03
${BIRTHMONTH}       มกราคม
${BIRTHYEAR}        2002


*** Keywords ***
Handle Cookie Banner
    [Arguments]    ${banner_xpath}
    Wait Until Element Is Visible    ${banner_xpath}
    Click Element    ${banner_xpath}

*** Test Cases ***
Fill Out Form And Submit
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=name

    # Handle any cookie consent banner
    Handle Cookie Banner    xpath=//a[@class='cc_btn cc_btn_accept_all' and @data-cc-event='click:dismiss']

    # Fill in the form fields
    Input Text    id=name    ${NAME}
    Input Text    id=lastname    ${LASTNAME}
    Select From List By Label    id=user_type_cop    ${USER_TYPE}
    Input Text    id=mobile    ${MOBILE}
    Input Text    id=email    ${EMAIL}
    Input Text    id=email_con    ${EMAIL}
    Input Text    id=password    ${PASSWORD}
    Input Text    id=confirmpassword    ${PASSWORD}
    Select From List By Label    id=gender    ${GENDER}
    Select From List By Value    id=bday    ${BIRTHDAY}
    Select From List By Label    id=bmonth    ${BIRTHMONTH}
    Select From List By Value    id=byear    ${BIRTHYEAR}

    # Check the agreement checkbox
    Click Element    id=f_confirm

    # Ensure the submit button is enabled and click it
    Wait Until Element Is Enabled    xpath=//button[@type='submit' and contains(text(),'ยืนยันการสมัคร')]
    Click Button    xpath=//button[@type='submit' and contains(text(),'ยืนยันการสมัคร')]


    # Close the browser
    Close Browser
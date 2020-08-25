*** Settings ***
Library           AppiumLibrary
Resource         ../Poc_Dtac/Resource/PageKeywords/LoginwithFacebook_PageKeyword.robot

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub      # URL to appium server
${PLATFORM_NAME}    iOS   #Android    #iOS
${PLATFORM_VERSION}   13.6   #8.0.0   #12.4.8   #13.5
${DEVICE_NAME}    iPhone 11   #Galaxy S7   #Galaxy S7  #iPhone 6_test
#Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}    /Users/pearbum/Library/Developer/Xcode/DerivedData/ProjectDemo-doodbtbtzaqyzlehdupmgmdxdeyd/Build/Products/Debug-iphonesimulator/ProjectDemo.app
${BUNDLE_ID}         com.onionshack.ProjectDemo
${APP_PACKAGE}    com.onionshack.projectdemo
${APP_ACTIVITY}       com.onionshack.projectdemo.MainActivity
#path
${txtbutton}     	xpath=//XCUIElementTypeButton[@name="DTAC"]
${txtDtac}     DTAC
${PLATFORM}     ${ar_OS}

*** Keywords ***
Android Open app
     Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}

iOS Open App     
     Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}
      ...    deviceName=${DEVICE_NAME}      app=${APP_LOCATION}     #automationName=appium   

Verify text button
     Element Text Should Be      ${txtbutton}      ${txtDtac}

Close All Apps
     Capture Page Screenshot
     Close All Applications

Open App 
     Run Keyword If    "${PLATFORM}"=="Android"    Android Open app
     ...    ELSE IF     "${PLATFORM}"=="iOS"   iOS Open App

*** Test Cases ***
test_demo
     Open App 
     Verify text button
     Close All Apps
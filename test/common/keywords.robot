# atest Test Suite
# Settings section is used for importing external libraries and resources, defining metadata for test suites and test cases etc.
*** Settings ***

# REST Library usage with url variable, provides simple http requests and json response validation
Library         REST    ${baseurl}

*** Keywords ***
Detail requested for user "${user_id}"
    GET         /users/${user_id}

User company is "${company_name}"
    String      response body company name  ${company_name}

Email is "${email}"
    String      response body email  ${email}

Log setup
    Log         "Hello"

Log teardown
    Log         "Good bye"
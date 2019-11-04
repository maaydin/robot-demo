# atest Test Suite
# Settings section is used for importing external libraries and resources, defining metadata for test suites and test cases etc.
*** Settings ***

# REST Library usage with url variable, provides simple http requests and json response validation
Library         REST    ${baseurl}

# BuiltIn Library usage, Robot Framework's standard library that provides a set of generic keywords needed often 
Library         BuiltIn

# Resource declaration for common keywords developed inhouse, provides ability to run test with Gherkin DSL
Resource        ../common/keywords.robot

# Documentation provides brief info about test scenarios included in this robot file
Documentation   This test suite is developed for the evaluation tests for robot framework and RESTinstance library

# Test Setup runs before each scenario
Test Setup       Log setup

# Test Teardown runs after each scenario
Test Teardown    Log teardown

# Variables are an integral feature of Robot Framework, and they can be used in most places in test data.
*** Variables ***

# Scalar variable declaration
${baseurl}      https://jsonplaceholder.typicode.com
${json}         {
...                 "id": 11, 
...                 "name": "Gil Alexander"
...             }

# Dictionary variable declaration
&{dict}         id=1    name=Leanne Graham

# Test cases are constructed in test case tables from the available keywords
*** Test Cases ***

# This test uses custom developed keywords and mimics cucumber with Gherkin format, providing Given/When/Then is optional
Get user by id and validate company and email
    # Test case documentation
    [Documentation]    This test uses custom developed keywords and mimics cucumber with Gherkin format, providing Given/When/Then is optional

    # Test case tags, test case execution can be filtered on run time by tags
    [Tags]    smoke    regression  

    # Test steps defined by keywords 
    Given detail requested for user "1"
    When user company is "Romaguera-Crona"
    Then email is "Sincere@april.biz"

# This test uses RESTinstance keywords to make HTTP requests and assert values in json response easily
Get an existing user
    # Test case documentation
    [Documentation]    This test uses RESTinstance keywords to make HTTP requests and assert values in json response easily
    # Test case tags, test case execution can be filtered on run time by tags
    [Tags]    smoke    regression   operational     performance    

    # Test steps defined by keywords
    &{res}=     GET         /users/1 
                Object      response body
                Integer     response body id  
                String      response body name

    &{payload}=  Evaluate   json.loads("""${json}""")  json
                 Output         ${payload.name}

                GET         /users/${res.body['id']}
                Object      response body
                Integer     response body id                    1
                String      response body name                  ${dict.name}
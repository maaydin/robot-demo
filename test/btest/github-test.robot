# atest Test Suite
# Settings section is used for importing external libraries and resources, defining metadata for test suites and test cases etc.
*** Settings ***

# REST Library usage, provides simple http requests and json response validation
Library         REST    https://jsonplaceholder.typicode.com

# Documentation provides brief info about test scenarios included in this robot file
Documentation   This test suite is developed for the evaluation tests for robot framework and RESTinstance library

*** Test Cases ***
GET an existing user, notice how the schema gets more accurate
    &{res}=    GET    /users/1 
    Object     response body
    Integer    response body id  
    String     response body name

    GET        /users/${res.body['id']}
    Object     response body
    Integer    response body id  
    String     response body name
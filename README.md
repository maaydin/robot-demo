# Robot Framework Playground

This repo is a playground to test robot frameworks capabilities.

## Installation

```
virtualenv venv 
source venv/bin/activate
pip install robotframework RESTinstance
mkdir results
```

## Running
To execute all tests run below command.
```
robot --outputdir results --variable baseurl:https://jsonplaceholder.typicode.com test/
```
To execute only smoke tests run below command
```
robot -i smoke --outputdir results --variable baseurl:https://jsonplaceholder.typicode.com test/
```
To execute operational tests and store the results to splunk run below command.
```
robot -i operational --outputdir results --listener listeners/LogSplunk.py  --variable baseurl:https://jsonplaceholder.typicode.com test/
```


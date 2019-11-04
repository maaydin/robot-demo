"""Listener that indexes execution to splunk as an event."""
import os
import http.client
import ssl

ROBOT_LISTENER_API_VERSION = 3
splunkToken = os.getenv('SPLUNKTOKEN','a872b444-a618-4cb0-bb28-e2b223a417c8')

def end_test(data, result):
    print()
    print("### Log Results to Splunk ###")
    print('Test "%s" completed in %s miliseconds with status %s.' % (result.name, result.elapsedtime, result.status))
    conn = http.client.HTTPSConnection("localhost", 8088, context = ssl._create_unverified_context())
    headers = {'Authorization': 'Splunk ' + splunkToken}
    data = '{"event": {"testcase": "%s", "elapsedtime": "%s", "status": "%s"}, "sourcetype": "opmon"}' % (result.name, result.elapsedtime, result.status)
    conn.request("POST", "/services/collector", data, headers)
    response = conn.getresponse()
    print("Index result to splunk: Status: " + str(response.status) + ", Response: " + str(response.read()))
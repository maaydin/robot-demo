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
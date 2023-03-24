Feature: Sample get request

 

Background:

 

 *url 'https://api.realworld.io'

 

Scenario: Testing sample get request by sending param and path

Given path '/api/articles'

And param limit= '1'

And param offset= '0'

When method GET

Then status 200

 

Scenario: Assertions in get

Given path '/api/articles'

When method GET

Then status 200

Then match responseType == 'string'

Then match response.articles[*].username contains ["George"]

 

Scenario: Create a token

Given path '/api/articles/login'

And request { "email" : "realworld21@gmail.com", "password": "real32" }

When method POST

Then status 200

* def auth_token = response.token

 

Scenario: Pass request as a parameter

Given path '/api/articles'

And header Authorization = 'Bearer' + auth_token

* def body = read ("data/postrequest.json")

And request body

* def response_body=response

When method POST

Then status 200

 

Scenario: Updating a record

Given path '/api/articles'

And param username= 'George'

And header Authorization = 'Bearer' + auth_token

* def response_update=read ("data/updaterequest.json")

And request response_update

When method PUT

Then status 200

Then print response

 

Scenario: Deleting a record

Given path '/api/articles'

And param username= 'George'

When method delete

Then status 200

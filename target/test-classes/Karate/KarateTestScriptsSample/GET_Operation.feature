Feature: fetching first article
Scenario: testing the get call for fetching first article
 
Given url 'https://api.realworld.io/api/articles?limit=1&offset=0'
When method GET
Then status 200
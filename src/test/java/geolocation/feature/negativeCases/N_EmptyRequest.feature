# Validating that a blank request gives 404 as it takes ip address of the
# sender and we are setting considerIp:false and 411 when not sending anything
@negativeCases
Feature: Testing Blank Request to Geolocation API

  Scenario: Send an empty POST request with considerIP as false
    * def reqPayload = {"considerIp": false}
    * print reqPayload
    Given url baseUrl
    And request reqPayload
    When method post
    Then status 404
    And response.error.message == "Not Found"

  Scenario: Send an empty POST request should get 411 as Length Required
    Given url baseUrl
    When method post
    Then status 411
@utils
Feature: To return response for geolocation api

  Scenario: Provide response to the payload
    Given url baseUrl
    And request reqPayload
    * print reqPayload
    When method post
    Then status 200
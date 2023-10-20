# Validating that implausibleLocation gives 404 when consider IP is false
@negativeCases
Feature: Negative Location Test Request to Geolocation API

  Scenario: Send Request with Implausible Location
    Given url baseUrl
    * def reqPayload = read('payloads/implausibleLocationRequest.json')
    * print reqPayload
    And request reqPayload
    When method post
    Then status 404
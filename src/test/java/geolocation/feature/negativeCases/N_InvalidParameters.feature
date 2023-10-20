# Validating that implausibleLocation gives 404 when consider IP is false
@negativeCases
Feature: Testing Invalid Parameters

  Scenario: Send Request with Invalid Parameters
    Given url baseUrl
    * def reqPayload = read('payloads/simpleValidRequest.json')
    # Modify parameters to introduce invalid values
    * set reqPayload.homeMobileCountryCode = 'InvalidCountryCode'
    * set reqPayload.homeMobileNetworkCode = 'InvalidNetworkCode'
    * print reqPayload
    And request reqPayload
    When method post
    Then status 400
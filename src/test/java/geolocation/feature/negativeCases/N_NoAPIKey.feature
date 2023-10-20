# Validate that no API KEY gives 403 unauthorised error
@negativeCases
Feature: Testing no API Key

  Scenario: Send Request with Invalid API Key Format
    Given url 'https://www.googleapis.com/geolocation/v1/geolocate?key='
    And request {}
    When method POST
    Then status 403
    And response.error.message == "The request is missing a valid API key."
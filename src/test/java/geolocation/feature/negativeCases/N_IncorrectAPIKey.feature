# Validate that invalid API KEY gives 400 error
@negativeCases
Feature: Testing Invalid API Key Format

  Scenario: Send Request with Invalid API Key Format
    Given url 'https://www.googleapis.com/geolocation/v1/geolocate?key=INVALID_API_KEY'
    And request {}
    When method POST
    Then status 400
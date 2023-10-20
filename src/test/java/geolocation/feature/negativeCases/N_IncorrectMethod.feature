# Validating that incorrect method gives 404
@negativeCases
Feature: Testing incorrect method Request to Geolocation API

  Scenario: Send a GET request
    Given url baseUrl
    * def reqPayload = read('payloads/simpleValidRequest.json')
    * method get
    * status 404
# Validating with Different Carriers
@positiveCases
Feature: Testing the Geolocation API with different carriers

  Scenario Outline: Testing with common and uncommon carriers

    * def expectedValues = read('responses/validDifferentCarriers.json')
    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.carrier = "<carrier>"

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)

    # validating exact values, schema and lat long range
    * validateExactApiResponseLatLongAndSchema(ApiResponse.response,expectedValues)
    
    Examples:
      | carrier     |
      | T-Mobile CZ |
      | Vodafone    |
      | 中国移动      |
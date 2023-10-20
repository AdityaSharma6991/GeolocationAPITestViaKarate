# Validating with Different Carriers
@positiveCases
Feature: Requesting Location by IP Address

  Scenario: Verify that the API can accurately determine the device's location based on IP address only

    * def expectedValues = read('responses/validLocationByIPAddress.json')
    * def reqPayload = read('payloads/locationByIPAddress.json')

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)

    # validating approx values, schema and lat long range
    * validateApproxApiResponseLatLongAndSchema(ApiResponse.response,expectedValues.location.lat,expectedValues.location.lng)


  Scenario: Verify that the API determines location based on the provided cell towers and wifiAccessPoints if considerIp is false

    * def expectedValues = read('responses/validConsiderIPFalse.json')
    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.considerIp = "false"

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)

    # validating approx values, schema and lat long range
    * validateApproxApiResponseLatLongAndSchema(ApiResponse.response,expectedValues.location.lat,expectedValues.location.lng)
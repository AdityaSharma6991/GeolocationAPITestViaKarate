# Testing with Multiple Wi-Fi Networks
@positiveCases
Feature: Testing the Geolocation API with multiple Wi-Fi networks

  Scenario Outline: Testing with single and multiple Wi-Fi networks
    * def expectedValues = read('responses/validMultipleWifiNetworks.json')
    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.wifiAccessPoints = <wifiAccessPoints>

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)

    # validating exact values, schema and lat long range
    * validateExactApiResponseLatLongAndSchema(ApiResponse.response,expectedValues)

    Examples:
      | wifiAccessPoints                                                        |
      | [{"macAddress":"00:11:22:33:44:59"},{"macAddress":"66:77:88:99:AA:BB"}] |
      | [{"macAddress":"00:11:22:33:44:55"}]                                    |
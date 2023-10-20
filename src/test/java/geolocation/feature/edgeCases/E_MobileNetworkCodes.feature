# Validating edge values of mobileNetworkCode for different radio types
@edgeCases
Feature: Testing Mobile Network Codes for different radio types Edge Values

  Scenario Outline: Testing edge values with Mobile Network Codes for <radioType>

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.homeMobileNetworkCode = <homeMobileNetworkCode>
    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | homeMobileNetworkCode |
      | gsm       | 0                     |
      | gsm       | 999                  |
      | wcdma     | 0                    |
      | wcdma     | 999                  |
      | lte       | 0                    |
      | lte       | 999                  |
      | cdma      | 0                    |
      | cdma      | 32767                |
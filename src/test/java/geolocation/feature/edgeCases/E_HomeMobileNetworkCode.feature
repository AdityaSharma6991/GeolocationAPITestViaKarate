# Validating edge values of homeMobileNetworkCode and newRadioCellId for nr radio types and others
@edgeCases
Feature: Testing HomeMobileNetworkCode and newRadioCellId for nr radio type edge cases

  Scenario Outline: Testing edge values of homeMobileNetworkCode for <radioType>

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.homeMobileNetworkCode = <homeMobileNetworkCode>
    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | homeMobileNetworkCode |
      | gsm       | 0                     |
      | gsm       | 999                   |
      | wcdma     | 0                     |
      | wcdma     | 999                   |
      | lte       | 0                     |
      | lte       | 999                   |
      | cdma      | 0                     |
      | cdma      | 32767                 |

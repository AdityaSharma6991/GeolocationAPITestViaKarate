# Validating edge values of mobileCountryCode for different radio types
@edgeCases
Feature: Testing Mobile Country Code for different radio types Edge Values

  Scenario Outline: Testing edge values of mobileCountryCode for <radioType>

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.cellTowers[0].mobileCountryCode = <mobileCountryCode>
    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | mobileCountryCode |
      | gsm       | 0                 |
      | gsm       | 999               |
      | wcdma     | 0                 |
      | wcdma     | 999               |
      | lte       | 0                 |
      | lte       | 999               |
# Validating edge values of homeMobileCountryCode and newRadioCellId for nr radiotype and others
@edgeCases
Feature: Testing HomeMobileCountryCode for various radio type edge cases

  Scenario Outline: Testing edge values of homeMobileCountryCode for <radioType>

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.homeMobileCountryCode = <homeMobileCountryCode>
    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | homeMobileCountryCode |
      | gsm       | 0                     |
      | gsm       | 999                   |
      | wcdma     | 0                     |
      | wcdma     | 999                   |
      | lte       | 0                     |
      | lte       | 999                   |
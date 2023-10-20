# Validating with Different homeMobileCountryCode - radioType combinations
@positiveCases
Feature: Testing the Geolocation API with different combinations of homeMobileCountryCode - radioType - homeMobileNetworkCode

  Scenario Outline: Testing with radioType gsm (default), wcdma, lte and nr within valid range of homeMobileCountryCode & homeMobileNetworkCode

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.homeMobileCountryCode = <homeMobileCountryCode>
    * set reqPayload.homeMobileNetworkCode = <homeMobileNetworkCode>

    * if (reqPayload.radioType == "nr") reqPayload.cellTowers[0].newRadioCellId = <newRadioCellId>

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | homeMobileCountryCode | homeMobileNetworkCode | newRadioCellId |
      | gsm       | 101                   | 900                   | null           |
      | wcdma     | 123                   | 459                   | null           |
      | lte       | 513                   | 687                   | null           |
      | nr        | 900                   | 999                   | 68719476735    |
      | cdma      | null                  | 32767                 | null           |
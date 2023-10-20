# Validating edge values of homeMobileCountryCode, homeMobileNetworkCode, locationAreaCode, mobileCountryCode, mobileNetworkCodes, newRadioCellId, for NR radio type
@edgeCases
Feature: Testing Edge Cases for nr Radio Type

  Scenario Outline: Testing Edge Cases for nr Radio Type

    * def reqPayload = read('payloads/Edge_RadioTypeNR.json')
    * set reqPayload.homeMobileCountryCode = <homeMobileCountryCode>
    * set reqPayload.homeMobileNetworkCode = <homeMobileNetworkCode>
    * set reqPayload.cellTowers[0].locationAreaCode = <locationAreaCode>
    * set reqPayload.cellTowers[0].mobileCountryCode = <mobileCountryCode>
    * set reqPayload.cellTowers[0].mobileNetworkCodes = <mobileNetworkCodes>
    * set reqPayload.cellTowers[0].newRadioCellId = <newRadioCellId>

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)

   * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | homeMobileCountryCode | homeMobileNetworkCode | locationAreaCode | mobileCountryCode | mobileNetworkCodes | newRadioCellId |
      | 0                     | 0                     | 0                | 0                 | 0                  | 68719476735    |
      | 999                   | 999                   | 16777215         | 999               | 999                | 0              |
      | 0                     | 999                   | 0                | 0                 | 0                  | 68719476735    |
      | 999                   | 0                     | 16777215         | 999               | 0                  | 0              |
      | 0                     | 999                   | 16777215         | 0                 | 999                | 68719476735    |
      | 999                   | 0                     | 0                | 999               | 999                | 0              |
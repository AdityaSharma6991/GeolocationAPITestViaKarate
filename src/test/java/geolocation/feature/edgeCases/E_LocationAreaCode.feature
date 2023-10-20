# Validating edge values of locationAreaCode for different radio types and others
@edgeCases
Feature: Testing Edge Values of locationAreaCode for different radio types edge cases

  Scenario Outline: Testing edge values for locationAreaCode with <radioType>

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.cellTowers[0].locationAreaCode = <locationAreaCode>
    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | locationAreaCode      |
      | gsm       | 0                     |
      | gsm       | 65535                 |
      | wcdma     | 0                     |
      | wcdma     | 65535                 |
      | lte       | 0                     |
      | lte       | 65535                 |
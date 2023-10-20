# Validating CellId Values for Different Radio Types
@edgeCases
Feature: Testing cellId for different radio types Edge Values

  Scenario Outline: Testing Valid CellId Ranges for Radio Types

    * def reqPayload = read('payloads/simpleValidRequest.json')
    * set reqPayload.radioType = "<radioType>"
    * set reqPayload.cellTowers[0].cellId = <cellId>
    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)
    * validateApiResponseLatLongRangeAndSchema(ApiResponse.response)

    Examples:
      | radioType | cellId    |
      | GSM       | 0         |
      | GSM       | 65535     |
      | CDMA      | 0         |
      | CDMA      | 65535     |
      | WCDMA     | 0         |
      | WCDMA     | 268435456 |
      | LTE       | 0         |
      | LTE       | 268435490 |
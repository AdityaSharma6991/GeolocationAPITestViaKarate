# Validating Response Location
@positiveCases
Feature: Validating the Geolocation API response location based on different cell towers

  Scenario Outline: Validating the response location with known input data

    * def expectedValues = read('responses/validResponseLocation.json')
    * def reqPayload = read('payloads/cellTowers/<cellTowers>.json')

    * def ApiResponse = karate.call('../SimpleRequest.feature', reqPayload)

    # validating approx values, schema and lat long range
    * validateApproxApiResponseLatLongAndSchema(ApiResponse.response,expectedValues.<cellTowers>.location.lat,expectedValues.<cellTowers>.location.lng)

    Examples:
      | cellTowers                  |
      | withOptionalFieldRequest    |
      | withoutOptionalFieldRequest |
      | NR5GCellTower               |
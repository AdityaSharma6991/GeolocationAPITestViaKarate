@utils
Feature: Reusable Validations

  Background:
    * def expectedResponseSchema = read('responses/validResponseSchema.json')

  Scenario: Validations for responses

    # Validate Latitude and Longitude Ranges within -90<latitude<90 and -180<longitude<180
    * def validateLatLongRange =
    """
    function(latitude, longitude){
      if (latitude < -90 || latitude > 90) {
        return false;
      }
      if (longitude < -180 || longitude >= 180) {
        return false;
      }
      return true;
    }
    """

    * def validateApiResponseLatLongRangeAndSchema =
    """
    function(ApiResponse){
      const result = karate.match(ApiResponse,expectedResponseSchema);
      if (!(result.pass)) {
        karate.fail("Schema doesn't match");
        console.log(JSON.stringify(result.message, null, 2));
        }
      if (!(validateLatLongRange(ApiResponse.location.lat, ApiResponse.location.lng))){
        karate.fail("Latitude or Longitude is out of range");
      }
    }
    """

    * def validateExactApiResponseLatLongAndSchema =
    """
    function(ApiResponse,expectedValues){
      const result = karate.match(ApiResponse,expectedResponseSchema);
      if (!(result.pass)) {
        karate.fail("Schema doesn't match");
        console.log(JSON.stringify(result.message, null, 2));
        }
      if (!(validateLatLongRange(ApiResponse.location.lat, ApiResponse.location.lng))) {
        karate.fail("Latitude or Longitude is out of range");
      }
      if (!(ApiResponse.location.lat == expectedValues.location.lat)) {
        karate.fail("Latitude mismatch doesn't match");
        console.log("CUSTOM ERROR MESSAGE: Expected longitude "+expectedValues.location.lat+" doesn't match actual "+ApiResponse.location.lat);
      }
      if (!(ApiResponse.location.lng == expectedValues.location.lng)) {
        karate.fail("Longitude mismatch doesn't match");
        console.log("CUSTOM ERROR MESSAGE: Expected longitude "+expectedValues.location.lng+" doesn't match actual "+ApiResponse.location.lng);
      }
    }
    """

    * def validateApproxApiResponseLatLongAndSchema =
    """
    function(ApiResponse,latitude,longitude){
      const result = karate.match(ApiResponse,expectedResponseSchema);
      const responseLocation = ApiResponse.location
      if (!(result.pass)) {
        karate.fail("Schema doesn't match");
        console.log(JSON.stringify(result.message, null, 2));
        }
      if (!(validateLatLongRange(responseLocation.lat, responseLocation.lng))) {
        karate.fail("Latitude or Longitude is out of range");
      }
      const roundedLatitude = Math.round(responseLocation.lat)
      if (!(roundedLatitude == latitude)) {
        karate.fail("Latitude mismatch doesn't match");
        console.log("CUSTOM ERROR MESSAGE: Expected longitude "+roundedLatitude+" doesn't match actual "+latitude);
      }
      const roundedLongitude = Math.round(responseLocation.lng)
      if (!(roundedLongitude == longitude)) {
        karate.fail("Longitude mismatch doesn't match");
        console.log("CUSTOM ERROR MESSAGE: Expected longitude "+roundedLongitude+" doesn't match actual "+longitude);
      }
    }
    """
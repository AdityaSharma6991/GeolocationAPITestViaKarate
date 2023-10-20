function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    API_KEY: "AIzaSyCnTiF4rwIbp1uKIXkCkvUuSzwLrfNRpkU",
    baseUrl: "https://www.googleapis.com/geolocation/v1/geolocate"
  };

  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }

  // Add the API key as a query parameter to the base URL
  config.baseUrl = config.baseUrl + "?key=" + config.API_KEY;

  var reusableValidations = function() {
    return karate.callSingle('classpath:geolocation/feature/utilities/ReusableValidations.feature',config);
  }
  config = reusableValidations();

  return config;
}

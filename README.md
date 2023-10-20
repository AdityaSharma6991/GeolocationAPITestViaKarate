# GeolocationAPITestViaKarate

Geolocation API Automation Project

This project automates the testing of the Geolocation API using Karate, JUnit 5, and Maven with Java 21. The tests are tagged with @positiveCases, @negativeCases, and @edgeCases to indicate the type of test case.

To set up the test project, you will need to install the following dependencies:

    Karate
    JUnit 5
    Maven
    Java 21

Once you have installed the dependencies, you will need to configure the API key. To do this, create a file called api_key.txt in the root directory of the project and add your API key to the file.

To run the tests, simply run the following command:

mvn test


The test results will be generated in the `target/test-reports` directory.

The test report can be viewed in a web browser by opening the `target/test-reports/index.html` file.

The tests are tagged with the following tags:

* `@positiveCases`: Positive test cases
* `@negativeCases`: Negative test cases
* `@edgeCases`: Edge cases

To run only the tests with a specific tag, you can use the following command:

mvn test -Dtags=<tag>


For example, to run only the positive test cases, you would run the following command:

mvn test -Dtags=@positiveCases

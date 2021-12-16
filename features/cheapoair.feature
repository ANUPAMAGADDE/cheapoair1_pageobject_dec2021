Feature: cheapoair Flight Search Functionality

  Scenario: Verify user is able to search for the available for a future dates
    Given user is on the cheapoair homepage
    When user selects the flights tab
    And user choose round trip option
    And user search for "Columbus" city and select "CMH" airport for departure
    And user search for "Cleveland" city and select "CLE" airport for arrival
    And user choose future dates for the arrival and depature dates
    And search for the available flights
    Then verify user should see the available flights
    And verify user gets the flight for the selected dep date


  Scenario: verify user is able to search for the available flights for a future dates in declarative style
    Given user is on the cheapoair homepage
    When user selects the flight tab
    Then verify user should see the available flights
    And verify user gets the flight for the selected dep date


  Scenario Outline: verify user is able to search for the available flights for a future dates for different destinations
    Given user is on the cheapoair homepage
    When user selects the flights tab
    And user choose round trip option
    And user search for the <dep_city_name> city and selects <dep_airport_name> airport for departure
    And user search for the <arr_city_name> city and selects <arr_airport_name> airport for arrival
    And user choose future dates for the arrival and departure dates
    And search for  the available flights
    Then verify user should see the available flights
    And verify user gets the flight  results for the selected dep date
    Examples:
      | dep_city_name | dep_airport_name | arr_city_name | arr_airport_name|
      | Colimbus      |  CMH             | Cleveland     | CLE             |
      | Chicago       | ORD              | Columbus      | CMH             |


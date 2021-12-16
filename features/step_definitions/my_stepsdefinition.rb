Given(/^user is on the cheapoair homepage$/) do
  visit Cheapoairhomepage
end

When(/^user selects the flights tab$/) do
  on (Cheapoairhomepage).select_flights_tab_element.click
end

And(/^user choose round trip option$/) do
  on (Cheapoairhomepage).select_roundtrip_tab_element.click
end

And(/^user search for "([^"]*)" city and select "([^"]*)" airport for departure$/) do |city_name, airport_code|
  on(Cheapoairhomepage).choose_dep_airport city_name, airport_code
end

And(/^user search for "([^"]*)" city and select "([^"]*)" airport for arrival$/) do |city_name, airport_code|
  on(Cheapoairhomepage).choose_arr_airport city_name, airport_code
end

And(/^user choose future dates for the arrival and depature dates$/) do
    on(Cheapoairhomepage).choose_dep_date 1
    on(Cheapoairhomepage).choose_arr_date 2
end

And(/^search for the available flights$/) do
  on(Cheapoairhomepage).submit_button_element.click
end

Then(/^verify user should see the available flights$/) do
  fail "No results are found" unless on(CheapoairFlightSearchResultspage).get_flight_results_count > 1
end

And(/^verify user gets the flight for the selected dep date$/) do
  exp_date = on(CheapoairFlightSearchResultspage).display_date_format_in_search_results 1
  actual_date =on(CheapoairFlightSearchResultspage).flight_results_title_element.text
  verify_partial_text_exists? exp_date, actual_date
end
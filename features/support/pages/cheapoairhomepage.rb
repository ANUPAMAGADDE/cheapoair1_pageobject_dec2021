class Cheapoairhomepage

  include pageobject

  page_url "www.cheapoair.com"

  link(:select_flights_tab, class: 'tabs__link is-first is-active', index: 0)
  link(:select_hotels_tab, class: 'tabs__link is-first is-active', index: 2)
  link(:select_cars_tab, class: 'tabs__link is-first is-active', index: 3)
  button(:leaving_from_button, aria_label: 'Leaving from')
  button(:going_to_button, aria_label: 'Going_to')

  def search_dep_airport dep_city, dep_airport
    # @browser.link(pages: 'suggestion-box__clear icon', index: 0).click if @browser.link(pages: 'suggestion-box__clear icon', index: 0).present?
    clear_dep_search = @browser.link(class: 'suggestion-box__clear icon', index: 0)
    clear_dep_search.click if clear_dep_search.present?
    @browser.text_field(id: 'from0').set dep_city
    sleep 2
    @browser.ul(class: 'suggestion-box__list autoSuggest__list').lis.each do |all_airports|
      p all_airports.text
      if all_airports.text.include? dep_airport
        all_airports.click
        break
      end
    end
    sleep 2
  end

  def search_arr_airport arr_city, arr_airport
    # @browser.link(pages: 'suggestion-box__clear icon', index: 1).click if @browser.link(pages: 'suggestion-box__clear icon', index: 1).present?
    clear_arr_search = @browser.link(class: 'suggestion-box__clear icon', index: 1)
    clear_arr_search.click if clear_arr_search.present?

    @browser.text_field(id: 'to0').set arr_city
    sleep 2
    @browser.ul(class: 'suggestion-box__list autoSuggest__list', index: 1).lis.each do |all_airports|
      p all_airports.text
      if all_airports.text.include? arr_airport
        all_airports.click
        break
      end
    end
  end
end

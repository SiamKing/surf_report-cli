class Scraper

  def self.scrape_index_page
    doc = Nokogiri::HTML(open("http://www.surfline.com/surf-forecasts/southern-california/south-los-angeles_2951"))
    days = doc.css("div.day-slider-container")
    # children indexes are odd numbers - 1, 3, & 5 so I'm setting them equal to their own array
    surf_days = [days.children[1], days.children[3], days.children[5]]
    # iterating to create a hash of days with date, forecast, wave size, wave description, and swell direction
    surf_days.collect do |day|
      { :date => day.children.css("span")[0].text,
        :forecast => day.css("strong").text,
        :wave_size => day.css("h1").text,
        :wave_description => day.children.css("span")[2].text,
        :swell_direction => day.children.css("span")[3].text }
      end

    end
  end


# all info are nested in divs
  # days = doc.css("div.day-slider-container").text

  # surf_days = [days.children[1], days.children[3], days.children[5]]
  # :date => day.children.css("span")[0].text
  # :forecast => day.css("strong").text
  # :wave_size => day.children.css("span")[2].text
  # :wave_description => day.children.css("span")[3].text}
  # dates = days.children[1].children.css("span")[0].text
  # wave_size = days.children[1].children.css("span")[2].text
  # wave_description = days.children[1].children.css("span")[3].text




  # Scrape webpage for 3 days:
  # => each day has:
  # =>    date
  # =>    brief forecast
  # =>    wave_size
  # =>    wave_description
  # =>    swell_direction

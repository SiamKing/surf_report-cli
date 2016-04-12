class SurfReport::CLI

  def call
    make_days
    list_surf_reports
    menu
    later
  end

  def make_days
    days_array = Scraper.scrape_index_page
    SurfReport::Report.create_from_collection(days_array)
  end

  def list_surf_reports
    puts "\n"
    puts "******".colorize(:blue) + "3 Day Surf Report for Los Angeles".colorize(:black) + "******".colorize(:blue)
    puts "\n"
    @days = SurfReport::Report.all
    @days.each.with_index(1) do |day, i|
      puts "#{i}. ".colorize(:magenta) + "#{day.date}".colorize(:black) + " - #{day.forecast.colorize(:blue)}"
    end
  end

  def menu
    input = nil
    while input != "later"
      puts "\n"
      puts "What number would you like to see a detailed report for? Oh yeah...you can type 'list' to see the days again or 'later' to get outta here!"
      input = gets.strip.downcase

      if input.to_i.between?(1, 3)
        the_day = @days[input.to_i - 1]
        puts "\n"
        puts "The date you chose is #{the_day.date}".colorize(:red)
        puts "Wave Height : ".colorize(:cyan) + "#{the_day.wave_size.colorize(:black)}"
        puts "Wave Description: ".colorize(:cyan) + "#{the_day.wave_description.colorize(:black)}"
        puts "Swell Direction: ".colorize(:cyan) + "#{the_day.swell_direction.colorize(:black)}"
        puts "Surfer Dude says: ".colorize(:cyan) + "#{the_day.surfer_dude_says.colorize(:black)}"
      elsif input == "list"
        list_surf_reports
      elsif input == "later"
        break
      else
        puts "\n"
        puts "Not sure what you're getting at man. Maybe you should slow down a little. Take a deep breath."
      end
    end

  end

  def later
    puts "Later brah! Hope the waves are swell;)"
  end
end

class SurfReport::Report
  attr_accessor :name, :date, :forecast, :wave_size, :wave_description, :swell_direction, :surfer_dude_says, :url
  @@all = []

    def initialize(report_hash)
      report_hash.collect {|key, value| self.send(("#{key}="), value)}
      @@all << self
    end

    def self.create_from_collection(days_array)
      days_array.each{|day| self.new(day)}
    end

    def surfer_dude_says
      if @wave_size == "1-3ft" || @wave_size == "1-2ft"
        self.surfer_dude_says = "Stay home and have a brewsky instead brah! Tomorrow will be a better day (if you're not too hungover)!"
      elsif @wave_size == "2-3ft+" || @wave_size == "2-3ft"
        self.surfer_dude_says = "Might be a few good ones out there! Remember: The water is you and you are the water."
      else
        self.surfer_dude_says = "EPIC SWELL! Show Keanu how it's done in SoCal! GET OFF MY WAAAAAVE!!!"
      end
    end

    def self.all
      @@all
    end
  end
  #   day_1 = self.new
  #   day_1.date = "4/7/2016"
  #   day_1.forecast = "poor"
  #   day_1.wave_size = "1-2 ft"
  #   day_1.wave_description = "wave_description"
  #   day_1.swell_direction = "swell_direction"
  #   day_1.surfer_dude_says = "Stay home and have a brewsky instead brah!"
  #   day_1.url = "http://www.surfline.com/surf-forecasts/southern-california/south-los-angeles_2951"
  #
  #   day_2 = self.new
  #   day_2.date = "date"
  #   day_2.forecast = "shitty"
  #   day_2.wave_size = "wave_size"
  #   day_2.wave_description = "wave_description"
  #   day_2.swell_direction = "swell_direction"
  #   day_2.surfer_dude_says = "Wicked! Get out there and shred!"
  #   day_2.url = "http://www.surfline.com/surf-forecasts/southern-california/south-los-angeles_2951"
  #
  #   day_3 = self.new
  #   day_3.date = "date"
  #   day_3.forecast = "fair"
  #   day_3.wave_size = "wave_size"
  #   day_3.wave_description = "wave_description"
  #   day_3.swell_direction = "swell_direction"
  #   day_3.surfer_dude_says = "EPIC SWELL! Show Keanu how it's done in SoCal!"
  #   day_3.url = "http://www.surfline.com/surf-forecasts/southern-california/south-los-angeles_2951"
  #
  #   [day_1, day_2, day_3]
  # end

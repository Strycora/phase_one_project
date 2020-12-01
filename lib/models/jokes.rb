class Jokes
   # attr_accessor :id, :type, :setup, :punchline

    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
                       
        end
        @@all << self
    end
  

    def self.all 
        @@all
    end

    def self.clear
        @@all.clear
    end


end

class Api

    def self.base_url
        "https://official-joke-api.appspot.com/"
    end

    def self.load_ten_jokes
        response = RestClient.get(base_url + "/random_ten")
        data = JSON.parse(response.body)
        data.each do |ele|
            Jokes.new(ele)
        end
    end

    def self.load_general_jokes
        response = RestClient.get(base_url + "/jokes/general/ten")
        data = JSON.parse(response.body)
        data.each do |ele|
            Jokes.new(ele)
        end
    end

    def self.load_knockknock_jokes
        response = RestClient.get(base_url + "/jokes/knock-knock/ten")
        data = JSON.parse(response.body)
        data.each do |ele|
            Jokes.new(ele)
        end
    end

    def self.load_programming_jokes
        response = RestClient.get(base_url + "/jokes/programming/ten")
        data = JSON.parse(response.body)
        data.each do |ele|
            Jokes.new(ele)
        end
    end
end
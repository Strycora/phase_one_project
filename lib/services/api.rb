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

    def self.load_jokes(type)
        response = RestClient.get(base_url + "/jokes/#{type}/ten")
        data = JSON.parse(response.body)
        data.each do |ele|
            Jokes.new(ele)
        end
    end
end
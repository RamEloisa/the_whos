require 'json'
require 'rest-client'

class Actor
  attr_reader :id, :name, :cast, :known

  def initialize(id)
    @key_imdb = ARGV[0]
    @id = id

    url = "https://imdb-api.com/en/API/Name/#{@key_imdb}/#{id}"
    response = RestClient.get url
    r_json = JSON.parse response.to_str

    @name = r_json['name']

    @cast, @known = [],[]
    arr_cast = r_json['castMovies'].to_a
    arr_cast.size.times do |i|
      if arr_cast[i]['role'] == 'Actor'
        @cast << {id: "#{arr_cast[i]['id']}", title: "#{arr_cast[i]['title']}", character: "#{arr_cast[i]['description']}"}
      end
    end
    arr_known = r_json['knownFor'].to_a
    arr_known.size.times do |i|
      @known << {id: "#{arr_known[i]['id']}", title: "#{arr_known[i]['title']}", character: "#{arr_known[i]['role']}"}
    end

  end

end

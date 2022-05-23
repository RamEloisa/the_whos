require 'json'
require 'rest-client'

class Title
  attr_reader :id, :title, :cast, :fullcast

  def initialize(id)
    @key_imdb = ARGV[0]
    @id = id

    url = "https://imdb-api.com/en/API/Title/#{@key_imdb}/#{id}/FullActor"
    response = RestClient.get url
    r_json = JSON.parse response.to_str

    @title = r_json['title']

    @fullcast, @cast = [],[]
    arr_cast = r_json['actorList'].to_a
    arr_cast.size.times do |i|
      @fullcast << {id: "#{arr_cast[i]['id']}",
                    actor: "#{arr_cast[i]['name']}",
                    character: "#{arr_cast[i]['asCharacter']}"}
    end
        10.times do |i|
      @cast << {id: "#{arr_cast[i]['id']}",
                actor: "#{arr_cast[i]['name']}",
                character: "#{arr_cast[i]['asCharacter']}"}
    end

  end

  def plot(lang = 'en')
    url = "https://imdb-api.com/#{lang}/API/Title/#{@key_imdb}/#{@id}"
    response = RestClient.get url
    r_json = JSON.parse response.to_str
    if lang != 'en'
      @plot = r_json['plotLocal']
    else
      @plot = r_json['plot']
    end
  end
end

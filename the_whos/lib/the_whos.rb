require_relative 'title'
require_relative 'actor'

class TheWhos
  @key_imdb = ARGV[0]

  def self.create(id)
    if id.chr == 't'
      return Title.new(id)
    elsif id.chr == 'n'
      return Actor.new(id)
    else
      return 'Error'
    end
  end

  def self.search_title(expression)
    expression = expression.gsub(' ', '@')
    url = "https://imdb-api.com/en/API/SearchTitle/#{@key_imdb}/#{expression}"
    response = RestClient.get url
    r_json = JSON.parse response.to_str
    arr_search = r_json['results'].to_a
    results = Array.new
    arr_search.size.times do |i|
      results << {id: "#{arr_search[i]['id']}", title: "#{arr_search[i]['title']}"}
    end
    return results
  end

  def self.search_actor(expression)
    expression = expression.gsub(' ', '@')
    url = "https://imdb-api.com/en/API/SearchName/#{@key_imdb}/#{expression}"
    response = RestClient.get url
    r_json = JSON.parse response.to_str
    arr_search = r_json['results'].to_a
    results = Array.new
    arr_search.size.times do |i|
      results << {id: "#{arr_search[i]['id']}", title: "#{arr_search[i]['title']}"}
    end
    return results
  end

  def self.match_title(title_a, title_b)
    if title_a.class == String
      title_a = Title.new(title_a)
    end
    if title_b.class == String
      title_b = Title.new(title_b)
    end
    match = Array.new
    title_a.fullcast.each do |actor_a|
      title_b.fullcast.each do |actor_b|
        if actor_a[:id] == actor_b[:id]
          match << "#{actor_a[:actor].to_s} (#{actor_a[:id]})"
        end
      end
    end
    if match.empty? == true
      return 'Not Match'
    else
      return match
    end
  end

  def self.match_actor(actor_a, actor_b)
    if actor_a.class == String
      actor_a = Actor.new(actor_a)
    end
    if actor_b.class == String
      actor_b = Actor.new(actor_b)
    end
    match = Array.new
    actor_a.cast.each do |title_a|
      actor_b.cast.each do |title_b|
        if title_a[:id] == title_b[:id]
          match << "#{title_a[:title]} (#{title_a[:id]})"
        end
      end
    end
    if match.empty? == true
      return 'Not Match'
    else
      return match
    end
  end

  def self.who(title, actor)
    if title.class == String
      title = Title.new(title)
    end
    if actor.class == String
      actor = Actor.new(actor)
    end
    title.fullcast.each do |cast|
      if cast[:id] == actor.id
        return cast[:character]
      end
    end
    return 'not appear'
  end


end

require 'yaml'
require 'pry'

def load_library(load_address)
  emoticons = YAML.load_file(load_address)
  emo_hash = {}
  emo_hash['get_meaning'] = {}
  emo_hash['get_emoticon'] = {}
    emoticons.each do |meaning, emoticon|  
      if !emo_hash['get_emoticon'][emoticon[0]]
        emo_hash['get_emoticon'][emoticon[0]] = emoticon[1]
      end 
      if !emo_hash['get_meaning'][emoticon[1]]
        emo_hash['get_meaning'][emoticon[1]] = meaning
      end
    end 
  return emo_hash
end

def get_japanese_emoticon(load_address, emoticon)
  emo_hash = load_library(load_address)
  all_emo = emo_hash['get_emoticon']
  all_emo.each do |eng, jap|
    keyx = all_emo.keys 
    if eng == emoticon
      return jap
    elsif keyx.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
    end 
  end 
end

def get_english_meaning(load_address, emoticon)
  emo_hash = load_library(load_address)
  meaning_hash = emo_hash['get_meaning']
  meaning_hash.each do |jap, meaning|
    ponja = meaning_hash.keys 
    if jap == emoticon
      return meaning
    elsif ponja.include?(emoticon) == false
      return "Sorry, that emoticon was not found"
    end #end if 
  end #end do
end
require 'pry'
require 'yaml'

def load_library(library)
  emoticons = YAML.load_file(library)
  search_emoticons = {"get_meaning" => {}, "get_emoticon" => {}}

  emoticons.each do |meaning, emoticons|
    search_emoticons["get_meaning"][emoticons[1]] = meaning
    search_emoticons["get_emoticon"][emoticons[0]] = emoticons[1]
  end

  search_emoticons
end

def get_japanese_emoticon(library, english_emoticon)
  get_japanese_for = load_library(library)["get_emoticon"]

  if get_japanese_for.key?(english_emoticon)
    get_japanese_for[english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(libray, japanese_emoticon)
  get_meaning_for = load_library(libray)["get_meaning"]

  if get_meaning_for.key?(japanese_emoticon)
    get_meaning_for[japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

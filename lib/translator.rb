# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  hash = YAML.load_file(file_path)
  # binding.pry
  final_hash = {}
  hash.each do |key,value|
    final_hash[key] = {}
    final_hash[key][:english] = value[0]
    final_hash[key][:japanese] = value[1]
  end
  final_hash
end

def get_japanese_emoticon(file_path, emoticon)
  hash = load_library(file_path)
  dict = hash.select {|key,value| value[:english] == emoticon}
  if dict == {}
    p "Sorry, that emoticon was not found"
  else
    dict[dict.keys[0]][:japanese]
  end
end

def get_english_meaning(file_path, emoticon)
  hash = load_library(file_path)
  dict = hash.select {|key,value| value[:japanese] == emoticon}
  if dict == {}
    p "Sorry, that emoticon was not found"
  else
    dict.keys[0]
  end
end
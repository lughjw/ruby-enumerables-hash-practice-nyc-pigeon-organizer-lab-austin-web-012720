def nyc_pigeon_organizer(data)
  name_list = get_names(data).uniq
  puts name_list
#  color_list = get_keys_as_strings(data, :color).uniq
#  lives_list = get_keys_as_strings(data, :lives).uniq
  
  ret_hash = {}
# puts "Pigeon names are #{name_list}"
  name_list.each do |pigeon|
#   puts "This pigeon is #{pigeon}"
    ret_hash[pigeon]=build_pigeon(pigeon, data)
  end
  
  ret_hash
end

def get_names(data)
  name_list = []
  data.each_pair do |key1,value1|
    value1.each_pair do |key2,value2|
#      puts "value2 is #{value2}"
      name_list += value2
    end
  end
  
  puts name_list
end

def get_keys_as_strings(data, parent_key)
  ret_list = []
  data[parent_key].each_pair do |key, value|
    ret_list << key.to_s
  end
  
  ret_list
end

def build_pigeon(pigeon_name, data)
  {
    :color => get_pigeon_data(pigeon_name, data, :color),
    :gender => get_pigeon_data(pigeon_name, data, :gender),
    :lives => get_pigeon_data(pigeon_name, data, :lives)
  }
end

def get_pigeon_data(pigeon_name, data, key)
#  puts "looking for data on #{pigeon_name}"
  ret = data.select do |k,v| 
    v.select do |k1,v1|
      v1==pigeon_name
      k1
    end
  end
  
#  pp(ret)
end

# Starting Format: h_h_a
# {
#   :color => {
#     :color1["names"]
#     :color2["names"]
#     ...
#   }
#   :gender => {
#     :male["names"]
#     :female["names"]
#   }
#   :lives => {
#     "location1"["names"]
#     "location2"["names"]
#     ...
#   }
# }
#
# Ending Format: h_h_a
# {
#   "name1" => {
#     :color => ["colors"],
#     :gender => ["gender"],
#     :lives => ["locations"]
#   },
# }
# Flipping the names to the outside and the specific information to the inside

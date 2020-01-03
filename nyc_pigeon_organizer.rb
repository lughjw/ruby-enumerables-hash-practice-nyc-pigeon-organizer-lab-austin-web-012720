def nyc_pigeon_organizer(data)
  name_list = get_names(data).uniq
  
  ret_hash = {}
  name_list.each do |pigeon_name|
    ret_hash[pigeon_name]=build_pigeon(pigeon_name, data)
  end
  
  ret_hash
end

def get_names(data)
  name_list = []
  data.each_pair do |key1,value1|
    value1.each_pair do |key2,value2|
      name_list += value2
    end
  end
  
   name_list
end

def build_pigeon(pigeon_name, data)
  {
    :color => get_pigeon_data(pigeon_name, data, :color),
    :gender => get_pigeon_data(pigeon_name, data, :gender),
    :lives => get_pigeon_data(pigeon_name, data, :lives)
  }
end

def get_pigeon_data(pigeon_name, data, key)
  ret = []
  data[key].each_pair do |k,v|
    if v.any?{|pigeon| pigeon == pigeon_name}
      ret << k.to_s
    end
  end
  
  ret
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

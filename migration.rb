require 'yaml'

def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

file_path = "source/data/links.yml"

data = YAML.load(read_file(file_path))

data["recipes"] = data["recipes"].reverse

File.write(file_path, YAML.dump(data))

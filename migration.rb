require 'yaml'

def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end

file_path = "source/data/links.yml"

data = YAML.load(read_file(file_path))
ref_date = Time.now

data["recipes"] = data["recipes"].map do |h|
  edited_at = ref_date - 1
  h["editedAt"] = edited_at.round(0).to_s
  ref_date = edited_at
  h
end

File.write(file_path, YAML.dump(data))

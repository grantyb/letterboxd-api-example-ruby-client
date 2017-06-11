############################################## HELPER METHODS ###############################################

def show_json(rest_response)
  puts rest_response.description unless rest_response.code == 200
  if rest_response.code != 204
    data = parse_json rest_response
    puts JSON.pretty_generate(data, {indent: '    '}) unless data.nil?
  end
end

def parse_json(rest_response)
  json = rest_response.to_s
  begin
    data = JSON.parse json
  rescue JSON::ParserError => e
    puts 'Invalid JSON response'
    nil
  end
end

############################################## HELPER METHODS ###############################################

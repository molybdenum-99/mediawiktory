$:.unshift 'lib'
require 'mediawiktory'

require 'pp'

api = MediaWiktory::Wikipedia::Api.new

token = api.query.meta(:tokens).response.dig('query', 'tokens', 'csrftoken')

pp api.edit.title('Wikipedia:Sandbox').text("Test '''me''', MediaWiktory!").token(token).response

# This, without token, will raise:
pp api.edit.title('Wikipedia:Sandbox').text("Test '''me''', MediaWiktory without token!").response

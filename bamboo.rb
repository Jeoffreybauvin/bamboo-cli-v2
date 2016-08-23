
require 'httparty'
require 'uri-handler'

class Bamboo
  include HTTParty
  default_params :output => 'json'
  format :json
	headers 'Accept' => 'application/json'
  headers 'Content-Type' => 'application/json'

  def initialize(u, p, uri)
    self.class.base_uri uri
    self.class.basic_auth u, p
  end

  def queue(key, allstages, stage)

		url = '/rest/api/latest/queue/' + key
		if allstages
			url = url + '?executeAllStages=true'
		elsif stage
			url = url + '?stage=' + URI::encode(stage)
		end
    self.class.post(url)
  end

  def server
    self.class.get('/rest/api/latest/info.json')
  end

	def info(key)
		puts key
		self.class.get('/rest/api/latest/plan/' + key + '.json')
	end

  def me
    self.class.get('/rest/api/latest/currentUser.json')
  end

	def pause
		self.class.post('/rest/api/latest/server/pause')
	end

	def resume
		self.class.post('/rest/api/latest/server/resume')
	end

	def clone(key, newkey)
		self.class.put('/rest/api/latest/clone/' + key + ':' + newkey)
	end
end

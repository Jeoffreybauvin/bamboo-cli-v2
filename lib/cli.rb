
require 'rubygems'
require 'thor'
require 'json'

require 'outputs.rb'
require 'bamboo.rb'

SERVER_URL = ENV['BAMBOO_URL']
USERNAME = ENV['BAMBOO_USERNAME']
PASSWORD = ENV['BAMBOO_PASSWORD']

BAMBOO = Bamboo.new(USERNAME, PASSWORD, SERVER_URL)
OUT = TextOutput.new

if SERVER_URL.nil? or USERNAME.nil? or PASSWORD.nil?
	puts 'You must set BAMBOO_URL, BAMBOO_USERNAME and BAMBOO_PASSWORD'
	exit 1
end

class Cli < Thor

	desc "me", "Gets information about the current user"
	def me
		OUT.out BAMBOO.me
	end

	desc "server", "Gets information about the server"
	def server
		OUT.out BAMBOO.server
	end

	desc "info KEY", "Gets the info (including if its building or not) of a plan or job"
	def info(key)
		OUT.out BAMBOO.info(key)
	end

	desc "queue KEY", "Queues the given build"
	method_option :allstages, :type => :boolean, :desc => "Execute all stages, including manual stages"
	method_option :stage, :type => :string, :desc => "name of the stage that should be executed even if defined as manual stage. Execution will follow to the next manual stage after this or end of plan if no subsequent manual stage"
	def queue(key)
		OUT.out BAMBOO.queue(key, options[:allstages], options[:stage])
	end

	desc "pause", "Pause the server from building"
	def pause
		OUT.out BAMBOO.pause
	end

	desc "resume", "Resume the server from pause"
	def resume
		OUT.out BAMBOO.resume
	end

	desc "clone KEY NEWKEY", "Clones a plan configuration"
	def clone(key, newkey)
		OUT.out BAMBOO.clone(key, newkey)
	end
end

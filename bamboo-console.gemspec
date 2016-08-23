Gem::Specification.new do |s|
  s.name        = "bamboo-console"
  s.version     = '0.0.1'
  s.authors     = 'Jeoffrey Bauvin'
  s.email       = ['jeoffrey.bauvin@gmail.com']
  s.license     = 'Apache-2.0'

  s.summary     = 'Command line interface for Atlassian Bamboo'
  s.description = 'Command line interface for Atlassian Bamboo (all versions)'
  s.homepage    = 'https://github.com/Jeoffreybauvin/bamboo-console'

  #dependencies, lets keep'em lean!
  s.add_dependency('thor', '~> 0.14')
	s.add_dependency('httparty', '~> 0.8')
	s.add_dependency('json', '~> 1.6')
	s.add_dependency('uri-handler', '~> 1.0')

  s.executables = 'bamboo-console'
  s.files = ['lib/cli.rb', 'lib/bamboo.rb', 'lib/outputs.rb']
end

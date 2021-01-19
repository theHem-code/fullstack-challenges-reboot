require_relative 'repository'
require_relative 'controller'

repo = Repository.new(File.join(__dir__, 'posts.csv'))
controller = Controller.new(repo)

controller.list

require 'rtanque/runner'

class ArenaController < ApplicationController
  def home
  end

  def random
    brain_paths = [
      'sample_bots/seek_and_destroy.rb',
      'sample_bots/camper.rb',
      'sample_bots/seek_and_destroy.rb',
      'sample_bots/camper.rb'
    ]

    runner = RTanque::Runner.new(1200, 700, 5000, nil)
puts brain_paths.inspect
    brain_paths.each { |brain_path|
#      begin
# TODO Check that file exists
        runner.add_brain_path(brain_path)
#      rescue RTanque::Runner::LoadError => e
#        say e.message, :red
#        exit false
#      end
    }
    runner.start(false)

    render json: runner.match.match_data
  end
end

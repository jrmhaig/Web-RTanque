require 'rtanque/runner'

class ArenaController < ApplicationController
  after_filter :remove_tempfile, only: :random

  def home
  end

  def random
    brain_paths = [
      'sample_bots/seek_and_destroy.rb',
      'sample_bots/camper.rb',
      'sample_bots/seek_and_destroy.rb',
      'sample_bots/camper.rb'
    ]

    @tmpfile = Tempfile.new
    brain_paths.each do |p|
      @tmpfile.puts(p)
    end
    @tmpfile.close
    system("rake battle:create[#{@tmpfile.path}]")

    render file: @tmpfile.path
  end

  def remove_tempfile
    @tmpfile.unlink
  end
end

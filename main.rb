#!/usr/bin/env ruby
require_relative './XMLprocessor/XMLprocessor'
require_relative './PageRenderer/Renderer'

module Main

  def self.startProgram
    unless ARGV.length == 2
      puts "Wrong number of arguments supplied \n"
      puts "Usage: main.rb API_URL.xml Output_directory (e.g ~/Desktop/CameraExample) \n"
      exit
    end

    begin
      all_works, model_pictures = XMLprocessor.start(ARGV[0])
      Renderer.create_index_page(all_works, ARGV[1])
      Renderer.create_make_page(all_works, ARGV[1])
      Renderer.create_model_page(all_works, model_pictures, ARGV[1])
    rescue Exception => e
      puts e.message
    end
  end
end

Main.startProgram
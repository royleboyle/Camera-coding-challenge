require 'fileutils'

module Renderer

  def self.create_index_page(hash, dir)
    system 'mkdir', '-p', "#{dir}"
    index_page = File.new("#{dir}/index" + '.html', 'w+')
    index_page.write("<div><h1 style='margin:10px'> Welcome to our Camera page</h1></div>")
    hash.each do |key, value|
      unless key.empty?
        File.open(index_page, 'a')
        escaped_key = key.gsub(' ', '_')
        index_page.write("<a href='#{escaped_key}/index.html' style='margin:10px'> #{key} </a> <br/>")
      end
    end
    print_ten_images_index_page(hash, index_page)
    index_page.close
  end

  def self.create_make_page(hash, dir)

    hash.each do |key, value|
      if !key.empty?
        escaped_key = key.gsub(' ', '_')
        system 'mkdir', '-p', "#{dir}/" + escaped_key
        escaped_key = key.gsub(' ', '_')
        camera_make_page = File.new("#{dir}/"+ escaped_key + '/index.html', 'w+')
        camera_make_page.write("<h1 style='margin:10px'> #{key} </h1>")
        camera_make_page.write("<a href='../index.html' style='margin:10px'> Back to Camera Homepage </a> <br/><br/>")
        value[:model].each do |model|
          camera_make_page.write("<a href='#{model.gsub(' ', '_')}.html' style='margin:10px'> #{model}</a> <br/>")
        end
        print_ten_images_make_page(value, camera_make_page)
      end
    end
  end

  def self.create_model_page(hash, model_pictures, dir)
    hash.each do |key, value|
      escaped_key = key.gsub(" ", "_")
      value[:model].each do |model|
        if !key.empty?
          camera_model_page = File.new("#{dir}/#{escaped_key}/#{model.gsub(' ', '_')}" + '.html', 'w+')
          camera_model_page.write("<h1 style='margin:10px'>#{key}: #{model}</h1>")
          camera_model_page.write("<a href='index.html' style='margin:10px'> Back to #{key} </a><br/>")
          (model_pictures.reject { |r| r[:model] != model }).each do |image|
            camera_model_page.write(image[:url])
          end

        end
      end
    end
  end

  def self.print_ten_images_make_page(value, camera_make_page)
    @image_count = 0
    value[:images].each do |images|
      if @image_count <10
        camera_make_page.write(images)
        @image_count +=1
      else
        break
      end
    end
  end

  def self.print_ten_images_index_page(hash, index_page)
    @image_count = 0
    hash.each do |key, value|
      unless key.empty?
        File.open(index_page, 'a')
        value[:images].each do |image|
          if @image_count <10
            index_page.write(image)
            @image_count += 1
          else
            break
          end
        end
      end
    end
  end


end
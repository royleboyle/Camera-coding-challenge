require 'nokogiri'
require 'open-uri'
require 'pry'

module XMLprocessor

  def self.start(input)

    if input.nil?
      raise "API input should not be empty"
    end

    begin
      doc = Nokogiri::HTML(open(input))
    rescue
      raise "XML link does not exists. Error code: 404 \n Make sure the API link is valid and that you are connected to the internet \n"
    end

    all_works = Hash.new
    model_pictures = Array.new

    doc.xpath('//work').each do |works|
      url = works.xpath('urls/url[2]').text
      make = works.xpath('exif/make').text.capitalize
      model = works.xpath('exif/model').text.capitalize
      formated_url = "<img src='" + url + "' style='margin:10px' alt='photo taken with a #{make} #{model}'/>"
      unless works.nil?
        model_pictures.push(Hash(url: formated_url, model: model))
        if (!all_works.has_key? make)
          all_works[make] = Hash.new
          all_works[make][:images] = Array.new
          all_works[make][:images].push(formated_url)
          all_works[make][:model] = Array.new
          all_works[make][:model].push(model)
        else
          all_works[make][:images].push(formated_url)
          if !all_works[make][:model].include? model
            all_works[make][:model].push(model).uniq
          end
        end
      end
    end
    return all_works, model_pictures
  end
end
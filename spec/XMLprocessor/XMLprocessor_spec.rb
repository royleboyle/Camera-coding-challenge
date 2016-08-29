require 'spec_helper'
require_relative '../../XMLprocessor/XMLprocessor'


RSpec.describe XMLprocessor, "start" do
  context "input is empty" do
    it "return nil" do
      expect { XMLprocessor.start(nil) }.to raise_error("API input should not be empty")
    end
  end

  context "if the API url is not live" do
    it "return error message" do
      expect { XMLprocessor.start("www.somthing_invalid.asdasd/asd.xml") }.to raise_error("XML link does not exists. Error code: 404 \n Make sure the API link is valid and that you are connected to the internet \n")
    end
  end

  context "if the API url is live and contains valid information" do
    it "populates the all_works hash and model_pictures hash" do
      all_works, model_pictures = XMLprocessor.start("http://take-home-test.herokuapp.com/api/v1/works.xml")
      expect(all_works).not_to be_empty
      expect(model_pictures).not_to be_empty
    end
  end

end




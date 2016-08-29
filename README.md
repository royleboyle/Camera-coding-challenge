Ruby Version used:
ruby 2.0.0p648
Mac: OS X El Capitan

Installation:
Run the following command in the projects root directory to install all gems:
-> bundle install

You can check which gems are installed on your computer with:
-> gem list


Testing:
-> bundle exec rspec
or
-> rspec


Overview:
This project is a ruby program that takes in an API url (data in XML form) and an output directory (locally on your computer) to generate
a set of hmtl pages of camera makes and camera models. Once the output is generated the user may go to the folder and
view the pages (open "index.html")

Design:
Using Nokogiri I have chosen to use the camera MAKE as a key and loop through each <work> element.
Every <work> element contains all meta data of the <work> element of which I grab the url of the image and model.
The XMLprocessor returns filtered information in a hash that is then used by the "Renderer" to generate the HTML pages.

Execute the program:
from the root directory run -> ./main.rb API_URL output_folder
Example: ./main.rb http://take-home-test.herokuapp.com/api/v1/works.xml ~/Desktop/Camera_output


Room for improvement:
The XMLprocessor returns two variables. Ideally I'd like to restructure this to return only one hash containing all information.
This would require some small design changes and refactoring.
Perhaps some more robust error handling (checking for edge cases, etc.) and test scripts.

Note:
Overall happy with the project outcome as I got the project up and running and could learn a few things that are new to me, such as Nokogiri, developing in Ruby, Rspec.
Life is a learning experience :D







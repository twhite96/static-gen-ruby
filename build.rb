prod_build = ARGV[0] = "production_build"
require 'utils/generate_html.rb'
require 'fileutils'
# require 'ruby-handlebars'
#
# hbs = Handlebars::Handlebars.new
# hbs.compile("Hello {{name}}").call({name: 'world'})


head_file = "head.html"
@write_head = File.open(head_file, "w")
@write_head.puts "!DOCTYPE"


seo_file = "seo.html"
@write_seo = File.open(seo_file, "w")
@write_seo.puts "!DOCTYPE"


main_file = "main.css"
@css = File.open(main_file, "w")
@css.puts "body {display: flex;}"


scripts_file = "scripts.js"
@js = File.open(scripts_file, "w")
@js.puts "'use strict'"


base_file = "base.html"
@base = File.open(base_file, "w")
@base.puts "!DOCTYPE"
dev_html  = ""



# Create page partial
# i.e. creating the build.html file and using .gsub to add
# all the handlebars template html to the page
# In this case head, seo, main, and dev, etc

# Test if the build string is rendering Handlebars template to 'base.html'
# using RSpec and Cucumber/aruba

build_string = base_file
  .gsub("{{ head }}", head_file)
  .gsub("{{ seo }}", seo_file)
  .gsub("{{ main }}", main_file)
  .gsub("{{ dev }}", dev_html)

  # Write to index page

if prod_build
  puts "Building index.html..."
  FileUtils.mkdir '_site'
  File.write("index.html", build_string)
  FileUtils.mv %w(index.html head.html seo.html main.html scripts.js main.css), '_site'
else
  puts "Building dev index... dev.index.html"
  File.write("dev.index.html", build_string)
end



unless prod_build
  File.open("site/dev_html").read
end

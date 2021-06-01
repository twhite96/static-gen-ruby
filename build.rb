prod_build = ARGV[0] = "production_build"
require 'ruby-handlebars'

hbs = Handlebars::Handlebars.new
hbs.compile("Hello {{name}}").call({name: 'world'})


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


baseFile = "base.html"
@base = File.open(baseFile, "w")
@base.puts "!DOCTYPE"
dev_html  = ""



# Create page partial
# i.e. creating the build.html file and using .gsub to add
# all the handlebars template html to the page
# In this case head, seo, main, and dev, etc

# Test if the build string is rendering Handlebars template to 'base.html'
# using RSpec

build_string = baseFile
  .gsub("{{ head }}", head_file)
  .gsub("{{ seo }}", seo_file)
  .gsub("{{ main }}", main_file)
  .gsub("{{ dev }}", dev_html)

  # Write to index page

if prod_build
  puts "Building index.html..."
  File.write("index.html", build_string)
else
  puts "Building dev index... dev.index.html"
  File.write("dev.index.html", build_string)
end



unless prod_build
  dev_html = File.open("site/dev_html").read
end

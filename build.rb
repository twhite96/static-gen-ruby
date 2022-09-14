prod_build = ARGV[0] = "production_build"
require 'utils/generate_html.rb'
require 'fileutils'
require 'mustache'

# Using mustache to generate the HTML.
# Now trying to reason about how to insert
# the generated HTML into the generated files
# From the build.rb file

class Generate < Mustache
  def head
    puts %Q(<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>

</body>
</html>)
  end

  def scripts
    puts '"use strict"'
  end

  def styles
    puts %Q(
* {
  box-sizing: border-box;
}
body {
display: flex;}
)
  end
end

Generate.head


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
  File.close

else
  puts "Building dev index... dev.index.html"
  File.write("dev.index.html", build_string)
end



unless prod_build
  File.open("site/dev_html").read
end

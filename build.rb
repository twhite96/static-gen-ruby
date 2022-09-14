prod_build = ARGV[0] = "production_build"
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

index_file = "index.html"
@write_head = File.open(index_file, "w")
index_file puts = Generate.head
File.close


main_file = "main.css"
@css = File.open(main_file, "w")
main.css puts = Generate.styles
File.close


scripts_file = "scripts.js"
@js = File.open(scripts_file, "w")
scripts puts = Generate.scripts
File.close


base_file = "base.html"
@base = File.open(base_file, "w")
@base.puts "!DOCTYPE"
dev_html  = ""
File.close



# Create page partial
# i.e. creating the build.html file and using .gsub to add
# all the handlebars template html to the page
# In this case head, seo, main, and dev, etc

# Test if the build string is rendering Handlebars template to 'base.html'
# using RSpec and Cucumber/aruba


# Do I even need this build string?
build_string = base_file
  .gsub("{{ head }}", index_file)
  .gsub("{{ main }}", main_file)
  .gsub("{{ dev }}", dev_html)

  # Write to index page

# Probably want to do some checks here;
# is the file there
# is it open
# is the dir there
# is it empty, etc
# then you could decide what to do after
# probably need another if/else here for those kinds of checks
# 
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

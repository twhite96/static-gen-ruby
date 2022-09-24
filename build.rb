# frozen_string_literal: true

prod_build = ARGV[0] = 'production_build'
require 'fileutils'
require 'mustache'

# Using mustache to generate the HTML.
# Now trying to reason about how to insert
# the generated HTML into the generated files
# From the build.rb file

class Index < Mustache
  def head
    puts '<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>

</body>
</html>'
  end
end

class Script < Mustache
  def scripts
    puts '"use strict"'
  end
end

class Style < Mustache
  def styles
    puts '
* {
  box-sizing: border-box;
}
body {
display: flex;}
'
  end
end

# base_file = 'base.html'
# @base = File.open(base_file, 'w')
# @base.puts '!DOCTYPE'
# dev_html  = ''
# @base.close
#
# build_string = base_file
#   .gsub('{{ dev }}', dev_html)
#
#

# Create page partial
# i.e. creating the build.html file and using .gsub to add
# all the handlebars template html to the page
# In this case head, seo, main, and dev, etc

# Write to index page

# Create page partial
# i.e. creating the build.html file and using .gsub to add
# all the handlebars template html to the page
# In this case head, seo, main, and dev, etc
# Test if the build string is rendering Handlebars template to 'base.html'
# using RSpec and Cucumber/aruba

# Probably want to do some checks here;
# is the file there
# is it open
# is the dir there
# is it empty, etc
# then you could decide what to do after
# probably need another if/else here for those kinds of checks
#
# if !prod_build
#
#   puts 'Building dev index... dev.index.html'
#   file.write('dev.index.html', build_string)
# else
def build_index
  puts 'beep boop generating index file'
  Index.template_file = 'index'
  Index.template_extension = 'html'
  Index.generate
  file.close
  yield
end

def build_script
  puts 'I know ruby devs hate js but we\'ll build you a script anyway 😜'
  Script.template_file = 'scripts'
  Script.template_extension = 'js'
  Script.generate
  File.close
  yield
end

def build_styles
  puts 'you like css? Here is a css file'
  Style.template_file = 'styles'
  Style.template_extension = 'css'
  Style.generate
  file.close
  yield
end

def move_files
  puts 'moving your files'
  puts build_index
  puts build_script
  puts build_styles
  file.mkdir '_site'
  FileUtils.mv Dir.glob('*'), '_site', noop: true, verbose: true
end

unless prod_build
  File.open('site/dev_html').read
  File.close
end

# frozen_string_literal: true

prod_build = ARGV[0] = 'production_build'
require 'fileutils'
require 'mustache'

# Using mustache to generate the HTML.
# Now trying to reason about how to insert
# the generated HTML into the generated files
# From the build.rb file
# rubocop:disable Metrics/MethodLength

# :nodoc:
class Site < Mustache

  def title
    self.template_path = '_site'
    self.template_file = 'index'
    self.template_extension = 'html'
    Simple.new.template = '{{head}}!'
  end

  def nav

  end

  def header

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


unless prod_build
  File.open('site/dev_html').read
  File.close
end

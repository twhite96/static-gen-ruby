prod_build = ARGV[0] = "production_build"

# Capture input
# require 'fileutils'
print "Enter page name: "
page = gets

print "Enter script name: "
script = gets

print "Enter style name: "
style = gets

# Read files

def page_partial(page)
  pages = "#{page}.html"
  page = File.open(pages, "w").read
end

def script_partial(script)
  scripts = "#{script}.js"
  script = File.open(scripts, "w").read
end

def style_partial(style)
  styles = "#{style}.css"
  style = File.open(styles, "w").read
end


style_partial.puts ""
# puts page_partial(page)
# puts script_partial(script)
# puts style_partial(style)

# FileUtils.mv %w(), 'site/'
head_html   = File.open("site/_head.html").read
seo_html    = File.open("site/_seo.html").read
main_css    = File.open("site/_main.css").read
body_html   = File.open("site/_body.html").read
scaffold_js = File.open("site/_scaffold.js").read
scripts_js  = File.open("site/_scripts.js").read
base_html   = File.open("site/base.html").read
posts_html   = File.open("site/posts.html").read
dev_html    = ""


unless prod_build
  dev_html = File.open("site/dev_html").read
end

# Create page partial
# i.e. creating the build.html file and using .gsub to add
# all the handlebars template html to the page
# In this case head, seo, main, and dev, etc
build_string = base_html
  .gsub("{{ head }}", "#{page_partial}")
  .gsub("{{ seo }}", seo_html)
  .gsub("{{ main }}", main_css)
  .gsub("{{ dev }}", dev_html)

  # Write to index page

if prod_build
  puts "Building index.html..."
  File.write("index.html", build_string)
else
  puts "Building dev index... dev.index.html"
  File.write("dev.index.html", build_string)
end
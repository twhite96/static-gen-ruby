prod_build = ARGV[0] = "production_build"

# Capture input

print "Enter page name: "
page = gets

print "Enter script name: "
script = gets

print "Enter style name: "
style = gets

# Read files

def page_partials(page)
  pages = "site/#{page}.html"
  page = File.open(pages).read
end

def script_partials(script)
  scripts = "site/#{script}.js"
  script = File.open(scripts).read
end

def style_partial(style)
  styles = "site/#{style}.css"
  style = File.open(styles).read
end

puts page_partials(page)
puts script_partials(script)
puts style_partials(style)

head_html   = File.open("site/_head.html").read
seo_html    = File.open("site/_seo.html").read
main_css    = File.open("site/_main.css").read
# body_html   = File.open("site/_body.html").read
# scaffold_js = File.open("site/_scaffold.js").read
# scripts_js  = File.open("site/_scripts.js").read
# base_html   = File.open("site/base.html").read
# posts_html   = File.open("site/posts.html").read
dev_html    = ""


unless prod_build
  dev_html = File.open("site/dev_html").read
end

# Create page

build_string = base_html
  .gsub("{{ head }}", "#{page_partials}")
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
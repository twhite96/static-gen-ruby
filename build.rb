prod_build = ARGV[0] = "production_build"

# Read files

head_html   = File.open("site/_head.html").read
seo_html    = File.open("site/_seo.html").read
main_css    = File.open("site/_main.css").read
body_html   = File.open("site/_body.html").read
scaffold_js = File.open("site/_scaffold.js").read
scripts_js  = File.open("site/_scripts.js").read
base_html   = File.open("site/base.html").read
dev_html    = ""


unless prod_build
  dev_html = File.open("site/dev_html").read
end

# Create page

build_string = base_html
  .gsub("{{ head }}", head_html)
  .gsub("{{ seo }}", seo_html)
  .gsub("{{ main }}", main_css)
  .gsub("{{ body }}", body_html)
  .gsub("{{ scaffold }}", scaffold_js)
  .gsub("{{ scripts }}", scripts_js)
  .gsub("{{ base }}", base_html)
  .gsub("{{ dev }}", dev_html)

  # Write to index page

if prod_build
  puts "Building index.html..."
  File.write("index.html", build_string)
else
  puts "Building dev index... dev.index.html"
  File.write("dev.index.html", build_string)
end
# Static Gen

> A static site generator built with Ruby.

How to use:

1. 🌀 Clone the repo at `https://github.com/twhite96/static-gen-ruby.git` or with GitHub CLI `gh repo clone twhite96/static-gen-ruby`
2. 🏃 Run: `bundle` to install dependencies.
3. 🎊 Have fun with it.

---

## Motivation for this app
I wanted to show that I could build something, even if it was small, on my own, with little guidance.

Ben Halpern started a thread about his generator on DEV and I took his scaffold and ran with it.
## 🥞 Stack
Ruby and `ruby-handlebars`
## 👊🏽 Wins
Just getting the script running is a win for me, as I am not a Ruby dev at all.
## 😐 Difficulties
Ruby is a *whole other animal* compared to JavaScript and React. No semicolons, defining different methods (Ruby is class based, so there are more methods than functions in this instance), etc. I spent a whole month stuck on what this method did:

```ruby
build_string = base_html
  .gsub("{{ head }}", "#{page_partial}")
  .gsub("{{ seo }}", seo_html)
  .gsub("{{ main }}", main_css)
  .gsub("{{ dev }}", dev_html)
```

I figured out it was just generating strings in the files I passed to the `.gsub` method.

There were others, and I plan on writing a full blog post.
## 🚶‍♂️Next steps
Not much. I wanted it to be a full on blog generator but will need to sit on that for a bit.
## ⚡ Refactor ⚡
Maybe DRYing it up a bit, but I like what I have, especially for a v1.
### 📘 Further reading
You can read it here: [Building a Static Site Generator with Ruby](https://tiffanywhite.dev/2020/12/17/building-a-static-site-generator-with-ruby/).


### ✅ TODOs
[] Finish reading Mustache docs
[] Figure out if you want to publish a gem
[] Figure out if you want to let the user create posts as YAML using this example: [mustache/projects.mustache at 9fefaabd2b1e68ef8186a210af1f0e18ef48bb55 · mustache/mustache · GitHub](https://github.com/mustache/mustache/blob/9fefaabd2b1e68ef8186a210af1f0e18ef48bb55/examples/projects.mustache) and [mustache/projects.yml at 9fefaabd2b1e68ef8186a210af1f0e18ef48bb55 · mustache/mustache · GitHub](https://github.com/mustache/mustache/blob/9fefaabd2b1e68ef8186a210af1f0e18ef48bb55/examples/projects.yml)
[] Learn more about publishing gems
[] Learn more about bundler
[] Write tests and mocks to see if the class renders the Mustache html template
[] Decide if more classes and templates are necessary


**UPDATE**:

Further progress on the project on my blog.

[Update on my static site generator](https://www.tiffanywhite.dev/2022/09/26/update-on-my-static-site-generator/)

[Mustache Fix for my static site generator](https://www.tiffanywhite.dev/shorts/mustache-fix-for-my-static-site-generator/)

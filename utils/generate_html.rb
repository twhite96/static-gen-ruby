require 'mustache'



# Using mustache to generate the HTML.
# Now trying to reason about how to insert
# the generated HTML into the generated files
# From the build.rb file

class Generate < Mustache
  def head

  end

  def title
    10_000
  end

  def description
    # some text to inject dynamically
    # or maybe a tag to inject dynamically?
    # still figuring this part out
  end

  def meta

  end

  def scripts
    true
  end

  def styles
    true
  end

  def favicon

  end

  def body

  end

  def footer

  end
end
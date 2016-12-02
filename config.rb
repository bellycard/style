###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   # config.output_style = :compact
#   config.sass_options = {line_comments: false}
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers do
  def color_palette_class(color)
    "sg-color#{"-alt" if (color[:alt] == true)} sg-color-#{color[:var]}"
  end
end

activate :autoprefixer do |config|
  config.browsers = ['last 3 versions', 'Explorer >= 8']
end

activate :directory_indexes
activate :livereload

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Build-specific configuration
configure :build do

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify HTML on build
  activate :minify_html

  # Minify Javascript on build
  activate :minify_javascript

  # Optmize images
  # activate :imageoptim #bundle  issues with middleman v4

  # GZip all the things
  activate :gzip

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

activate :s3_sync do |s3_sync|
  s3_sync.bucket = 'style.bellycard.com'
  s3_sync.region = 'us-east-1'
end

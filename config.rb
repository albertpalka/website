require 'slim'
require 'lib/custom_helpers'
require 'builder'

activate :blog do |blog|
  blog.permalink = 'blog/{title}.html'
  blog.sources = 'blog/{year}-{month}-{day}-{title}.html'
  blog.layout = 'layouts/blog.html.slim'
  blog.paginate = true
  blog.per_page = 7
  blog.new_article_template = 'source/blog/template.html.erb'
end
activate :directory_indexes

page '/index.html', layout: :landing_page
page '/404.html', layout: :website
page '/feed.xml', layout: false
page '/sitemap.xml', layout: false
page '/google9e4f1bcdcf77d753.html', layout: false, directory_index: false
page '/blog_posts.html'
proxy 'blog_posts/page/1.html', '/blog_posts.html'

with_layout :website do
  page '/contact.html'
  page '/join-our-crew.html'
  page '/thank-you.html'
  page '/work.html'
  page '/start-your-project.html'
  page '/ventures.html'
  page '/team.html'
  page '/open-source.html'
  page '/join-our-crew/elixir.html'
  page '/join-our-crew/frontend.html'
  page '/join-our-crew/ios.html'
  page '/join-our-crew/ruby-on-rails.html'
  page '/join-our-crew/sales.html'
  page '/join-our-crew/growth.html'
  page '/join-our-crew/tutor.html'
  page '/join-our-crew/content-writer.html'
  page '/join-our-crew/consultant-developer.html'
end

with_layout :posts do
  page '/blog.html'
end

configure :development do
  activate :livereload, host: 'localhost'
  activate :pry
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :root_url, 'http://codequest.com'
set :root_url_ssl, 'https://codequest.com'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :gzip
  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', 'Explorer >= 11', 'Safari >= 6']
    config.ignore   = ['/stylesheets/hacks.css']
  end
end

Slim::Engine.disable_option_validator!

helpers CustomHelpers

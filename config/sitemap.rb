require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://active-bridge.com'
SitemapGenerator::Sitemap.create do
  add '/about'
  add '/services'
  add '/team'
  add '/portfolio'
end
SitemapGenerator::Sitemap.ping_search_engines

SitemapGenerator::Sitemap.default_host = 'http://blog.active-bridge.com'
SitemapGenerator::Sitemap.create do
  url root_url, last_mod: Time.now, changefreq: 'daily', priority: 0.9
  url articles_url
  Article.find_each do |article|
    url article
  end
end
SitemapGenerator::Sitemap.ping_search_engines

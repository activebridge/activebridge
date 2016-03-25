require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'https://active-bridge.com'
SitemapGenerator::Sitemap.create do
  add '/about', changefreq: 'daily', priority: 0.9
  add '/services', changefreq: 'weekly'
  add '/team', changefreq: 'weekly'
  add '/portfolio', changefreq: 'weekly'
  add '/blog', changefreq: 'weekly'
end
SitemapGenerator::Sitemap.ping_search_engines

SitemapGenerator::Sitemap.default_host = 'http://blog.active-bridge.com'
SitemapGenerator::Sitemap.create do
  url root_url, last_mod: Time.now, changefreq: 'daily', priority: 0.9
  url posts_url
  Post.all.each do |post|
    url post
  end
end
SitemapGenerator::Sitemap.ping_search_engines

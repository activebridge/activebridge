require 'rubygems'
require 'sitemap_generator'

PAGES = %i(about services team portfolio).freeze

SitemapGenerator::Sitemap.default_host = 'https://active-bridge.com'
SitemapGenerator::Sitemap.public_path = 'public/sitemap/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemap/'
SitemapGenerator::Sitemap.create do
  PAGES.each do |p|
    add p, changefreq: :never
  end
  add articles_path,
      host: 'http://blog.active-bridge.com',
      changefreq: 'daily',
      priority: 0.9
  Article.done.find_each do |article|
    add article_path(article),
        host: 'http://blog.active-bridge.com',
        changefreq: 'never'
  end
end
SitemapGenerator::Sitemap.ping_search_engines

require 'rubygems'
require 'sitemap_generator'

PAGES = %i[about services team portfolio].freeze

SitemapGenerator::Sitemap.default_host = 'https://activebridge.org'
SitemapGenerator::Sitemap.sitemaps_path = 'shared/'
SitemapGenerator::Sitemap.create do
  PAGES.each do |p|
    add p, changefreq: :never
  end
  add articles_path,
      host: 'http://activebridge.org',
      changefreq: 'daily',
      priority: 0.9
  Article.done.find_each do |article|
    add article_path(article),
        host: 'http://activebridge.org',
        changefreq: 'never'
  end
end
SitemapGenerator::Sitemap.ping_search_engines

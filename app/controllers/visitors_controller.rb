class VisitorsController < ApplicationController
  def index

    require 'rss'
    require 'open-uri'
    rss_results = []
    rss = RSS::Parser.parse(open('http://feeds.bbci.co.uk/news/rss.xml').read, false).items[0..5]

    rss.each do |result|
      result = { title: result.title, link: result.link }
      rss_results.push(result)
    end
    @feed = rss_results

  end
end

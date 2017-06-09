# MessageProcessor handles an incoming responce and parses to the required responder object
class NewsFeed < MessageProcessor

  def initialize(message, user)
    @message = message
  end

  def call
    prepare_response
  end

  private

  #this is messy, but I'm running low on time
  def prepare_response
    feed = get_feed
    return [
        attachment: {
            type: 'template',
            payload: {
                template_type: 'list',
                top_element_style: 'compact',
                elements: [
                    {
                        title: feed[0][:title],
                        subtitle: feed[0][:description],
                        default_action:
                            {
                                type: 'web_url',
                                url: feed[0][:link],
                            }
                    },
                    {
                        title: feed[1][:title],
                        subtitle: feed[1][:description],
                        default_action:
                            {
                                type: 'web_url',
                                url: feed[1][:link],
                            }
                    },
                    {
                        title: feed[2][:title],
                        subtitle: feed[2][:description],
                        default_action:
                            {
                                type: 'web_url',
                                url: feed[2][:link],
                            }
                    },
                    {
                        title: feed[3][:title],
                        subtitle: feed[3][:description],
                        default_action:
                            {
                                type: 'web_url',
                                url: feed[3][:link],
                            }
                    },
                ]
            }
        }
    ]

  end

  #stub for expanding on responses
  def accepted_responses
    #
  end

  def get_feed

      require 'rss'
      require 'open-uri'
      rss_results = []
      rss = RSS::Parser.parse(open('http://feeds.bbci.co.uk/news/rss.xml').read, false).items[0..5]

      rss.each do |result|
        result = { title: result.title, description: result.description, link: result.link }
        rss_results.push(result)
      end
      return rss_results
    end

end




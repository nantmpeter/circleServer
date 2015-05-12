class Feed < ActiveRecord::Base
  def updateArticle
    require 'rss/2.0'
    require 'open-uri'
    url = self.url
    interval = Time.now - self.updated_at
    if self.updated_at == self.created_at or interval > 7200
    result = RSS::Parser.parse(open(url).read,false)
      if result
        result.items.each do |item|
          sign = Digest::MD5.hexdigest(self.id.to_s+item.title)
          r = Article.where(:sign => sign)
          if r.length == 0
            @article = Article.new(:title => item.title,
                                   :sign => sign,
                                   :content => item.description,
                                   :genre => 2,
                                   :user_id => self.id,
                                   :url => item.link,
                                   :status => 1)
            @article.save
          end
        end
      end
      self.updated_at = Time.now
      self.save
    end
  end
end

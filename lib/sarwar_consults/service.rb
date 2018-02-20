require 'pry'

class SarwarConsults::Service
  attr_accessor :title, :url, :content

  @@all = []

    def initialize (url = nil,title = nil)
      @url = url
      @title = title
      @@all << self
    end

    def self.all
      @@all
    end

    def self.find(id)
      self.all[id-1]
    end

    def self.find_by_title(title)
      self.all.detect do |m|
        m.title.downcase.strip == title.downcase.strip ||
        m.title.split("(").first.strip.downcase == title.downcase.strip
      end
    end


    def self.scrape_signup
      @signup = get_service.search("#menu-item-1663 a").map{|sign| sign['href']}.join("")
    end



    private

      def self.get_service_id
        title = get_service.search("p a")
        title.collect{|e| new(e.text.strip, "http://sarwarconsults.com#{e.attr("href").split("?").first.strip}")}
      end

      def self.get_service
        Nokogiri::HTML(open('http://sarwarconsults.com/services/'))
      end

      def self.scrape_all
        service = self.new
        service.title = get_service.search("p a").collect{|item| item.text}
        service.url = get_service.search("p a").collect{|link| link['href']}
        url = service.url
        service.content = url.each do |u|
          doc = Nokogiri::HTML(open(u))
          doc.search("p").text.strip
        end
      end


      def self.scrape_services
        @title = get_service.search("p a").collect{|item| item.text}
      end

      def self.scrape_url
       @url = get_service.search("p a").collect{|link| link['href']}
      end
      binding.pry

      #  def self.scrape_content(url)
          #    doc = Nokogiri::HTML(open(url))
          #    doc.search("p").text.strip
      #  end


end

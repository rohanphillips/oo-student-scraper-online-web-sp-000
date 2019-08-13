require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    return_array = []
    student_card = doc.css(".student-card")
    student_card.each do |card|
      return_hash = {}
      return_hash[:location] = card.css(".student-location").text
      return_hash[:name] = card.css(".student-name").text
      return_hash[:profile_url] = card.css("a").attribute("href").value
      return_array << return_hash
    end
    return_array
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    return_hash = {}
    a = doc.css(".social-icon-container a")
    a.each do |hash|
      link = hash.attribute("href").value
      if link.include? "twitter"
        return_hash[:twitter] = link
      end
      if link.include? "linkedin"
        return_hash[:linkedin] = link
      end
      if link.include? "github"
        return_hash[:github] = link
      end
      if link.include? "learn"
        return_hash[:blog] = link
      end
    end
  end

end

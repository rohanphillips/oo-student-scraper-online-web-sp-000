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
      return_hash["location"] = card.css(".student-location").text
      return_hash["name"] = card.css(".student-name").text
      return_hash["profile_url"] = card.css("a").attribute("href").value
      return_array << return_hash
    end
    return_array
  end

  def self.scrape_profile_page(profile_url)
    # html = open(profile_url)
    # doc = Nokogiri::HTML(html)
    # return_hash = {}
    # profile_card = doc.css("social-icon-container")

  end

end

require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    return_hash = {}
    student_card = doc.css(".student-card")
    student_card.each do |card|
      student_name = card.css(".student-name").text
      student_location = card.css(".student-location").text
      student_url = card.css("a").attribute("href").value
      return_hash["name"] = student_name
      #return_hash << "location: #{student_location}"
      #return_hash << "profile_url: #{profile_url}"
      binding.pry
    end

  end

  def self.scrape_profile_page(profile_url)

  end

end

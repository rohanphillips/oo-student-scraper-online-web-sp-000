require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student_card = doc.css(".student-card")
    student_card.each do |card|
      student_name = card.css(".student-name").text
      student_location = card.css(".student_location")
      student_url = card.css("a").value
      binding.pry
    end

  end

  def self.scrape_profile_page(profile_url)

  end

end

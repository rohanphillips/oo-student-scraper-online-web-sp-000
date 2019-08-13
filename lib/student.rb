require_relative '../lib/concerns/memorable'

class Student
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each{|key, value| self.send(("#{key}="), value)}
    self.save
  end

  def self.create_from_collection(students_array)

  end

  def add_student_attributes(attributes_hash)

  end

end

require 'pry'
class Shuffler
  attr_reader :students

  def initialize(students)
    @students = students
  end

  def groups_of(number)
    students.shuffle.each_slice(number).to_a
  end

  def assign_room(groups)
    assignments = {}
    groups.each_with_index do |g, i|
      assignments[i + 1] = g
    end
    assignments
  end
end

students = File.readlines('2305roster.txt', chomp: true)

shuffler = Shuffler.new(students)
puts 'Groups of what size?'
size = gets.to_i
groups = shuffler.groups_of(size)
pp shuffler.assign_room(groups)

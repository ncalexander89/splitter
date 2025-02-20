# frozen_string_literal: true

# __dir__ (double underscores) in Ruby is a special method that returns the absolute path of the directory where the current file is located. # rubocop:disable Layout/LineLength
file_path = File.expand_path('../student_unit_offering_file_20-02-2025_01-39-50.txt', __dir__)
# file_content = File.read(file_path)

file_size = (File.size(file_path) / 1_000_000)

puts "File size: #{file_size} megabytes"

line_count = 0

File.foreach(file_path) { line_count += 1 }

puts "Number of lines: #{line_count}"

chunk_num = (file_size / 10) + 1

puts "Chunk Num: #{chunk_num}"

chunk_size = line_count / chunk_num

puts "Chunk Size: #{chunk_size}"

n = 1
start_index = 0
chunk_test = 10

# chunk_num.times do
2.times do
  output_folder = '../output'
  output_file = "../output/chunk_#{n}.txt"

  Dir.mkdir(output_folder) unless Dir.exist?(output_folder)

  # w - write mode
  # File in Ruby is a built-in class used for handling files. It provides methods to read, write, create, delete, and manipulate files. # rubocop:disable Layout/LineLength
  File.open(output_file, 'w') do |out|
    File.foreach(file_path).with_index(start_index) do |line, index|
      start_index += 1

      next if start_index >= chunk_test

      puts "Line ##{start_index}: #{line}"

      # start_index += 1
      # out.puts line
    end
  end

  # puts "First #{chunk_size} lines have been written to #{output_file}"
  # n += 1
  start_index = 10
  chunk_test += chunk_test
  # chunk_size += chunk_size
end

# 164667 19943884	 20751481	2020	4780	  1	Y	COMPLETED	INACTIVE	C
# 164668 19946131	 20351422	2020	4691	  1	Y	COMPLETED	INACTIVE	D

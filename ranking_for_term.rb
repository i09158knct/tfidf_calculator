# -*- coding: utf-8 -*-
require './tfidf_calculator.rb'

def calculate_tfidf_of_all_documents(word, data)
  itl = data.get_indexing_terms_list_clone
  results = []
  itl.each_key do |file_name|
    results  << [data.tfidf(word, file_name), file_name]
  end
  return results
end

def get_random_term(data)
  itl = data.get_indexing_terms_list_clone
  file_name = sprintf("%03d.txt", rand(100)+1)
  index_number = rand(itl[file_name].count)
  return itl[file_name][index_number]
end

data = TFIDFCalculator.new 'data'
word = ARGV[0] || get_random_term(data)
results = calculate_tfidf_of_all_documents(word, data)
results.sort!
puts word

1.upto(5) do |i|
  puts "#{results[-i][0]}\t#{results[-i][1]}\t#{open("data/#{results[-i][1]}"){ |f| f.readline }}"
end

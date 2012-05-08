require './tfidf_calculator.rb'

data = TFIDFCalculator.new 'data'
itl = data.get_indexing_terms_list_clone

1.upto(10) do
  file_name = sprintf("%03d.txt", rand(100)+1)
  index_number = rand(itl[file_name].count)
  it = itl[file_name][index_number]
  puts "#{file_name}: #{it}"
  puts "tf     : #{data.tf(it, file_name)}"
  puts "idf    : #{data.idf(it)}"
  puts "tfidf  : #{data.tfidf(it, file_name)}"
  puts ""
end

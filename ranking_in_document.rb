require './tfidf_calculator.rb'

data = TFIDFCalculator.new 'data'
itl = data.get_indexing_terms_list_clone

1.upto(10) do |i|
  file_name = sprintf("%03d.txt", i)
  result_list = Hash.new
  itl[file_name].each do |it|
    result_list[it] = data.tfidf(it, file_name)
  end
  sorted_values = result_list.values.sort
  puts "#{file_name} #{open("data/#{file_name}"){ |f| f.readline }}"
  1.upto(5) do |rank|
    puts "#{rank}: #{sorted_values[-rank]}\t#{result_list.key sorted_values[-rank]}"
  end
  puts ""
end


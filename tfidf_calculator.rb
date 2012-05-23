# -*- coding: utf-8 -*-
require 'MeCab'

class TFIDFCalculator

  def initialize(target_dir_path)
    @target_dir_path = target_dir_path
    @mecab = MeCab::Tagger.new()
    @indexing_terms_list = create_indexing_terms_list @target_dir_path
  end

  def tfidf(word, file_name)
    return tf(word, file_name) * idf(word)
  end

  def tf(word, file_name)
   return 1.0 * @indexing_terms_list[file_name].count(word) /
      @indexing_terms_list[file_name].count
  end

  def idf(word)
    matched_file_count = 0
    @indexing_terms_list.each_value do |indexing_terms|
      matched_file_count += 1 if indexing_terms.index(word)
    end
    return (matched_file_count != 0) ?
      Math.log(1.0 * @indexing_terms_list.count / matched_file_count) + 1 :
      0.0
  end

  def get_indexing_terms_list_clone()
    return @indexing_terms_list.clone
  end

  private

  def create_indexing_terms_list(dir_path)
    indexing_terms_list = Hash.new
    Dir::foreach(dir_path) do |file_name|
      next if File.directory? file_name #ディレクトリは無視する
      indexing_terms_list[file_name] =
        create_indexing_terms "#{dir_path}/#{file_name}"
    end
    return indexing_terms_list
  end

  def create_indexing_terms(file_path)
    node = @mecab.parseToNode open(file_path){ |file| file.read }
    indexing_terms = []
    until node.nil?
      if node.feature.force_encoding(__ENCODING__).split(',')[0] == "名詞"
        indexing_terms << node.surface.force_encoding(__ENCODING__)
      end
      node = node.next
    end
    return indexing_terms
  end
end

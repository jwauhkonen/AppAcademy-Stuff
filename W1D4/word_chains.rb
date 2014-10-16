require 'set'

class WordChainer
  
  def initialize(dictionary_file_name)
    @dictionary = populate_dictionary(dictionary_file_name)
  end
  
  attr_reader :dictionary
  
  def populate_dictionary(dictionary_file_name)
    dict = Set.new
    File.readlines(dictionary_file_name).each do |entry|
      dict << entry.chomp
    end
    dict
  end
  
  def adjacent_words(word)
    word_chars = word.split("")
    adj_words = []
    
    @dictionary.each do |entry|
      match_count = 0
      
      entry_chars = entry.split("")
      entry_chars.each_index do |i|
        if word_chars[i] == entry_chars[i]
          match_count += 1
        end
      end
      
      if match_count == (word.length - 1) && entry.length == word.length
        adj_words << entry
      end
    
    end
    
    adj_words
  end
  
  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.include?(target)
      new_current_words = explore_current_words  
      @current_words = new_current_words
    end
    
    p build_path(target)
  end
  
  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        if @all_seen_words.include?(adjacent_word)
          next
        else
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = current_word
        end
      end
    end
    
    # new_current_words.each do |word|
 #      puts "#{word}, which came from #{@all_seen_words[word]}"
 #    end
    
    p new_current_words
  end
  
  def build_path(target)
    path = [target]
    next_word = target
    
    loop do
      if @all_seen_words[next_word].nil?
        break
      else
        path << @all_seen_words[next_word]
        next_word = @all_seen_words[next_word]
      end
    end
    
    path
  end
      
  
end

chainer = WordChainer.new('dictionary.txt')

chainer.run("breath", "crutch")
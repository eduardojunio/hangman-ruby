class Dictionary
  def initialize(dictionary_path:)
    @file = File.open(dictionary_path, "r")
  end

  def get_word
    get_words.sample
  end

  private

  def file
    @file
  end

  def get_words
    file.readlines.map { |line| line.chomp }
  end
end

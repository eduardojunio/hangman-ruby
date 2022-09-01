require "tempfile"

require "./lib/hangman/dictionary"

describe Dictionary do
  let(:dictionary_file) { Tempfile.create(%w(dictionary .txt)) }
  let(:dictionary) { described_class.new(dictionary_path: dictionary_file.path) }
  let(:words) { %w(hangman hangman hangman) }
  let(:dictionary_file_contents) { words.join("\n") }

  before do
    dictionary_file.write(dictionary_file_contents)
    dictionary_file.fsync
  end

  after do
    dictionary_file.close
    File.unlink(dictionary_file.path)
  end

  it "returns a word" do
    expect(dictionary.get_word).to eq("hangman")
  end
end

require "./lib/hangman/person"

describe Person do
  let(:person) { described_class.new }

  context "when initializing with already hanging parts" do
    let(:person) { described_class.new(hanging_parts: hanging_parts) }
    let(:hanging_parts) { 3 }

    it "displays the person correctly" do
      expected_result = <<~UI
           _________
           |       |
           O       |
          /|       |
                   |
                   |
        ___________|
      UI
      expect(person.display).to eq(expected_result)
    end
  end

  context "when hanging the person" do
    before { person.hang }

    it "displays the person correctly" do
      expected_result = <<~UI
           _________
           |       |
           O       |
                   |
                   |
                   |
        ___________|
      UI
      expect(person.display).to eq(expected_result)
    end

    it "does not flag the person as dead" do
      expect(person.dead?).to eq(false)
    end

    context "when hanging it five more times" do
      before do
        5.times { person.hang }
      end

      it "displays the person correctly" do
        expected_result = <<~UI
             _________
             |       |
             O       |
            /|\\      |
            / \\      |
                     |
          ___________|
        UI
        expect(person.display).to eq(expected_result)
      end

      it "flags the person as dead" do
        expect(person.dead?).to eq(true)
      end
    end
  end
end

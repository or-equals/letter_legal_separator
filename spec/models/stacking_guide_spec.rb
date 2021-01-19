require 'rails_helper'

RSpec.describe StackingGuide, type: :model do
  describe '#new' do
    it 'initializes with an empty array' do
      expect(described_class.new.pages).to eq([])
    end
  end

  describe '#add' do
    it 'changes pages state' do
      guide = described_class.new
      guide.add(:legal)
      guide.add(:letter)
      guide.add(:legal)
      guide.add(:legal)
      expect(guide.pages).to eq([:legal, :letter, :legal, :legal])
    end
  end

  describe '#print' do
    it 'pretty prints' do
      guide = described_class.new([:legal, :letter, :legal, :letter])
      expect { guide.print }.to output(<<-OUTPUT
+----------+---------+---------+
| Page     | Letter  | Legal   |
+----------+---------+---------+
| 1        |         |    X    |
| 2        |    X    |         |
| 3        |         |    X    |
| 4        |    X    |         |
+----------+---------+---------+
OUTPUT
).to_stdout
    end
  end
end

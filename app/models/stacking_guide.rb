class StackingGuide
  attr_reader :pages

  def initialize(pages = [])
    @pages = pages
  end

  def add(type)
    StackingGuide.new(pages.concat([type]))
  end

  def print
    puts "+----------+---------+---------+"
    puts "| Page     | Letter  | Legal   |"
    puts "+----------+---------+---------+"
    print_dynamic_lines
    puts "+----------+---------+---------+"
  end

  private

  def print_dynamic_lines
    pages.map.with_index do |type, index|
      if type == :letter
        puts "| #{index + 1}        |    X    |         |"
      else
        puts "| #{index + 1}        |         |    X    |"
      end
    end
  end
end

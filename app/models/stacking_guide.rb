class StackingGuide
  attr_reader :pages

  def initialize(pages = [])
    @pages = pages
  end

  def add(type)
    StackingGuide.new(pages.concat([type]))
  end

  def print
    File.open("stacking_guide.txt", "w") do |f|
      f.write "+----------+---------+---------+\n"
      f.write "| Page     | Letter  | Legal   |\n"
      f.write "+----------+---------+---------+\n"
      print_dynamic_lines(f)
      f.write "+----------+---------+---------+\n"
    end
  end

  private

  def print_dynamic_lines(file)
    pages.map.with_index do |type, index|
      if type == :letter
        file.write "| #{index + 1}        |    X    |         |\n"
      else
        file.write "| #{index + 1}        |         |    X    |\n"
      end
    end
  end
end

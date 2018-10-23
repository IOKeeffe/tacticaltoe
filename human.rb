class Human < Player
  def initialize(name)
    super(name)
    @BLANK_SQUARE = " "
  end

  def display_board
    output_string = ""
    @grid.each_with_index do |row, row_idx|
      row_string = ""
      row.each_with_index do |col, col_idx|
        sprite = col.nil? ? @BLANK_SQUARE : col
        row_string += "#{sprite}"
        row_string += "|" if col_idx < row.length - 1
      end
      output_string += "#{row_string}\n"
      output_string += "-----\n"
    end
    puts output_string
  end
end
class Board

  attr_reader :rows, :BLANK_SQUARE
  def initialize
    @rows = Array.new(3) {Array.new(3)}
  end

  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def process_input(direction)
    case direction
    when "down"
    when "up"
    when "left"
    when "right"
    when "enter"
    else
      return
    end
  end

  def []=(pos, value)
    row, col = pos
    rows[row][col] = value
  end

  def check_for_winner
    rows.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        return true if 
        check_orthoganals(row_idx, col_idx, true) ||
        check_orthoganals(row_idx, col_idx, false) ||
        check_diagonals(row_idx, col_idx)
      end
    end
    false
  end

  def check_orthoganals(row_idx, col_idx, horizontal)
    return unless horizontal ? row_idx == 0 : col_idx == 0
    squares_to_check = []
    3.times do |count|
      if horizontal
        squares_to_check << rows[row_idx + count][col_idx]
      else
        squares_to_check << rows[row_idx][col_idx + count]
      end
    end
    check_squares(squares_to_check)
  end

  def check_diagonals(row_idx, col_idx)
    return unless col_idx == 0 && (row_idx == 0 || row_idx == 2)
    modifier = col_idx == 2 ? -1 : 1
    squares_to_check = []
    3.times do |count|
      squares_to_check << rows[row_idx + count][col_idx + (count * modifier)]
    end
    check_squares(squares_to_check)
  end

  def check_squares(squares)
    squares.uniq.length == 1 && squares_to_check.none? {|el| el.nil?}
  end

end
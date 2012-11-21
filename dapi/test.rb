#!/usr/bin/env ruby
 
class Position
  attr_reader :col, :row

  DELTAS = { :right => { :col => +1 }, :down  => { :row => +1 }, :left  => { :col => -1 }, :up    => { :row => -1 } }

  def initialize col = 0, row = 0
    @col, @row = col, row
  end

  def next_pos direction
    self.class.new @col + DELTAS[direction][:col].to_i, @row + DELTAS[direction][:row].to_i
  end

  def out_of_range? root
    @col < 0 || @col >= root || @row < 0 || @row >= root
  end
end

class MatrixSpiraled
  attr_reader :data

  def initialize input
    @input = input.to_i
    @root = Math.sqrt(@input).to_i

    @data = Array.new(@root).map { |i| Array.new(@root) }

    raise "#{input} is not perfect square" unless @root*@root==@input

    puts "Input:\t#{@input}"
  end

  def calculate
    current_value = @input
    if @input.even?
      direction = directions.first
      position = Position.new
    else
      direction = directions[2]
      position = Position.new @root-1, @root-1
    end

    while current_value > 0 do
      @data[position.row][position.col] = current_value

      next_pos = position.next_pos direction

      if next_pos.out_of_range?(@root) || @data[next_pos.row][next_pos.col]
        direction = get_next_direction direction
        next_pos = position.next_pos direction
      end

      position = next_pos

      current_value -= 1
    end
  end

  private

  def directions
    Position::DELTAS.keys
  end

  def get_next_direction direction
    next_index = directions.index( direction ) + 1
    next_index = 0 if next_index == directions.count
    directions[ next_index ]
  end
end

class MatrixOutput
  def initialize matrix
    @matrix = matrix
  end

  def output
    print "Output:"
    @matrix.data.each do |row|
      puts "\t#{row.map { |v| format(v) }.join(' ')}"
    end

    puts
  end
  
  private

  def max_string_length
    @matrix.data.flatten.max.to_s.length
  end

  def format v
    v.to_s + ' ' * (max_string_length - v.to_s.length)
  end
end

puts "What is you square?"

matrix = MatrixSpiraled.new gets
matrix.calculate

MatrixOutput.new(matrix).output

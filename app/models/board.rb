class Board < ApplicationRecord
  belongs_to :game
  has_many :moves

  def initialize
    @board = Board.new(self)
    @game = Game.new
    @move = Move.new
    @board.template = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @board.counter = 0
    @board.user_id = current_user
    @board.status = 'pending'
  end

  def valid_move?
    @move = Move.new
    @board.template[@move.position - 1] == ' '
  end

  def move
    @move = Move.new
    if valid_move?
      if @board.user_id == current_user
        @board.template[@move.position - 1] = 'X'
      else
        @board.template[@move.position - 1] = 'O'
      end
    end
    @board.counter += 1
  end

  def turn
    if @board.counter % 2 == true
      @board.user_id = 2
    else
      @board.user_id = current_user
    end
  end

  def won?
    @board.game.win += 1
    @board.status = 'finished'
    true
  end

  def lost?
    @board.game.lost += 1
    @board.status = 'finished'
    true
  end

  def tie?
    if !won? || !lost? && @board.counter == 9
      @board.status = 'finished'
      true
    end
  end
end

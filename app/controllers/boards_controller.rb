class BoardsController < ApplicationController
  def show
    @game = Game.where(user_id: current_user)
    @board = Board.where(status: "pending")
  end

  def update
    @board = Board.find(params[:id])
    @board.update(:template[@moves.position])
    @board.save
    redirect_to board_path(@board)
  end

  private

  def board_params
    params.require(:board).permit(:template)
  end
end

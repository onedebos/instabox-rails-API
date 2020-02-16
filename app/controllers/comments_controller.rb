class CommentsController < ApplicationController
  before_action :set_picture #find a picture before running any of the actions here
  before_action :set_picture_comment, only: [:show, :destroy]

  # GET pictures/pid/comments
  def index
    render json: @picture.comments, status: :ok
  end

  # GET pictures/pid/comments/id
  def show
    render json: @picture
  end

  # POST pictures/pid/comments
  def create
    @picture.comments.create!(comment_params)
    render json: @picture, status: :created
  end


  def update
    @comment.update(comment_params)
    head :no_content
  end

  # DELETE pictures/pid/comments/id
  def destroy
    @comment.destroy
    head :no_content
  end

  private
    def comment_params
      params.permit(:name, :comment)
    end

    def set_picture
      @picture = Picture.find(params[:picture_id])
    end

    def set_picture_comment
      @comment = @picture.comments.find_by!(id:params[:id]) if @picture
    end
end

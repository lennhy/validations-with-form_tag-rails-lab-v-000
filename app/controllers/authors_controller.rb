class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      # below the .errors method to check the error messages for a specific attribute in this case for each field in the form
      # @author.errors[:name]  for reference
      # @author.errors[:email] for reference
      # @author.errors[:phone_number] for reference

      render :new
    end
  end


  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end

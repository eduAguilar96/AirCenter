class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(create_params)
    @user.save
    if @user.persisted?
      flash[notice] = "User succesfully created"
      redirect_to "/flights"
    else
      render 'new'
    end
  end

  def index

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def create_params
    params.require(:user).permit(
      :name,
      :last_name_p,
      :last_name_m,
      :mail,
      :telephone,
      :birth_date,
      :passport
    )
  end
end

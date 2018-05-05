class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(create_params)

    @user.birth_date
    @user.save
    redirect_to @user
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

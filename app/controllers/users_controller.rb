class UsersController < ApplicationController
def show 
     @book= Book.new
      @user=User.find(params[:id]) 
      @books=@user.books
end
def edit
   @user=User.find(params[:id]) 
   if @user != current_user  
       redirect_to user_path(current_user.id)
   end
end
def update
    @user=User.find(params[:id]) 
    if @user.update(users_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
     render :edit
    end
end

def index
    @book= Book.new
    @books=Book.all
    @user=current_user
    @users=User.all
end
private
  
  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end

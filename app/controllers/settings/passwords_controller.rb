module Settings
  

class Settings::PasswordsController < Settings::BaseController

    def show
    end

    def update
      if Current.user.update(password_params)
        redirect_to root_path, status: :see_other, notice: "Your password has been updated."
      else
        render :show, status: :unprocessable_entity
      end
    end

    private
      def password_params
        p = params.require(:user).permit(:password, :password_confirmation, :password_challenge)
        p[:password_challenge] ||= ""
        p
      end
  end
end

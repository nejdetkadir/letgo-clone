class Membership::SettingsController < MembershipController
  def index
  end

  def update_profile_image
    current_user.update(profile_image_params)
    render json: {imgSrc: current_user.profile_image_url(:thumb)}
  end

  def informations
    if current_user.update(informations_params)
      flash[:notice] = "Profil bilgileriniz başarıyla güncellendi."
    else
      current_user.errors.full_messages.each do |error|
        flash[:alert] = error
      end
    end

    redirect_to membership_settings_root_path
  end

  private

  def profile_image_params
    params.require(:user).permit(:profile_image)
  end

  def informations_params
    params.require(:user).permit(:email, :fullname)
  end
end

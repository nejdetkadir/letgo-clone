class Membership::SettingsController < MembershipController
  def index
  end

  def update_profile_image
    current_user.update(profile_image_params)
    render json: {imgSrc: current_user.profile_image_url(:thumb)}
  end

  private

  def profile_image_params
    params.require(:user).permit(:profile_image)
  end
end

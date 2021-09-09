class Membership::CitiesController < MembershipController
  before_action :set_city, only: [:towns, :districts]
  before_action :set_town, only: [:districts]


  def cities
    @cities = City.all
    render json: @cities, except: [:created_at, :updated_at, :alpha_2_code]
  end

  def towns
    render json: @city.towns, except: [:created_at, :updated_at, :city_id]
  end

  def districts
    render json: @town.districts, except: [:created_at, :updated_at, :town_id], include: [:quarters => {except: [:created_at, :updated_at, :district_id]}]
  end

  private

  def set_city
    @city = City.find(params[:city_id])
  end

  def set_town
    @town = @city.towns.find(params[:town_id])
  end
end

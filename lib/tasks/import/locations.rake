# frozen_string_literal: true

namespace :import do
  desc 'Imports cities & towns & districts & quarters from db/static_data'
  task locations: :environment do
    file = YAML.load_file(Rails.root.join('db', 'static_data', 'locations.yml'))
    progress_bar = ProgressBar.create(:title => "Cities & Towns & Districts & Quarters", :starting_at => 0, :total => file.count)

    file.each do |city|
      current_city = City.create(name: city["name"], alpha_2_code: city["alpha_2_code"])
      
      city["towns"].each do |town|
        current_town = current_city.towns.create(name: town["name"])

        town["districts"].each do |district|
          current_district = current_town.districts.create(name: district["name"])

          district["quarters"].each do |quarter|
            current_district.quarters.create(name: quarter["name"])
          end
        end
      end

      progress_bar&.increment
    end

    puts "#{81 - City.count} errors in cities"
    puts "#{973 - Town.count} errors in towns"
    puts "#{4086 - District.count} errors in districts"
    puts "#{51071 - Quarter.count} errors in quarters"
  end
end

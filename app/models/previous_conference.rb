class PreviousConference < ActiveRecord::Base

  def country_name
    ctry = ISO3166::Country[country]
    ctry.name
  end

end

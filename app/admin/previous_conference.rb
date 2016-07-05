ActiveAdmin.register PreviousConference do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :year, :url, :location, :from, :to, :country
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


 form do |f|
  f.inputs do
    f.input :year
    f.input :url
    f.input :location
    f.input :country, :as=>:country
    f.input :from, :as=>:datepicker
    f.input :to, :as=>:datepicker
    f.actions
  end
 end 

end

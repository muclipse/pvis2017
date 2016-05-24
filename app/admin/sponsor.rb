ActiveAdmin.register Sponsor do
  sortable
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :position, :sponsor_type, :name, :thumbnail, :url
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    sortable_handle_column
    column :id
    
    column "Type" do |s|
      s.sponsor_type
    end
    
    column "Thumbnail" do |s|
      image_tag s.thumbnail.url, :style=>"width:80px"
    end
    
    column :name
    column :url
    
    column :position
    
    actions
  end

  
  form :html => {:multipart => true} do |f|
    f.inputs "Detail" do
      f.input :sponsor_type, :as=> :select, :collection => ["Organizer", "Local Sponsors", "Diamond Sponsors", "Silver Sponsors", "Academic Sponsors"]
      f.input :name
      f.input :thumbnail, :as => :file, :hint =>image_tag(f.object.thumbnail.url)
      f.input :url
      f.input :position
    end
    
    f.actions
  end

end

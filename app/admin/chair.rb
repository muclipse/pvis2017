ActiveAdmin.register Chair do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :email, :affiliation, :thumbnail
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
    column :id
    column :name
    column :email
    column :affiliation
    column "Groups" do |c|
      if !c.chair_groups.empty?
        ol do
          c.chair_groups.each do |g|
            li g.name
          end
        end
      end
    end    

    actions
  end

form :html => {:multipart => true} do |f|
  f.inputs "Detail" do
    f.input :name
    f.input :thumbnail, :as => :file, :hint => (image_tag(f.object.thumbnail(:thumb).url) if f.object.thumbnail.exists?)
    f.input :email
    f.input :affiliation
  end

  f.actions
end

end

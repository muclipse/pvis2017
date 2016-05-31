ActiveAdmin.register ChairGroup do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :email, :attributes, :chair_assignments_attributes=>[:id, :chair_group_id, :chair_id, :position]

  index do
    column :id
    column :name
    column :email
    column "Members" do |g|
      if !g.chairs.empty?
        ol do
          g.chairs.each do |c|
            li c.name
          end
        end
      end
    end    

    actions
  end

  form :html => {:multipart => true} do |f|
    f.inputs "Detail" do
      f.input :name
      f.input :email
    end
  
    f.inputs "Members" do
      f.has_many :chair_assignments, allow_destroy: true, new_record: 'Add new chair' do |g|
        g.input :chair
        g.input :position
      end
    end

    f.actions
  end


end

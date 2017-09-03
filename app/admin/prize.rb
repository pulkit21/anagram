ActiveAdmin.register Prize do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :quantity, :condition, :condition_one, :condition_two, :condition_three_multiple_of, :condition_three_greater_than

index do
  selectable_column
  id_column
  column :title
  column :description
  column :quantity
  column :created_at
  actions
end

form do |f|
  f.inputs do
    f.input :title
    f.input :description
    f.input :condition, as: :radio, :collection => Prize.conditions.keys, label: 'Select Condition'
    f.input :condition_one, as: :tags, label: 'Input Multiple numbers'
    f.input :condition_two, label: 'Input number'
    f.input :condition_three_multiple_of, label: 'Input number'
    f.input :condition_three_greater_than, label: 'Input number greater than'
    f.input :quantity
  end
  f.actions
end


#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end

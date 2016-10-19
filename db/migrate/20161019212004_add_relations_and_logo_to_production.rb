class AddRelationsAndLogoToProduction < ActiveRecord::Migration[5.0]
  def change
    add_reference :productions, :company, index: true
    add_attachment :productions, :logo
  end
end

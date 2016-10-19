class AddLogoToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_attachment :companies, :logo
  end
end

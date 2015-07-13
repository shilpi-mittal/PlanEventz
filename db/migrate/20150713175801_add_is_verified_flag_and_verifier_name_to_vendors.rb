class AddIsVerifiedFlagAndVerifierNameToVendors < ActiveRecord::Migration
  def change
  	add_column :vendors, :is_verified, :boolean
  	add_column :vendors, :verifier_name, :string
  end
end

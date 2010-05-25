class CreateAdminUser < ActiveRecord::Migration
  def self.up
		#Make sure the role migration file was generated first    
		Role.create(:rolename => 'administrator')
		#Admin setup
		user = User.new
		user.login = "admin"
		user.email = "admin@santanarh.com.br"
		user.password = "66286882rh"
		user.password_confirmation = "66286882rh"
    user.name = "Administrador"
    user.surname = "Administrador"
		user.save(false)
		user.send(:activate!)
		role = Role.find_by_rolename('administrator')
		user = User.find_by_login('admin')
		permission = Permission.new
		permission.role = role
		permission.user = user
		permission.save(false)
  end

  def self.down
    drop_table :permissions
		Role.find_by_rolename('administrator').destroy   
		User.find_by_login('admin').destroy   
  end
end

#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


include_recipe "database::mysql"

# create a mysql database
mysql_database 'vagrantdb' do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end


# create connection info as an external ruby hash
# mysql_connection_info = {
#   :host     => 'localhost',
#   :username => 'root',
#   :password => node['mysql']['server_root_password']
# }

# Grant SELECT, UPDATE, and INSERT privileges to all tables in foo db from all hosts
# mysql_database_user 'vagrant_user' do
#   connection    mysql_connection_info
#   password      'vagrant_secret'
#   database_name 'vagrantdb'
#   host          '%'
#   privileges    [:select,:update,:insert]
#   action        :grant
# end

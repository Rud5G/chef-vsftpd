package 'openssl'
package 'db-util'



# useradd -d /home/ftpsite virtual
user node['vsftpd']['config']['guest_username'] do
  comment 'vsftpd virtual user'
  home node['vsftpd']['guest_home']
  comment 'vsftpd virtual user'
  action :nothing
end

directory node['vsftpd']['guest_home'] do
  user node['vsftpd']['config']['guest_username']
  group node['vsftpd']['guest_group']
  mode 0770
  notifies :create, 'user[' + node['vsftpd']['config']['guest_username'] + ']', :before
  action :nothing
end

directory File.join(node['vsftpd']['guest_home'], 'users') do
  user 'root'
  group node['vsftpd']['guest_group']
  mode 0770
  notifies :create, 'directory[' + node['vsftpd']['guest_home'] + ']', :before
  action :create
end


# users

template File.join('/etc/pam.d', node['vsftpd']['config']['pam_service_name']) do
  source 'vsftpd-pam-virtual.erb'
  owner 'root'
  group 'root'
  mode 0644
  backup false
end

directory node['vsftpd']['config']['user_config_dir'] do
  owner 'root'
  group 'root'
  mode 0755
end

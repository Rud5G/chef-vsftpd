package 'openssl'
package 'db-util'


user node['vsftpd']['config']['guest_username'] do
  comment 'vsftpd virtual user'
  home node['vsftpd']['config']['guest_home']
  shell '/bin/false'
end

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

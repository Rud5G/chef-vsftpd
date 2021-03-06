# see
default['vsftpd']['config']['pasv_enable'] = true

if node['vsftpd']['config']['pasv_enable']
  # default['vsftpd']['config']['pasv_address'] = (node['cloud'] && node['cloud']['public_ipv4']) || node['ipaddress']
  default['vsftpd']['config']['pasv_min_port'] = '30000'
  default['vsftpd']['config']['pasv_max_port'] = '30999'
end

default['vsftpd']['config']['listen'] = true
default['vsftpd']['config']['listen_port'] = 10021

# influences the pam.d location
default['vsftpd']['config']['pam_service_name'] = 'vsftpd'

# default['vsftpd']['config']['use_localtime'] = false
# default['vsftpd']['config']['dirmessage_enable'] = false
default['vsftpd']['config']['nopriv_user'] = 'nobody'
# default['vsftpd']['config']['setproctitle_enable'] = false

default['vsftpd']['config']['write_enable'] = false
default['vsftpd']['config']['anon_upload_enable'] = false
default['vsftpd']['config']['anon_mkdir_write_enable'] = false
default['vsftpd']['config']['anon_other_write_enable'] = false


default['vsftpd']['config']['anonymous_enable'] = false
default['vsftpd']['config']['local_enable'] = true
default['vsftpd']['config']['local_umask'] = '022'


# default['vsftpd']['config']['anon_root'] = nil
# default['vsftpd']['config']['chown_uploads'] = false
# default['vsftpd']['config']['chown_username'] = 'ftp'
# default['vsftpd']['config']['chmod_enable'] = true
default['vsftpd']['config']['chroot_local_user'] = true

# default['vsftpd']['config']['passwd_chroot_enable'] = true
default['vsftpd']['config']['chroot_list_enable'] = false
# default['vsftpd']['chroot_users'] = []
# default['vsftpd']['config']['chroot_list_file'] = '/etc/vsftpd/chroot_list.conf'



default['vsftpd']['config']['ssl_enable'] = false
if node['vsftpd']['config']['ssl_enable']
  default['vsftpd']['config']['require_ssl_reuse'] = false
  default['vsftpd']['config']['rsa_cert_file'] = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
  default['vsftpd']['config']['rsa_private_key_file'] = '/etc/ssl/private/ssl-cert-snakeoil.key'
  default['vsftpd']['config']['ssl_ciphers'] = 'DES-CBC3-SHA'
  default['vsftpd']['config']['ssl_request_cert'] = true
  default['vsftpd']['config']['ssl_sslv2'] = false
  default['vsftpd']['config']['ssl_sslv3'] = false
  default['vsftpd']['config']['ssl_tlsv1'] = true
  default['vsftpd']['config']['debug_ssl'] = false
end

default['vsftpd']['config']['xferlog_enable'] = true
default['vsftpd']['config']['xferlog_std_format'] = true
default['vsftpd']['config']['dual_log_enable'] = false
default['vsftpd']['config']['syslog_enable'] = true
default['vsftpd']['config']['vsftpd_log_file'] = '/var/log/vsftpd.log'
default['vsftpd']['config']['xferlog_file'] = '/var/log/xferlog.log'
default['vsftpd']['config']['log_ftp_protocol'] = true
default['vsftpd']['config']['connect_from_port_20'] = false
default['vsftpd']['config']['async_abor_enable'] = false
default['vsftpd']['config']['idle_session_timeout'] = 600
default['vsftpd']['config']['data_connection_timeout'] = 120
default['vsftpd']['config']['deny_file'] = []
# default['vsftpd']['config']['max_per_ip'] = 5
default['vsftpd']['config']['hide_ids'] = true

default['vsftpd']['config']['seccomp_sandbox'] = false



default['vsftpd']['virtual_users_enable'] = true
if node['vsftpd']['virtual_users_enable']
  default['vsftpd']['config']['guest_username'] = 'virtual'
  default['vsftpd']['config']['guest_enable'] = true
  default['vsftpd']['config']['user_config_dir'] = '/etc/vsftpd/users'
  default['vsftpd']['config']['virtual_use_local_privs'] = false
  default['vsftpd']['config']['user_sub_token'] = '$USER'

  default['vsftpd']['user_passwd_type'] = 'db'
  default['vsftpd']['user_passwd_file'] = '/etc/vsftpd/login'
  default['vsftpd']['guest_home'] = '/home/ftpsite'
  default['vsftpd']['guest_group'] = 'virtual'
end

default['vsftpd']['config']['local_root'] = '/home/ftpsite/users/$USER'

default['vsftpd']['config']['allow_writeable_chroot'] = nil

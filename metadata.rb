name 'vsftpd'
maintainer 'Rudger Gravestein'
maintainer_email 'r.gravestein@triple-networks.com'
license 'Apache License, Version 2.0'
description 'Installs/Configures vsftpd for Secure SSL SFTP'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.1'

%w{ debian ubuntu }.each do |os|
  supports os
end

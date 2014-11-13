name             'ftp-cloudfs'
maintainer       'Webzilla'
maintainer_email 'dmitry.r@cyberflow.net'
license          'Apache v2.0'
description      'Installs/Configures ftp-cloudfs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

%w( debian ubuntu ).each do |os|
  supports os
end

depends 'python'
depends 'memcached'

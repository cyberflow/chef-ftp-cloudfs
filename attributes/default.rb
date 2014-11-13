# specified pip install package
default['ftp-cloudfs']['package'] = 'ftp-cloudfs'
# specified version of ftp-cloudfs
default['ftp-cloudfs']['version'] = 'latest'
# determines whether or not use Auth v2.0 (keystone auth)
default['ftp-cloudfs']['keystone-auth'] = false
# specified version of python-keystoneclient
default['ftp-cloudfs']['keystoneclient']['version'] = 'latest'
# path to log file
default['ftp-cloudfs']['log-dir'] = '/var/log/ftp-cloudfs'
# path to pid file
default['ftp-cloudfs']['pid-dir'] = '/var/run/ftp-cloudfs'
# use nencached
default['ftp-cloudfs']['memcached'] = false
# udp port for ftp-cloudfs
default['ftp-cloudfs']['port'] = 21
# bind address
default['ftp-cloudfs']['bind_address'] = nil
# auth url
default['ftp-cloudfs']['auth_url'] = nil
# memcache server
default['ftp-cloudfs']['memcache'] = '127.0.0.1:11211'
# maximum number of client connections per IP
default['ftp-cloudfs']['max_cons_per_ip'] = 0
# large file support.
default['ftp-cloudfs']['split_large_files'] = ''
# hide .part directory from large files
default['ftp-cloudfs']['hide_part_dir'] = 'no'
# be verbose on logging
default['ftp-cloudfs']['verbose'] = 'no'
# enable logging to the system logger
default['ftp-cloudfs']['syslog'] = 'no'
# log file name
default['ftp-cloudfs']['logfile'] = 'ftpcloudfs.log'
# pid file name
default['ftp-cloudfs']['pidfile'] = 'ftpcloudfs.pid'
# uid
default['ftp-cloudfs']['uid'] = nil
# gid
default['ftp-cloudfs']['gid'] = nil
# region name to be used with Auth 2.0 (optional)
default['ftp-cloudfs']['keystone_region_name'] = ''
# tenant separator to be used with Auth 2.0 (eg. TENANT.USERNAME)
default['ftp-cloudfs']['keystone_tenant_separator'] = '.'
# service type to be used with Auth 2.0
default['ftp-cloudfs']['keystone_service_type'] = 'object-store'
# endpoint type to be used with Auth 2.0
default['ftp-cloudfs']['keystone_endpoint_type'] = 'publicURL'
# Use Rackspace's ServiceNet internal network
default['ftp-cloudfs']['rackspace_service_net'] = false

# Git install
# git repository
default['ftp-cloudfs']['repository'] = 'https://github.com/cloudfs/ftp-cloudfs.git'
# git revision
default['ftp-cloudfs']['revision'] = 'master'
# git install path
default['ftp-cloudfs']['install-path'] = '/opt'

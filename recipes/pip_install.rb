#
# Cookbook Name:: ftp-cloudfs
# Recipe:: pip_install
#
# Copyright 2014, Webzilla
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
fail 'You must set attribute node.ftp-cloudfs.auth_url' if node['ftp-cloudfs']['auth_url'].nil?

package 'python-dev'

include_recipe 'python::pip'

python_pip node['ftp-cloudfs']['package'] do
  version node['ftp-cloudfs']['version']
  action :install
end

python_pip 'python-keystoneclient' do
  version node['ftp-cloudfs']['keystoneclient']['version']
  action :install
end if node['ftp-cloudfs']['keystone-auth']

directory node['ftp-cloudfs']['log-dir'] do
  mode 00755
  action :create
end if node['ftp-cloudfs']['log-dir']

directory node['ftp-cloudfs']['pid-dir'] do
  mode 00755
  action :create
end if node['ftp-cloudfs']['pid-dir']

template '/etc/init.d/ftp-cloudfs' do
  source 'ftp-cloudfs.init.d.erb'
  mode '0755'
  action :create
end

service 'ftp-cloudfs' do
  supports :start => true, :restart => true
  action :enable
end

include_recipe 'memcached' if node['ftp-cloudfs']['memcached'] == 'local'

template '/etc/ftpcloudfs.conf' do
  source 'ftpcloudfs.conf.erb'
  variables(
    :port                      => node['ftp-cloudfs']['port'],
    :bind_address              => node['ftp-cloudfs']['bind_address'] || '127.0.0.1',
    :auth_url                  => node['ftp-cloudfs']['auth_url'],
    :memcache                  => node['ftp-cloudfs']['memcache'],
    :max_cons_per_ip           => node['ftp-cloudfs']['max_cons_per_ip'],
    :split_large_files         => node['ftp-cloudfs']['split_large_files'],
    :hide_part_dir             => node['ftp-cloudfs']['hide_part_dir'],
    :verbose                   => node['ftp-cloudfs']['verbose'],
    :syslog                    => node['ftp-cloudfs']['syslog'],
    :logfile                   => "#{node['ftp-cloudfs']['log-dir']}/#{node['ftp-cloudfs']['logfile']}",
    :pidfile                   => "#{node['ftp-cloudfs']['pid-dir']}/#{node['ftp-cloudfs']['pidfile']}",
    :keystone_region_name      => node['ftp-cloudfs']['keystone_region_name'],
    :keystone_tenant_separator => node['ftp-cloudfs']['keystone_tenant_separator'],
    :keystone_service_type     => node['ftp-cloudfs']['keystone_service_type'],
    :keystone_endpoint_type    => node['ftp-cloudfs']['keystone_endpoint_type']
  )
  notifies :restart, 'service[ftp-cloudfs]'
end

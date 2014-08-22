ftp-cloudfs Cookbook
====================
This cookbook install and configures ftp-cloudfs.

* [https://github.com/cloudfs/ftp-cloudfs](https://github.com/cloudfs/ftp-cloudfs)

Requirements
------------
## Platform:
* Debian 6.0+
* Ubuntu 12.04+

#### packages
- `python-pip` - ftp-cloudfs needs python-pip to be installed over pip.

#### cookboks
- `python` - ftp-cloudfs needs this cookbook for install python-pip.
- `memcached` - need if you

Attributes
----------
#### ftp-cloudfs::default
* `default['ftp-cloudfs']['version']` - may be use for pin specified version of ftp-cloudfs. Default `latest`
* `defaul['ftp-cloudfs']['keystone-auth']` - determines whether or not use Auth v2.0 (keystone auth). Default `false`
* `default['ftp-cloudfs']['keystoneclient']['version']` - may be use for pin specified version of python-keystoneclient. Default `latest`
* `default['ftp-cloudfs']['log-dir']` - path to log file. Default `/var/log/ftp=cloudfs`
* `default['ftp-cloudfs']['pid-dir']` - path to pid file. Default `/var/run/ftp-cloudfs`
* `default['ftp-cloudfs']['memcached']` - use nencached. Default `false`
* `default['ftp-cloudfs']['port']` - udp port for ftp-cloudfs. Default `21`
* `default['ftp-cloudfs']['bind_address']` - bind address. Default `127.0.0.1`
* `default['ftp-cloudfs']['auth_url']` - auth url. Required. Default `nil`
* `default['ftp-cloudfs']['memcache']` - memcache server. Default `127.0.0.1:11211`
* `default['ftp-cloudfs']['max_cons_per_ip']` - maximum number of client connections per IP. Default unlim.
* `default['ftp-cloudfs']['split_large_files']` - large file support. Default unsupport.
* `default['ftp-cloudfs']['hide_part_dir']` - hide .part directory from large files. Default `no`
* `default['ftp-cloudfs']['verbose']` - be verbose on logging. Default `no`
* `default['ftp-cloudfs']['syslog']` - enable logging to the system logger. Default `no`
* `default['ftp-cloudfs']['logfile']` - log file name. Default `ftpcloudfs.log`
* `default['ftp-cloudfs']['pidfile']` - pid file name. Default `ftpcloudfs.pid`
* `default['ftp-cloudfs']['uid']` - uid. Default `nil`
* `default['ftp-cloudfs']['gid']` - gid. Default `nil`
* `default['ftp-cloudfs']['keystone_region_name']` - region name to be used with Auth 2.0 (optional). Default `none`
* `default['ftp-cloudfs']['keystone_tenant_separator']` - tenant separator to be used with Auth 2.0 (eg. TENANT.USERNAME). Default `.`
* `default['ftp-cloudfs']['keystone_service_type']` - service type to be used with Auth 2.0. Default `object-store`
* `default['ftp-cloudfs']['keystone_endpoint_type']` - endpoint type to be used with Auth 2.0. Default `publicURL`
* `default['ftp-cloudfs']['rackspace_service_net']` - Use Rackspace's ServiceNet internal network. Default `false`

Usage
-----
#### ftp-cloudfs::default

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ftp-cloudfs]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Author:: Dmitry R. <dmitry.r@cyberflow.net>
Copyright:: 2014, Dmitry R.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

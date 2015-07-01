require 'spec_helper'

describe 'ftp-cloudfs::pip_install' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(
      platform: 'ubuntu',
      version: '12.04'
    )
    runner.node.set['ftp-cloudfs']['auth_url'] = 'http://test/url'
    runner.converge(described_recipe)
  end

  context 'expected error' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'ubuntu',
        version: '12.04'
      )
      runner.converge(described_recipe)
    end

    it 'error if node.ftp-cloudfs.auth_url.nil?' do
      expect { chef_run }.to raise_error('You must set attribute node.ftp-cloudfs.auth_url')
    end
  end

  it 'include recipe python::pip' do
    expect(chef_run).to include_recipe('python::pip')
  end

  # let(:python_resource) { Chef::Resource::Pip.new('ftp-cloudfs') }
  # it 'create new resource a python package ftp-cloudfs' do
  # 	expect(:python_resource).to eq('ftp-cloudfs')
  # end

  it 'does not creates a directory with attributes' do
    expect(chef_run).to_not create_directory('/var/log/ftpcloudfs')
    expect(chef_run).to_not create_directory('/var/run/ftpcloudfs')
  end

  it 'create init file' do
    expect(chef_run).to create_template('/etc/init.d/ftp-cloudfs')
  end

  context 'if directory determined' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'ubuntu',
        version: '12.04'
      )
      runner.node.set['ftp-cloudfs']['auth_url'] = 'http://test/url'
      runner.node.set['ftp-cloudfs']['log-dir'] = '/var/log/ftpcloudfs'
      runner.node.set['ftp-cloudfs']['pid-dir'] = '/var/run/ftpcloudfs'
      runner.converge(described_recipe)
    end

    it 'creates a directory with attributes' do
      expect(chef_run).to create_directory('/var/log/ftpcloudfs').with(
        mode: 00755
      )

      expect(chef_run).to create_directory('/var/run/ftpcloudfs').with(
        mode: 00755
      )
    end
  end

  it 'enables a service ftp-cloudfs' do
    expect(chef_run).to enable_service('ftp-cloudfs')
  end

  it 'does not include memcached' do
    expect(chef_run).to_not include_recipe('memcached')
  end

  it 'ftpcloudfs config does not contain memcached directive' do
      expect(chef_run).to_not render_file('/etc/ftpcloudfs.conf').with_content('memcache')
  end

  context 'if memcached local' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.set['ftp-cloudfs']['auth_url'] = 'http://test/url'
      runner.node.set['ftp-cloudfs']['memcached'] = 'local'
      runner.converge(described_recipe)
    end

    it 'include recipe memcached' do
      expect(chef_run).to include_recipe('memcached')
    end

    it 'ftpcloudfs config contain memcached directive' do
      expect(chef_run).to render_file('/etc/ftpcloudfs.conf').with_content('memcache = 127.0.0.1:11211')
    end
  end

  context 'if memcached external' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.set['ftp-cloudfs']['auth_url'] = 'http://test/url'
      runner.node.set['ftp-cloudfs']['memcached'] = 'external'
      runner.node.set['ftp-cloudfs']['memcache'] = ['111.111.111.111:11211']
      runner.converge(described_recipe)
    end

    it 'does not include memcached' do
      expect(chef_run).to_not include_recipe('memcached')
    end

    it 'ftpcloudfs config contain memcached directive' do
      expect(chef_run).to render_file('/etc/ftpcloudfs.conf').with_content('memcache = 111.111.111.111:11211')
    end
  end

  it 'create config ftpcloudfs from template' do
    expect(chef_run).to create_template('/etc/ftpcloudfs.conf')
  end

  let(:template) { chef_run.template('/etc/ftpcloudfs.conf') }
  it 'sends a notification to the service ftp-cloudfs' do
    expect(template).to notify('service[ftp-cloudfs]')
  end
end

require 'spec_helper'

describe 'ftp-cloudfs::default' do
  let(:chef_run)do
    runner = ChefSpec::Runner.new(
      platform: 'ubuntu',
      version: '12.04'
    )
    runner.node.set['ftp-cloudfs']['auth_url'] = 'http://test/url'
    runner.converge(described_recipe)
  end

  it 'include recipe' do
  	expect(chef_run).to include_recipe('ftp-cloudfs::pip_install')
  end
end
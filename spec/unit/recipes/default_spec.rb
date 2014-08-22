require 'spec_helper'

describe 'ftp-cloudfs::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'include recipe' do
  	expect(chef_run).to include_recipe('ftp-cloudfs::pip_install')
  end
end
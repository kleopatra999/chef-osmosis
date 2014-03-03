require 'spec_helper'

describe 'osmosis::default' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe osmosis::packages' do
    chef_run.should include_recipe 'osmosis::packages'
  end

  it 'should include recipe osmosis::install' do
    chef_run.should include_recipe 'osmosis::install'
  end

end


require 'spec_helper'

describe 'osmosis::packages' do
  let (:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should remove package openjdk-7-jre' do
    chef_run.should remove_package 'openjdk-7-jre'
  end

  it 'should include recipe java::default' do
    chef_run.should include_recipe 'java::default'
  end

end


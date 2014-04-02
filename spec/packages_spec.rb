require 'spec_helper'

describe 'osmosis::packages' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe java::default' do
    chef_run.should include_recipe 'java::default'
  end

end

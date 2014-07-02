require 'spec_helper'

describe 'osmosis::packages' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include recipe java::default' do
    expect(chef_run).to include_recipe 'java::default'
  end

end

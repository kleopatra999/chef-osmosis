require 'spec_helper'

describe 'osmosis::install' do
  context 'install type tgz with defaults' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:osmosis][:install_type] = 'tgz'
      end.converge(described_recipe)
    end

    it 'should ark osmosis' do
      chef_run.should install_ark 'osmosis'
    end
  end

  context 'install type pkg with defaults' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:osmosis][:install_type] = 'pkg'
      end.converge(described_recipe)
    end

    it 'should install package osmosis' do
      chef_run.should install_package('osmosis')
    end
  end

end

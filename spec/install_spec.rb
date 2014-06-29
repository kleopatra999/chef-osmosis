require 'spec_helper'

describe 'osmosis::install' do
  context 'install type tgz with defaults' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:osmosis][:install_type] = 'tgz'
      end.converge(described_recipe)
    end

    it 'should create directory /opt/osmosis' do
      chef_run.should create_directory('/opt/osmosis').with(
        owner: 'root',
        group: 'root',
        mode:  0755
      )
    end

    it 'should make http HEAD request to remote source' do
      chef_run.should head_http_request('HEAD http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz')
    end

    it 'should notify create remote file' do
      head_request = chef_run.http_request('HEAD http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz')
      head_request.should notify('remote_file[/opt/osmosis/osmosis-latest.tgz]').to(:create).immediately
    end

    it 'should define a remote file resource for the file' do
      chef_run.should_not create_remote_file('/opt/osmosis/osmosis-latest.tgz').with(
        blah: 'flag'
      )
    end

    it 'should extract osmosis' do
      remote_file = chef_run.remote_file('/opt/osmosis/osmosis-latest.tgz')
      remote_file.should notify('bash[extract-osmosis]').to(:run).immediately
    end

    it 'should declare a resource extract-osmosis' do
      chef_run.should_not run_bash 'extract-osmosis'
    end

    it 'should not symlink into /usr/bin' do
      chef_run.should_not create_link '/usr/bin/osmosis'
    end
  end

  context 'install type tgz with symlink' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set[:osmosis][:install_type] = 'tgz'
        node.set[:osmosis][:symlink]      = true
      end.converge(described_recipe)
    end

    it 'should create a link from /usr/bin/osmosis to bin/osmosis' do
      chef_run.should create_link('/usr/bin/osmosis').with(
        to: '/opt/osmosis/bin/osmosis'
      )
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

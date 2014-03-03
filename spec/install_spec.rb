require 'spec_helper'

describe 'osmosis::install' do
  context 'install type tgz' do
    let (:chef_run) do 
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

    it 'should extract osmosis' do
      remote_file = chef_run.remote_file('/opt/osmosis/osmosis-latest.tgz')
      remote_file.should notify('bash[extract-osmosis]').to(:run).immediately
    end
  end

  context 'install type pkg' do
    let (:chef_run) do 
      ChefSpec::Runner.new do |node|
        node.set[:osmosis][:install_type] = 'pkg'
      end.converge(described_recipe)
    end
  
    it 'should add apt repository mapzen-public' do
      chef_run.should add_apt_repository('mapzen-public').with(
        uri: 'http://s3.amazonaws.com/mapzen-debian',
        distribution: 'stable',
        components: ['main'],
        key: 'https://s3.amazonaws.com/mapzen-debian/mapzen-debian.gpg.key'
      )
    end

    it 'should install package mapzen-osmosis' do
      chef_run.should install_package('mapzen-osmosis').with(
        version: '0.0.1'
      )
    end
  end

end


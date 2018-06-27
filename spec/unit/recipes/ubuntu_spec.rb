#
# Cookbook:: homebase-base
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'set-hostname::ubuntu' do

  let(:node_name) { 'chefspec' }
  let(:domain) { 'bar.com' }
  let(:ip) { '5.4.3.2' }
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node, _server|
      node.normal['set-hostname']['ip']     = ip
      node.normal['set-hostname']['domain'] = domain
    end.converge(described_recipe)
  end

  context 'Converges on Ubuntu 16.04' do
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'Generated Templates' do
    it 'generates the proper hosts template' do
      expect(chef_run).to create_template('/etc/hosts')
    end
  end

  context 'Template Contains FQDN first' do
    let(:etc_host) do
<<-eof
# This file is automatically dropped by Chef.
#
# Any changes will be overwritten.

127.0.0.1 localhost
5.4.3.2 chefspec.bar.com chefspec
eof
    end
    it 'generates the proper hosts template' do
      expect(chef_run).to render_file('/etc/hosts').with_content(etc_host)
    end
  end
end

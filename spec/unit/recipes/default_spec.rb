#
# Cookbook Name:: noip-client
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'noip-client::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'downloads the source files' do
      expect(chef_run).to create_remote_file('/tmp/noip-duc-linux.tar.gz')
    end

    it 'compiles and installs the executable' do
      expect(chef_run).to run_execute('extract and install noip-duc')
    end
  end
end

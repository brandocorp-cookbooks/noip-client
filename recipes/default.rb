#
# Cookbook Name:: noip-client
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'build-essential'

remote_file "#{Chef::Config['file_cache_path']}/noip-duc-linux.tar.gz" do
  source 'http://www.no-ip.com/client/linux/noip-duc-linux.tar.gz'
  checksum '82b9bafab96a0c53b21aaef688bf70b3572e26217b5e2072bdb09da3c4a6f593'
  mode '0755'
end

execute 'extract and install noip-duc' do
  command <<-BASH
    cd #{Chef::Config['file_cache_path']}
    tar xf noip-duc-linux.tar.gz
    cd noip-*
    make
    cp noip2 /usr/local/bin/noip2
  BASH
end

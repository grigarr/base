#
# Cookbook Name:: base
# Recipe:: ifconfig
#
# Copyright (C) 2013, OSU Open Source Lab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Set up interfaces if they are defined in the data bag
begin
  net_dbag = data_bag_item('networking', @node[:fqdn].gsub(".","-"))
rescue
  net_dbag = nil
end

if net_dbag
  if net_dbag['interfaces']
    net_dbag['interfaces'].each_value do |ifcfg|
      ifconfig ifcfg['inet_addr'] do
        ignore_failure true
        device ifcfg['device']
        bootproto ifcfg['bootproto']
        mask ifcfg['mask']
        bcast ifcfg['bcast']
        onboot ifcfg['onboot'] if ifcfg['onboot']
        mtu ifcfg['mtu'] if ifcfg['mtu']
      end
    end
  end
  if net_dbag['routes']
    net_dbag['routes'].each_value do |r|
      route r['network'] do
        ignore_failure true
        gateway r['gateway']
        netmask r['netmask'] if r['netmask']
        device r['device'] if r['device']
      end
    end
  end
end

#
# Cookbook Name:: base
# Recipe:: drupalorg
#
# Copyright (C) 2013, Oregon State University
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

node.default['chef_client']['init_style'] = "none"
node.default['chef_client']['cron']['minute'] = "*/30"
node.default['chef_client']['cron']['hour'] = "*"
node.default['chef_client']['cron']['use_cron_d'] = "true"
node.default['chef_client']['cron']['log_file'] = "/var/log/chef/client.log"

include_recipe "base"
include_recipe "base::environment"
include_recipe "base::packages"
include_recipe "chef-client::cron"
include_recipe "aliases"
include_recipe "openssh"
include_recipe "chef-client::delete_validation"
include_recipe "base::puppet"

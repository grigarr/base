#
# Cookbook Name:: base
# Recipe:: default
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

# Install and require the mail handler gem
chef_gem "chef-handler-mail" do
  action :install
end
gem 'chef-handler-mail'

# Send email to root
chef_handler "MailHandler" do
  source 'chef/handler/mail'
  arguments :to_address => "chef@osuosl.org"
  action :nothing
  supports :exception => true, :report => false
end.run_action(:enable)

template "/etc/nsswitch.conf" do
  source "nsswitch.conf.erb"
  mode 0644
  owner "root"
  group "root"
  variables(:settings => node['nsswitch'])
end

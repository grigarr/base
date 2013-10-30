#
# Cookbook Name:: base
# Recipe:: security
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

case node['platform_family']
when "rhel"
  # Run yum security updates Sundays at 2am
  cron_d "yum-security" do
    minute  "0"
    hour    "9"
    weekday "0"
    mailto  "root@osuosl.org"
    shell   "/bin/bash"
    command "yum update --security -y"
  end
end

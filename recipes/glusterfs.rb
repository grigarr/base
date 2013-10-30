#
# Cookbook Name:: base
# Recipe:: glusterfs
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

# Configure the glusterfs yum repositories
yum_repository "glusterfs" do
  action :remove
end

yum_repository "glusterfs-epel" do
  repo_name "glusterfs-epel"
  description "GlusterFS is a clustered file-system capable of scaling to several petabytes."
  url "http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.0/EPEL.repo/epel-$releasever/$basearch/"
  action :add
end

yum_repository "glusterfs-noarch-epel" do
  repo_name "glusterfs-noarch-epel"
  description "GlusterFS is a clustered file-system capable of scaling to several petabytes."
  url "http://download.gluster.org/pub/gluster/glusterfs/3.4/3.4.0/EPEL.repo/epel-$releasever/noarch"
  action :add
end

package "glusterfs" do
  action :install
end
package "glusterfs-fuse" do
  action :install
end

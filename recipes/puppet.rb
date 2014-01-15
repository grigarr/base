# Configure the puppetlabs yum repository
yum_repository "puppetlabs" do
  repo_name "puppetlabs"
  description "puppetlabs repo $releasever - $basearch"
  url "http://packages.osuosl.org/repositories/centos-$releasever/osl/$basearch"
  action :create
end

package "puppet" do
  action :install
end

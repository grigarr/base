# Configure the puppetlabs yum repository
yum_repository "puppetlabs" do
  repo_name "puppetlabs"
  description "puppetlabs repo $releasever - $basearch"
  url "http://yum.puppetlabs.com/el/6/products/$basearch"
  gpgkey "https://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs"
  action :create
end

package "puppet" do
  action :install
end

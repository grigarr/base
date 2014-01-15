# Remove SELinux enforcing
case node['platform_family']
when "rhel"
  include_recipe 'selinux::permissive'
end

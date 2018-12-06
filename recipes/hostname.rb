host = node_host(node)

should_reboot = node['set-hostname']['allow-reboot-if-changed']
reboot(node.name) { action :nothing }
reboot_resource = "reboot[#{node.name}]"

execute "sets hostname to '#{host.fqdn}'" do
  command "hostname #{host.fqdn}"
  not_if { current_hostname.eql?(host.fqdn) }
  notifies(:request_reboot, reboot_resource, :delayed) if should_reboot
end

file '/etc/hostname' do
  content host.fqdn
  mode '0755'
  owner 'root'
  group 'root'
  not_if { ::File.exist?('/etc/hostname') && ::File.read('/etc/hostname') == host.fqdn }
  notifies(:request_reboot, reboot_resource, :delayed) if should_reboot
end

cloud_cfg = '/etc/cloud/cloud.cfg'

execute 'change setting "preserve_hostname" to true in ' + cloud_cfg do
  command "sed -i.bak 's/preserve_hostname: false/preserve_hostname: true/g' #{cloud_cfg}"
  only_if { ::File.exist?(cloud_cfg) && ::File.read(cloud_cfg).include?('preserve_hostname: false') }
  notifies(:request_reboot, reboot_resource, :delayed) if should_reboot
end

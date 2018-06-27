host = node_host(node)

execute 'set hostname to node name' do
  command "hostname #{host.fqdn}"
  not_if { current_fqdn.eql?(host.fqdn) }
end

# On SmartOS hosts file lives in a non-standard location
node.normal['set-hostname']['hosts-file'] = '/etc/inet/hosts'
include_recipe 'set-hostname::hosts-file'

template '/etc/nodename' do
  source 'nodename.erb'
  variables host: host
  mode 0644
end

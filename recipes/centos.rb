host = node_host(node)

execute 'set hostname to node name' do
  command "hostname #{host.fqdn}"
  not_if
end

execute 'Setting Hostname'  do
  command "sed -i -e 's/HOSTNAME\=localhost.localdomain/HOSTNAME\=#{host.fqdn}/g' /etc/sysconfig/network"
end

include_recipe 'set-hostname::hosts-file'

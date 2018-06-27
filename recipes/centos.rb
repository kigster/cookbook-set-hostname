host = node_host(node)

execute 'Setting Hostname'  do
  command "sed -i -e 's/HOSTNAME\=localhost.localdomain/HOSTNAME\=#{host.fqdn}/g' /etc/sysconfig/network"
  only_if "test -f /etc/sysconfig/network && test -z $(grep #{host.fqdn} /etc/sysconfig/network)"
end

include_recipe 'set-hostname::hosts-file'
include_recipe 'set-hostname::hostname'

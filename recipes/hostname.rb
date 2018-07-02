host = node_host(node)

execute "sets hostname to '#{host.fqdn}'" do
  command "hostname #{host.fqdn}"
  not_if { current_hostname.eql?(host.fqdn) }
end

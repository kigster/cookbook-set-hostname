host = node_host(node)

execute "sets hostname to '#{host.name}'" do
  command "hostname #{host.name}"
  not_if { current_hostname.eql?(host.name) }
end

execute "sets hostname for '#{host.fqdn}'" do
  command "hostname #{host.fqdn}"
  not_if { current_fqdn.eql?(host.fqdn) }
end


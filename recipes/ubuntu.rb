host = node_host(node)

execute "sets hostname for #{host.inspect}" do
  command "hostname #{host.fqdn}"
  not_if { current_fqdn.eql?(host.fqdn) }
end

include_recipe 'set-hostname::hosts-file'

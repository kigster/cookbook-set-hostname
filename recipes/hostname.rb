host = node_host(node)

execute "sets hostname to '#{host.fqdn}'" do
  command "hostname #{host.fqdn}"
  not_if { current_hostname.eql?(host.fqdn) }
end

file '/etc/hostname' do
  content host.fqdn
  mode '0755'
  owner 'root'
  group 'root'
  not_if { File.exist?('/etc/hostname')  && File.read('/etc/hostname') == host.fqdn }
end


host = node_host(node)

template '/etc/hosts' do
  source 'hosts.erb'
  mode 0644
  variables host: host
end

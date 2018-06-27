template '/etc/hosts' do
  source 'hosts.erb'
  mode 0644
  variables host: node_host(node)
end

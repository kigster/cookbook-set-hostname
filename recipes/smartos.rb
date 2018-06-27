host = node_host(node)

# On SmartOS hosts file lives in a non-standard location
node.normal['set-hostname']['hosts-file'] = '/etc/inet/hosts'
include_recipe 'set-hostname::hosts-file'

template '/etc/nodename' do
  source 'nodename.erb'
  variables host: host
  mode 0644
end

include_recipe 'set-hostname::hostname'

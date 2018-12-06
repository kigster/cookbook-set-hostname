default['set-hostname']['hosts-file'] = '/etc/hosts'
default['set-hostname']['name'] = node.name
default['set-hostname']['ip'] = node['ipaddress']

# Set this attribute in the environment or policy file to automatically
# append a fully qualified domain to each hostname.
default['set-hostname']['domain'] = nil
default['set-hostname']['allow-reboot-if-changed'] = false

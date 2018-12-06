name 'set-hostname'
maintainer 'Konstantin Gredeskoul'
maintainer_email 'kigster@gmail.com'
license 'MIT'

version '1.2.1'

description 'Sets the hostname on a node and updates the hosts file.'
long_description <<~EOF
  = DESCRIPTION:

  Provided an attribute `default['set-hostname']['domain']` this cookbook does everything else: i.e. 
  sets the hostname based on the `node.name`, it's IP address, and the provided domain, and updates the 
  `/etc/hosts` file.
EOF
chef_version '>= 12.5' if respond_to?(:chef_version)

source_url 'https://github.com/kigster/cookbook-set-hostname'
issues_url 'https://github.com/kigster/cookbook-set-hostname/issues'


supports 'ubuntu'
supports 'smartos'
supports 'centos'


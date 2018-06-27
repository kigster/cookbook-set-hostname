class Chef
  NodeHost ||= Struct.new(:name, :ip, :domain) do
    def fqdn
      domain ? "#{name}.#{domain}" : name
    end
  end

  module NodeNameHelper
    def current_fqdn
      require 'socket'
      Socket.gethostbyname(Socket.gethostname).first
    end

    def node_host(node)
      NodeHost.new(
        node['set-hostname']['name'] || node.name,
        node['set-hostname']['ip'] || node['ipadddress'],
        node['set-hostname']['domain'] || node['fqdn']
      )
    end

    def node_fqdn(node)
      node_host(node).fqdn
    end
  end

  Recipe.include(NodeNameHelper)
  Resource::Execute.include(NodeNameHelper)
end

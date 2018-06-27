case node['platform']
  when 'smartos'
    include_recipe 'set-hostname::smartos'
  when 'centos'
    include_recipe 'set-hostname::centos'
  when 'ubuntu'
    include_recipe 'set-hostname::ubuntu'
end

ohai 'reload' do
  action :reload
end

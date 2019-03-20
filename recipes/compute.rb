class ::Chef::Recipe
  include ::Slurm
end

# ###########################################################################################
# package installation
# ###########################################################################################
node['slurm']['compute']['packages'].each(&method(:package))

# ###########################################################################################
# package and service configuration
# ###########################################################################################

# # fstab for controller
munge_dir = ::File.dirname(node['slurm']['munge']['key'])
slurm_dir = node['slurm']['slurm_dir']
homes_dir = node['slurm']['homes_dir']
control_machine = node['slurm']['control_machine']
nfs_apps_server = node['slurm']['nfs_apps_server']
nfs_homes_server = node['slurm']['nfs_homes_server']
origin = node['slurm']['controller'].nil? ? control_machine : nfs_apps_server

[munge_dir, slurm_dir].each do |dir|
  next if dir.nil?
  mount dir do
    device "#{origin}:#{dir}"
    fstype 'nfs'
    enabled true
    dump 0
    pass 0
    action [:enable, :mount]
    only_if { node['slurm']['control_machine'] != node['hostname'] }
  end
end

origin = node['slurm']['controller'].nil? ? control_machine : nfs_homes_server

mount homes_dir do
  device "#{origin}:#{homes_dir}"
  fstype 'nfs'
  enabled true
  dump 0
  pass 0
  action [:enable, :mount]
  only_if { node['slurm']['control_machine'] != node['hostname'] }
end

# ###########################################################################################
# service activation
# ###########################################################################################

file "#{node['slurm']['common']['conf_dir']}/cgroup_allowed_devices_file.conf" do
  content ''
end

service 'Slurm Client Service' do
  service_name 'slurmd'
  action :start
end

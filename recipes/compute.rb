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
slurm_dir = node['slurm']['slurm_dir']
homes_dir = node['slurm']['homes_dir']
control_machine = node['slurm']['control_machine']
nfs_apps_server = node['slurm']['nfs_apps_server']
nfs_homes_server = node['slurm']['nfs_homes_server']

::Chef::Log.info "Slurm Compute #{node['hostname']} Settings:\n
\tController: #{node['slurm']['control_machine']}\n
\tNFS Apps: #{node['slurm']['nfs_apps_server']}\n
\tNFS Homes: #{node['slurm']['nfs_homes_server']}\n
\tMonolith Testing: #{node['slurm']['monolith_testing']}\n"

origin = control_machine == nfs_apps_server ? control_machine : nfs_apps_server
mount slurm_dir do
  device "#{origin}:#{slurm_dir}"
  fstype 'nfs'
  enabled true
  dump 0
  pass 0
  action [:enable, :mount]
  only_if { !node['slurm']['monolith_testing'] && node['slurm']['control_machine'] != node['hostname'] }
end

origin = control_machine == nfs_homes_server ? control_machine : nfs_homes_server
mount homes_dir do
  device "#{origin}:#{homes_dir}"
  fstype 'nfs'
  enabled true
  dump 0
  pass 0
  action [:enable, :mount]
  only_if { !node['slurm']['monolith_testing'] && node['slurm']['control_machine'] != node['hostname'] }
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

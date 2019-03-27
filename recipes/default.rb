# ###########################################################################################
# user preparation
# ###########################################################################################

group node['slurm']['group'] do
  gid node['slurm']['gid']
  system true
  action :create
end

user node['slurm']['user'] do
  comment node['slurm']['comment']
  uid node['slurm']['uid']
  gid node['slurm']['gid']
  manage_home false
  system true
  action :create
end

# ###########################################################################################
# package installation
# ###########################################################################################
node['slurm']['common']['packages'].each(&method(:package))

# ###########################################################################################
# user preparation
# ###########################################################################################

group node['slurm']['group'] do
  gid node['slurm']['gid']
  action :create
end

user node['slurm']['user'] do
  comment node['slurm']['comment']
  uid node['slurm']['uid']
  gid node['slurm']['gid']
  manage_home false
  home '/var/lib/slurm'
  shell '/bin/bash'
  action :create
  not_if 'getent passwd newuser'
end

# ###########################################################################################
# package installation
# ###########################################################################################
node['slurm']['common']['packages'].each(&method(:package))

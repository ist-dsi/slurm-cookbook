default['slurm']['control_machine'] = default['slurm']['storage_machine'] = default['slurm']['accounting_machine'] = default['slurm']['nfs_apps_server'] = default['slurm']['nfs_homes_server'] = node['hostname']
default['slurm']['slurm_dir'] = '/etc/slurm-llnl'
default['slurm']['homes_dir'] = '/home'

default['slurm']['monolith_testing'] = true

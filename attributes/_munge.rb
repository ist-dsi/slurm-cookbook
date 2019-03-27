default['slurm']['munge']['key'] = '/etc/munge/munge.key'
default['slurm']['munge']['user'] = default['slurm']['munge']['group'] = 'munge'
default['slurm']['munge']['uid'] = default['slurm']['munge']['gid'] = 998
default['slurm']['munge']['env_file'] = '/etc/default/munge'
default['slurm']['munge']['auth_socket'] = '/var/run/munge/munge.socket.2'
default['slurm']['munge']['comment'] = "MUNGE Uid 'N' Gid Emporium"
default['slurm']['munge']['home_dir'] = '/var/lib/munge'

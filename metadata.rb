name 'slurm'

license 'Apache-2.0'

maintainer 'Manuel Torrinha'
maintainer_email 'manuel.torrinha@tecnico.ulisboa.pt'

issues_url 'https://github.com/ist-dsi/slurm-cookbook/issues'
source_url 'https://github.com/ist-dsi/slurm-cookbook'

description 'Installs/Configures slurm workload manager'

version '1.5.1'
chef_version '>= 14.0'

supports 'debian', '>= 9.0'

depends 'mariadb', '~> 2.0'
depends 'shifter', '~> 1.0'

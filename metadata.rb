name 'slurm'

license 'Apache-2.0'

maintainer 'Manuel Torrinha'
maintainer_email 'manuel.torrinha@tecnico.ulisboa.pt'

issues_url 'https://github.com/ist-dsi/slurm-cookbook/issues'
source_url 'https://github.com/ist-dsi/slurm-cookbook'

description 'Installs/Configures slurm workload manager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version '1.4.0'
chef_version '~> 14.0'

supports 'debian', '>= 9.0'

depends 'mariadb', '~> 2.0'
depends 'shifter', '~> 1.0'

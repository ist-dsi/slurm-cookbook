if !node['slurm']['shifter'].nil? && node['slurm']['shifter'].eql?(true)
  if !node['shifter'].nil? && node['shifter']['imagegw'].eql?(true)
    shifter_install_imagegw 'Install Shifter Runtime and make its binary available' do
      with_slurm true
      system_name node['slurm']['cluster']['name']
      siteenv_append node['shifter']['siteenv_append'] unless node['shifter']['siteenv_append'].nil?
      action :install
    end
  end

  node.default['shifter'] = {} if node['shifter'].nil?
  node.default['shifter']['imagegw_fqdn'] = node['slurm']['control_machine'] if node['shifter']['imagegw_fqdn'].nil?

  shifter_install 'Install Shifter Runtime and make its binary available' do
    action :install
    with_slurm true
    system_name node['slurm']['cluster']['name']
    imagegw_fqdn node['slurm']['control_machine']
    siteenv_append node['shifter']['siteenv_append'] unless node['shifter']['siteenv_append'].nil?
  end

  template 'Shifter plugin for SLURM' do
    path node['slurm']['server']['plugstack_dir'] + '/shifter.conf'
    source 'shifter_plugstack_conf.erb'
    mode '644'
    only_if 'which shifter'
  end
end

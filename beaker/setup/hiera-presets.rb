test_name "Preset hieradata for low memory vm footprint" do
  production_hieradata_dir = '/etc/puppetlabs/code/environments/production/hieradata'
  common_yaml = File.join(File.dirname(__FILE__), '../../hieradata/common.yaml')
  masters = select_hosts({:roles => ['master', 'compile_master']})
  [masters, dashboard, database].uniq do |host|
    on(host, "mkdir -p #{production_hieradata_dir}")
    scp_to(host, common_yaml, "#{production_hieradata_dir}/common.yaml")
    on(host, "chmod 644 #{production_hieradata_dir}/common.yaml")
  end
  master['hieradata_dir_used_in_install'] = production_hieradata_dir
end

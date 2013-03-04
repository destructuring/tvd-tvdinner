directory "#{node[:project_dir]}/#{node[:log_dir]}"
directory "#{node[:project_dir]}/#{node[:run_dir]}"
directory "#{node[:project_dir]}/#{node[:cache_dir]}"
directory "#{node[:project_dir]}/#{node[:service_dir]}"
directory "#{node[:release_dir]}/#{node[:service_dir]}" unless node[:project_dir] == node[:release_dir]

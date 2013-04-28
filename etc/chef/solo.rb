shome = File.expand_path("../../..", __FILE__)

bundler_cookbooks = ( ["#{shome}/lib"] + $: ).collect do |x|
  File.join(File.expand_path("..", x), "cookbooks")
end.select {|x| File.directory? x }

cookbook_path bundler_cookbooks
sandbox_path platform_specific_path("#{shome}/var/chef/sandboxes")
checksum_path platform_specific_path("#{shome}/var/chef/checksums")
file_cache_path platform_specific_path("#{shome}/var/chef/cache")
file_backup_path platform_specific_path("#{shome}/var/chef/backup")
node_path platform_specific_path("#{shome}/var/chef/node")
role_path platform_specific_path("#{shome}/var/chef/roles")
data_bag_path platform_specific_path("#{shome}/var/chef/data_bags")
cache_options({ :path => platform_specific_path("#{shome}/var/chef/cache/checksums") })

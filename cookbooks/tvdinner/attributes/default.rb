node.default[:release_dir] = ENV['RELEASE_DIR']
node.default[:project_dir] = ENV['PROJECT_DIR']

node.default[:app_dir] = "current"
node.default[:run_dir] = "run"
node.default[:log_dir] = "log"
node.default[:cache_dir] = "cache"
node.default[:service_dir] = "service"

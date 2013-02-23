%w(etc etc/chef spec tasks var).each do |d|
  directory "#{node[:release_dir]}/#{d}" do
    mode 00755
  end
end

file "#{node[:release_dir]}/etc/chef/solo.rb" do
  mode 00644
end

file "#{node[:release_dir]}/spec/.gitignore" do
  mode 00644
end

file "#{node[:release_dir]}/tasks/.gitignore" do
  mode 00644
end

template "#{node[:release_dir]}/var/.gitignore" do
  mode 00644
  source "gitignore.erb"
  variables({
    :ignore => 
      %w(/chef/cache /chef/backup
         /log /run /cache /service)})
end

template "#{node[:release_dir]}/.gitignore" do
  mode 00644
  source "gitignore.erb"
  variables({
    :ignore => 
      %w(/.bundle/ /vendor/bundle/ /*.gem
         /crash.log /output)})
end

%w(VERSION NOTICE README.md Gemfile).each do |f|
  template "#{node[:release_dir]}/#{f}" do
    mode 00644
    source "#{f}.erb"
  end
end

cookbook_file "#{node[:release_dir]}/LICENSE" do
  mode 00644
  source "LICENSE"
end

[ "lib", "lib/#{node[:tvd][:name]}" ].each do |d|
  directory "#{node[:release_dir]}/#{d}" do
    mode 00755
  end
end

template "#{node[:release_dir]}/lib/tvd-#{node[:tvd][:name]}.rb" do
  mode 00644
  source "tvdinner.rb.erb"
end

template "#{node[:release_dir]}/lib/tvd-#{node[:tvd][:name]}/version.rb" do
  mode 00644
  source "version.rb.erb"
end

template "#{node[:release_dir]}/tvd-#{node[:tvd][:name]}.gemspec" do
  mode 00644
  source "gemspec.erb"
end

directory "#{node[:release_dir]}/bin" do
  mode 00755
end

%w(build bump edit publish).each do |f|
  link "#{node[:release_dir]}/bin/#{f}" do
    to "../libexec/_sub"
  end
end

remote_directory "#{node[:release_dir]}/libexec" do
  source "jason"
  mode 00755
  files_mode 00644
end

remote_directory "#{node[:release_dir]}/libexec" do
  source "jasonx"
  files_mode 00755
end

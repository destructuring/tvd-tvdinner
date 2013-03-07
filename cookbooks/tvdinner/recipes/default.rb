include_recipe "tvdinner::microwave"

%w(spec tasks).each do |d|
  directory "#{node[:release_dir]}/#{d}" do
    mode 00755
  end
end

file "#{node[:release_dir]}/spec/.gitignore" do
  mode 00644
end

file "#{node[:release_dir]}/tasks/.gitignore" do
  mode 00644
end

%w(NOTICE README.md).each do |f|
  template "#{node[:release_dir]}/#{f}" do
    mode 00644
    source "#{f}.erb"
  end
end

template "#{node[:release_dir]}/VERSION" do
  mode 00644
  source "VERSION.erb"
  not_if { File.exists? "#{node[:release_dir]}/VERSION" }
end

cookbook_file "#{node[:release_dir]}/LICENSE" do
  mode 00644
  source "LICENSE"
end

directory "#{node[:release_dir]}/lib/#{node[:tvd][:name]}" do
  mode 00755
end

template "#{node[:release_dir]}/lib/tvd-#{node[:tvd][:name]}.rb" do
  mode 00644
  source "tvdinner.rb.erb"
end

directory "#{node[:release_dir]}/lib/tvd-#{node[:tvd][:name]}" do
  mode 00755
end

template "#{node[:release_dir]}/lib/tvd-#{node[:tvd][:name]}/version.rb" do
  mode 00644
  source "version.rb.erb"
end

template "#{node[:release_dir]}/tvd-#{node[:tvd][:name]}.gemspec" do
  mode 00644
  source "gemspec.erb"
end


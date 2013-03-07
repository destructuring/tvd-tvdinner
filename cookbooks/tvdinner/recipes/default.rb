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
         /crash.log /output /git)})
end

%w(NOTICE README.md Gemfile).each do |f|
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

directory "#{node[:release_dir]}/git" do
  mode 00755
end

directory "#{node[:release_dir]}/lib" do
  mode 00755
end

cookbook_file "#{node[:release_dir]}/lib/development.rb" do
  mode 00644
  source "development.rb"
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

directory "#{node[:release_dir]}/bin" do
  mode 00755
end

%w(build bump edit publish).each do |f|
  link "#{node[:release_dir]}/bin/#{f}" do
    to "../libexec/_sub"
  end
end

directory "#{node[:release_dir]}/libexec" do
  mode 00755
end

%w(_shflags _log4sh _jason _bump).each do |f|
  cookbook_file "#{node[:release_dir]}/libexec/#{f}" do
    source "jason/#{f}"
    mode 00644
  end
end

remote_directory "#{node[:release_dir]}/libexec" do
  source "jasonx"
  files_mode 00755
end

cookbook_file "#{node[:release_dir]}/bin/cook" do
  mode 00755
  source "cook"
end

cookbook_file "#{node[:release_dir]}/Makefile" do
  mode 00644
  source "Makefile"
end


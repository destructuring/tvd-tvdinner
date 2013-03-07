%w(etc etc/chef var).each do |d|
  directory "#{node[:release_dir]}/#{d}" do
    mode 00755
  end
end

file "#{node[:release_dir]}/etc/chef/solo.rb" do
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

%w(Gemfile).each do |f|
  template "#{node[:release_dir]}/#{f}" do
    mode 00644
    source "#{f}.erb"
  end
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

#
# Cookbook:: supermarket-deploy
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

git "/home/ec2-user/deploy" do
  repository 'git://github.com/rbenv/ruby-build.git'
  revision 'master'
  action :sync
end

bash 'install_ruby_build' do
  cwd "/home/ec2-user/deploy"
  user 'root'
  group 'root'
  code <<-EOH
    ./install.sh
    EOH
  environment 'PREFIX' => '/usr/local'
end

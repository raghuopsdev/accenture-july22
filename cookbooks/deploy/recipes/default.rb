#
# Cookbook:: deploy
# Recipe:: default

#
# Copyright:: 2022, The Authors, All Rights Reserved.


#deploy 'hello_repo' do
#  repo 'git@github.com:raghuopsdev/hello-world-1.git'
#  user 'root'
#  deploy_to '/tmp'
#  action :deploy
#  ssh_wrapper '/tmp/private_code/wrap-ssh4git.sh'
#end

git '/home/ec2-user/deployment' do
  # repository 'git@github.com:raghuopsdev/hello-world-1.git'
   repository ''https://github.com/raghuopsdev/hello-world-1.git'
   revision 'master'
   action :sync
   user 'root'
   group 'root'
end

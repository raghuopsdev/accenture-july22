#
# Cookbook:: java
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

package 'java-1.8.0-openjdk-devel.x86_64'

bash 'export-java-variable' do

  user 'root'
  cwd '/tmp'
  code <<-EOH
    export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
  EOH
  not_if { ::File.exist?('/usr/lib/jvm/java-1.8.0-openjdk') }


end


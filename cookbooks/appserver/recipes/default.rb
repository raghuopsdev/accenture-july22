#
# Cookbook:: appserver
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'tomcat'
package 'tomcat-webapps'
package 'tomcat-admin-webapps'

template '/usr/share/tomcat/conf/tomcat-users.xml' do
  source 'tomcat-users.xml.erb'
end

service 'tomcat' do
  action [:enable, :start]
end


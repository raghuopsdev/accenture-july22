#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

package 'httpd'
package 'tomcat'
package 'tomcat-webapps'

service 'tomcat' do
  action [:enable, :start]
end

template '/etc/httpd/conf.d/proxy.conf' do
  source 'proxy.conf.erb'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

service 'httpd' do
  action [:enable, :start]
end


#
# Cookbook:: src_compile
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#

package 'gcc'
package 'pcre-devel'
package 'make'

bash 'apache' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  wget https://archive.apache.org/dist/httpd/httpd-2.2.3.tar.gz
  tar -zxf httpd-2.2.3.tar.gz
  cd httpd*
  ./configure
  make
  make install
  EOH
  not_if { ::File.exist?('/usr/local/apache2/conf/httpd.conf') }
end

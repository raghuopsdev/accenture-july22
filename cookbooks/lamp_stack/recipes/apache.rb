package "httpd" do
 action :install
end

package "elinks"
package "mysql"

service "mysqld" do
  action [:enable, :start]
end

mysqlpass = data_bag_item("mysql-new", "rtpass.json")

mysql_service "mysqldefault" do
   version '5.7'
   initial_root_password mysqlpass["password"]
   action [:create, :start]
end


service "httpd" do
 action [:enable, :start]
end

node["lamp_stack"]["sites"].each do |sitename, data|

  document_root = "/var/www/html/#{sitename}"

  directory document_root do
    mode "0755"
    recursive true
  end
  
  directory "/var/www/html/#{sitename}/public_html" do
    action :create
  end

  directory "/var/www/html/#{sitename}/logs" do
    action :create
  end

  file "/var/www/html/#{sitename}/public_html/index.html" do
    content "#{sitename} welcomes you"
  end

  template "/etc/hosts" do
    source "hosts.erb"
  end

  template "/etc/httpd/conf.d/#{sitename}.conf" do
    source "virtualhosts.erb"
    mode "0644"
    variables(
     :document_root => document_root,
     :port => data["port"],
     :serveradmin => data["serveradmin"],
     :servername => data["servername"]
    )
 end
# notifies :restart, "service[httpd]"
end


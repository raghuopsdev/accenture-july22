#
# Cookbook:: winfile
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

file 'c:\welcome.txt' do
  content "Welcome to Windows Chef Client"
end

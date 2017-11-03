#
# Cookbook:: docker-custom
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.



# #Sets up yum repository for docker
# include_recipe 'chef-yum-docker::default'
#
# #Sets up apt repository for docker
# include_recipe 'chef-apt-docker::default'
#
# package 'docker'
#
#
# #Installs docker.
# include_recipe 'docker_compose::installation'



if node['platform'] == 'ubuntu'
  include_recipe 'docker-custom::ubuntu_platform'
elsif node['platform'] == 'centos' || node['platform'] == 'rhel' || node['platform'] == 'fedora'
  include_recipe 'docker-custom::rhel_platform'
elsif node['platform'] == 'debian'
  include_recipe 'docker-custom::deb_platform'
end


#Installs curl and docker compose
package 'curl'
execute 'sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose'
file '/usr/local/bin/docker-compose' do
  mode '755'
end

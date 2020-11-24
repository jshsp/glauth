# K8s GLAuth

change these vars:
k8s/var/main.yaml

and your container repo here:
redskysec/glauth/scripty5/buildpush

make do



# ldapsearch -LLL -H ldap://localhost:389 -D cn=serviceuser,ou=svcaccts,dc=glauth,dc=com -w mysecret -x -bdc=glauth,dc=com cn=hackers
ldapsearch -LLL -H ldap://localhost:3893 -D cn=serviceuser,ou=svcaccts,dc=glauth,dc=com -w mysecret -x -bdc=glauth,dc=com cn=hackers


 ldapsearch -LLL -H ldap://localhost:3893 -D cn=serviceuser,ou=svcaccts,dc=glauth,dc=com -w mysecret -x -bdc=glauth,dc=com cn=hackers
dn: cn=hackers,ou=superheros,dc=glauth,dc=com
cn: hackers
uid: hackers
ou: superheros
uidNumber: 5001
accountStatus: active
objectClass: posixAccount
objectClass: shadowAccount
loginShell: /bin/bash
homeDirectory: /home/hackers
description: hackers
gecos: hackers
gidNumber: 5501
memberOf: cn=superheros,ou=groups,dc=glauth,dc=com
memberOf: cn=vpn,ou=groups,dc=glauth,dc=com
shadowExpire: -1
shadowFlag: 134538308
shadowInactive: -1
shadowLastChange: 11000
shadowMax: 99999
shadowMin: -1
shadowWarning: 7



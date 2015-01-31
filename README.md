
  
# Table 'nas'


Field	Type	Null	Key	Default	Extra
id	int(10)	NO	PRI	NULL	auto_increment
nasname	varchar(128)	NO		NULL	
shortname	varchar(32)	NO		NULL	
type	varchar(30)	YES		NULL	
ports	int(11)	YES		NULL	
secret	varchar(60)	NO		NULL	
community	varchar(50)	YES		NULL	
description	varchar(200)	YES		NULL	
ssh_user	varchar(50)	YES		NULL	
ssh_pwd	varchar(50)	YES		NULL	
server	varchar(50)	YES		NULL	

  
# Table 'radacct'


Field	Type	Null	Key	Default	Extra
radacctid	bigint(21)	NO	PRI	NULL	auto_increment
acctsessionid	varchar(64)	NO	MUL		
acctuniqueid	varchar(32)	NO	MUL		
username	varchar(64)	NO	MUL		
groupname	varchar(64)	NO			
realm	varchar(64)	YES			
nasipaddress	varchar(15)	NO	MUL		
nasportid	varchar(15)	YES		NULL	
nasporttype	varchar(32)	YES		NULL	
acctstarttime	datetime	YES	MUL	NULL	
acctstoptime	datetime	YES	MUL	NULL	
acctsessiontime	int(12)	YES	MUL	NULL	
acctauthentic	varchar(32)	YES		NULL	
connectinfo_start	varchar(50)	YES		NULL	
connectinfo_stop	varchar(50)	YES		NULL	
acctinputoctets	bigint(20)	YES		NULL	
acctoutputoctets	bigint(20)	YES		NULL	
calledstationid	varchar(50)	NO			
callingstationid	varchar(50)	NO			
acctterminatecause	varchar(32)	NO			
servicetype	varchar(32)	YES		NULL	
framedprotocol	varchar(32)	YES		NULL	
framedipaddress	varchar(15)	NO	MUL		
acctstartdelay	int(12)	YES		NULL	
acctstopdelay	int(12)	YES		NULL	
xascendsessionsvrkey	varchar(10)	YES		NULL	

  
# Table 'radcheck'


Field	Type	Null	Key	Default	Extra
id	int(11) unsigned	NO	PRI	NULL	auto_increment
username	varchar(64)	NO	MUL		
attribute	varchar(64)	NO			
op	char(2)	NO		==	
value	varchar(253)	NO			

  
# Table 'radgroupcheck'


Field	Type	Null	Key	Default	Extra
id	int(11) unsigned	NO	PRI	NULL	auto_increment
groupname	varchar(64)	NO	MUL		
attribute	varchar(64)	NO			
op	char(2)	NO		==	
value	varchar(253)	NO			

  
# Table 'radgroupreply'


Field	Type	Null	Key	Default	Extra
id	int(11) unsigned	NO	PRI	NULL	auto_increment
groupname	varchar(64)	NO	MUL		
attribute	varchar(64)	NO			
op	char(2)	NO		=	
value	varchar(253)	NO			

  
# Table 'radpostauth'


Field	Type	Null	Key	Default	Extra
id	int(11)	NO	PRI	NULL	auto_increment
username	varchar(64)	NO			
pass	varchar(64)	NO			
reply	varchar(32)	NO			
authdate	timestamp	NO		CURRENT_TIMESTAMP	on update CURRENT_TIMESTAMP
nasip	varchar(45)	YES		NULL	

  
# Table 'radreply'


Field	Type	Null	Key	Default	Extra
id	int(11) unsigned	NO	PRI	NULL	auto_increment
username	varchar(64)	NO	MUL		
attribute	varchar(64)	NO			
op	char(2)	NO		=	
value	varchar(253)	NO			

  
# Table 'radusergroup'


Field	Type	Null	Key	Default	Extra
username	varchar(64)	NO	MUL		
groupname	varchar(64)	NO			
priority	int(11)	NO		1	

  
# Table 'user'


Field	Type	Null	Key	Default	Extra
id	int(11)	NO	PRI	NULL	auto_increment
prename	varchar(128)	YES		NULL	
lastname	varchar(128)	YES		NULL	
description	longtext	YES		NULL	
GuestAccessTime	int(11)	YES		NULL	
ARAP_Challenge_Response	varchar(128)	YES		NULL	
ARAP_Features	varchar(128)	YES		NULL	
ARAP_Password	varchar(128)	YES		NULL	
ARAP_Security	varchar(128)	YES		NULL	
ARAP_Security_Data	varchar(128)	YES		NULL	
ARAP_Zone_Access	varchar(128)	YES		NULL	
Access_Accept	varchar(128)	YES		NULL	
Access_Challenge	varchar(128)	YES		NULL	
Access_Reject	varchar(128)	YES		NULL	
Access_Request	varchar(128)	YES		NULL	
Accounting_Request	varchar(128)	YES		NULL	
Accounting_Response	varchar(128)	YES		NULL	
Acct_Authentic	varchar(128)	YES		NULL	
Acct_Delay_Time	varchar(128)	YES		NULL	
Acct_Input_Gigawords	varchar(128)	YES		NULL	
Acct_Input_Octets	varchar(128)	YES		NULL	
Acct_Input_Packets	varchar(128)	YES		NULL	
Acct_Interim_Interval	varchar(128)	YES		NULL	
Acct_Link_Count	varchar(128)	YES		NULL	
Acct_Multi_Session_Id	varchar(128)	YES		NULL	
Acct_Output_Gigawords	varchar(128)	YES		NULL	
Acct_Output_Octets	varchar(128)	YES		NULL	
Acct_Output_Packets	varchar(128)	YES		NULL	
Acct_Session_Id	varchar(128)	YES		NULL	
Acct_Session_Time	varchar(128)	YES		NULL	
Acct_Status_Type	varchar(128)	YES		NULL	
Acct_Terminate_Cause	varchar(128)	YES		NULL	
Acct_Tunnel_Connection	varchar(128)	YES		NULL	
Acct_Tunnel_Packets_Lost	varchar(128)	YES		NULL	
CHAP_Challenge	varchar(128)	YES		NULL	
CHAP_Password	varchar(128)	YES		NULL	
Callback_Id	varchar(128)	YES		NULL	
Callback_Number	varchar(128)	YES		NULL	
Called_Station_Id	varchar(128)	YES		NULL	
Calling_Station_Id	varchar(128)	YES		NULL	
Change_of_Authorization	varchar(128)	YES		NULL	
Class	varchar(128)	YES		NULL	
Cleartext_Password	varchar(128)	YES		NULL	
Configuration_Token	varchar(128)	YES		NULL	
Connect_Info	varchar(128)	YES		NULL	
Delegated_IPv6_Prefix	varchar(128)	YES		NULL	
Digest_AKA_Auts	varchar(128)	YES		NULL	
Digest_Algorithm	varchar(128)	YES		NULL	
Digest_Auth_Param	varchar(128)	YES		NULL	
Digest_CNonce	varchar(128)	YES		NULL	
Digest_Domain	varchar(128)	YES		NULL	
Digest_Entity_Body_Hash	varchar(128)	YES		NULL	
Digest_HA1	varchar(128)	YES		NULL	
Digest_Method	varchar(128)	YES		NULL	
Digest_Nextnonce	varchar(128)	YES		NULL	
Digest_Nonce	varchar(128)	YES		NULL	
Digest_Nonce_Count	varchar(128)	YES		NULL	
Digest_Opaque	varchar(128)	YES		NULL	
Digest_Qop	varchar(128)	YES		NULL	
Digest_Realm	varchar(128)	YES		NULL	
Digest_Response	varchar(128)	YES		NULL	
Digest_Response_Auth	varchar(128)	YES		NULL	
Digest_Stale	varchar(128)	YES		NULL	
Digest_URI	varchar(128)	YES		NULL	
Digest_Username	varchar(128)	YES		NULL	
EAP_Message	varchar(128)	YES		NULL	
Error_Cause	varchar(128)	YES		NULL	
Event_Timestamp	varchar(128)	YES		NULL	
Filter_ID	varchar(128)	YES		NULL	
Framed_AppleTalk_Link	varchar(128)	YES		NULL	
Framed_AppleTalk_Network	varchar(128)	YES		NULL	
Framed_AppleTalk_Zone	varchar(128)	YES		NULL	
Framed_Compression	varchar(128)	YES		NULL	
Framed_IP_Address	varchar(128)	YES		NULL	
Framed_IP_Netmask	varchar(128)	YES		NULL	
Framed_IPX_Network	varchar(128)	YES		NULL	
Framed_IPv6_Pool	varchar(128)	YES		NULL	
Framed_IPv6_Prefix	varchar(128)	YES		NULL	
Framed_IPv6_Route	varchar(128)	YES		NULL	
Framed_Interface_Id	varchar(128)	YES		NULL	
Framed_MTU	varchar(128)	YES		NULL	
Framed_Pool	varchar(128)	YES		NULL	
Framed_Protocol	varchar(128)	YES		NULL	
Framed_Route	varchar(128)	YES		NULL	
Framed_Routing	varchar(128)	YES		NULL	
Idle_Timeout	varchar(128)	YES		NULL	
Keep_Alives	varchar(128)	YES		NULL	
Login_IP_Host	varchar(128)	YES		NULL	
Login_IPv6_Host	varchar(128)	YES		NULL	
Login_LAT_Group	varchar(128)	YES		NULL	
Login_LAT_Node	varchar(128)	YES		NULL	
Login_LAT_Port	varchar(128)	YES		NULL	
Login_LAT_Service	varchar(128)	YES		NULL	
Login_Service	varchar(128)	YES		NULL	
Login_TCP_Port	varchar(128)	YES		NULL	
MS_ARAP_Challenge	varchar(128)	YES		NULL	
MS_ARAP_Password_Change_Reason	varchar(128)	YES		NULL	
MS_Acct_Auth_Type	varchar(128)	YES		NULL	
MS_Acct_EAP_Type	varchar(128)	YES		NULL	
MS_BAP_Usage	varchar(128)	YES		NULL	
MS_CHAP_CPW_1	varchar(128)	YES		NULL	
MS_CHAP_CPW_2	varchar(128)	YES		NULL	
MS_CHAP_Challenge	varchar(128)	YES		NULL	
MS_CHAP_Domain	varchar(128)	YES		NULL	
MS_CHAP_Error	varchar(128)	YES		NULL	
MS_CHAP_LM_Enc_PW	varchar(128)	YES		NULL	
MS_CHAP_MPPE_Keys	varchar(128)	YES		NULL	
MS_CHAP_NT_Enc_PW	varchar(128)	YES		NULL	
MS_CHAP_Response	varchar(128)	YES		NULL	
MS_CHAP2_CPW	varchar(128)	YES		NULL	
MS_CHAP2_Response	varchar(128)	YES		NULL	
MS_CHAP2_Success	varchar(128)	YES		NULL	
MS_Filter	varchar(128)	YES		NULL	
MS_Link_Drop_Time_Limit	varchar(128)	YES		NULL	
MS_Link_Utilization_Threshold	varchar(128)	YES		NULL	
MS_MPPE_Encryption_Policy	varchar(128)	YES		NULL	
MS_MPPE_Encryption_Types	varchar(128)	YES		NULL	
MS_MPPE_Recv_Key	varchar(128)	YES		NULL	
MS_MPPE_Send_Key	varchar(128)	YES		NULL	
MS_New_ARAP_Password	varchar(128)	YES		NULL	
MS_Old_ARAP_Password	varchar(128)	YES		NULL	
MS_Primary_DNS_Server	varchar(128)	YES		NULL	
MS_Primary_NBNS_Server	varchar(128)	YES		NULL	
MS_RAS_Vendor	varchar(128)	YES		NULL	
MS_RAS_Version	varchar(128)	YES		NULL	
MS_Secondary_DNS_Server	varchar(128)	YES		NULL	
MS_Secondary_NBNS_Server	varchar(128)	YES		NULL	
Message_Authenticator	varchar(128)	YES		NULL	
NAS_Filter_Rule	varchar(128)	YES		NULL	
NAS_IP_Address	varchar(128)	YES		NULL	
NAS_IPv6_Address	varchar(128)	YES		NULL	
NAS_Identifier	varchar(128)	YES		NULL	
NAS_Port	varchar(128)	YES		NULL	
NAS_Port_Id	varchar(128)	YES		NULL	
NAS_Port_Type	varchar(128)	YES		NULL	
Password_Retry	varchar(128)	YES		NULL	
Port_Limit	varchar(128)	YES		NULL	
Proxy_State	varchar(128)	YES		NULL	
Reply_Message	varchar(128)	YES		NULL	
SIP_AOR	varchar(128)	YES		NULL	
Service_Type	varchar(128)	YES		NULL	
Session_Timeout	varchar(128)	YES		NULL	
State	varchar(128)	YES		NULL	
Termination_Action	varchar(128)	YES		NULL	
Tunnel_Assignment_ID	varchar(128)	YES		NULL	
Tunnel_Client_Auth_ID	varchar(128)	YES		NULL	
Tunnel_Client_Endpoint	varchar(128)	YES		NULL	
Tunnel_Link_Reject	varchar(128)	YES		NULL	
Tunnel_Link_Start	varchar(128)	YES		NULL	
Tunnel_Link_Stop	varchar(128)	YES		NULL	
Tunnel_Medium_Type	varchar(128)	YES		NULL	
Tunnel_Password	varchar(128)	YES		NULL	
Tunnel_Preference	varchar(128)	YES		NULL	
Tunnel_Private_Group_ID	varchar(128)	YES		NULL	
Tunnel_Reject	varchar(128)	YES		NULL	
Tunnel_Server_Auth_ID	varchar(128)	YES		NULL	
Tunnel_Server_Endpoint	varchar(128)	YES		NULL	
Tunnel_Start	varchar(128)	YES		NULL	
Tunnel_Stop	varchar(128)	YES		NULL	
Tunnel_Type	varchar(128)	YES		NULL	
User_Name	varchar(128)	NO	UNI	NULL	
User_Password	varchar(128)	YES		NULL	
Vendor_Specific	varchar(128)	YES		NULL	

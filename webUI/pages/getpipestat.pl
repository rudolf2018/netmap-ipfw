#!/usr/local/bin/perl


print "Content-type: text/plain\n\n";

$total = 0;
if ($ENV{QUERY_STRING} eq "total")
{
	$total = 1;
}

$ttlpkt = 0;
$ttlbytes = 0;

open(PIP, "./netmap_ipfw show | head -20 |");
while (<PIP>)
{
	chomp($pdata = $_);

#	print "$pdata\n";
	(undef,$pkts,$bytes,undef,$pid,undef,undef,$srcip,undef,$dstip) = split(" ", $pdata);

	if ($total != 1)
	{
		print "$pid $pkts $bytes\n";
	}
	else
	{
		$ttlpkt += $pkts;
		$ttlbytes += $bytes;
	}
}
close(PIP);

if ($total == 1)
{
	print "total $ttlpkts $ttlbytes\n";
}



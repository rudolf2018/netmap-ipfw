#!/usr/local/bin/perl


print "Content-type: text/plain\n\n";


chomp($online = `ps -ax | grep kipfw | grep -v grep | wc`);

if ($online =~ /1\s+/)
{
	print "Online</div><div>Emulator Online!</div>";
}
else
{
	print "Offline</div><div>Emulator Offline!</div>";
}


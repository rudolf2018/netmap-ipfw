#!/usr/local/bin/perl


require "cgi-lib.pl";



print "Content-type: text/plain\n\n";


&ReadParse;


if ($in{operation} eq "BOOT")
{
    $cmd = "./netmap_ipfw -fq boot &";
    system($cmd);
    exit;
}


$rulename = $in{rulename};
$rulefile = "rulesets/$rulename.rule";

open(RUL, "< $rulefile");

%v = ();

$cmd = "./netmap_ipfw -fq flush";
system($cmd);

while (<RUL>)
{
    chomp($ruleline = $_);
    
    &parse_var_pair_pipe($ruleline);
    
    $cmd = sprintf "./netmap_ipfw add prob %f pipe %d %s from %s to %s", $v{prob}, $v{id}, $v{proto}, $v{srcip}, $v{dstip};
    system($cmd);
    
    if ($v{bw} =~ /bw(\d+)\.txt/)
    {
        $bwstr = sprintf "%4d000000", $1 + 5000;
    }
    else
    {
        $bwstr = sprintf "%4d000", $v{bw};
    }
    
    $cmd = sprintf "./netmap_ipfw pipe %d config bw %d delay %dms plr %f", $v{id}, $bwstr, $v{delay}, $v{loss};
    system($cmd);
}

close(RUL);



sub parse_var_pair_amp
{
    local $ruleline = shift;
    
    local @varpair = split(/\&/, $ruleline);

    %v = undef;
    foreach $k (0..$#varpair)
    {
        local ($var,$val) = split("\=", $varpair[$k]);
#print "$varpair[$k]   $var = $val\n";
        $v{$var} = $val;
    }
}

sub parse_var_pair_pipe
{
    local $ruleline = shift;
    
    local @varpair = split(/\|/, $ruleline);

    %v = undef;
    foreach $k (0..$#varpair)
    {
        local ($var,$val) = split("\=", $varpair[$k]);
#print "$varpair[$k]   $var = $val\n";
        $v{$var} = $val;
    }
}


#!/usr/local/bin/perl


require "cgi-lib.pl";



print "Content-type: text/html\n\n";


&ReadParse;


foreach $k (sort(keys(%in)))
{
    print "$k -> ". $in{$k} ."<br>\n";
}


$rulename = $in{rulename};
$rulefile = "rulesets/$rulename.rule";

open(RUL, "> $rulefile");

$id = 1;
for $i (1..20)
{
    if (!defined($in{"delete_$i"}))
    {
        last;
    }
    
    if ($in{"delete_$i"} eq "no")
    {
        if ($in{"bwradio_$i"} eq "profile")
        {
            $bwstr = $in{"bwprof_$i"};
        }
        else
        {
            $bwstr = sprintf "%s", $in{"bw_$i"};
        }
        
        printf RUL "id=%d|prob=%f|proto=%s|srcip=%s|dstip=%s|bw=%s|delay=%d|loss=%f\n",
                    $id, $in{"prob_$i"}, $in{"proto_$i"}, $in{"srcip_$i"}, $in{"dstip_$i"}, $bwstr, $in{"delay_$i"}, $in{"loss_$i"};
                
        $id++;
    }
}

close(RUL);

#exit;

print <<HTML1;
    <meta http-equiv=refresh content="0;url='./show_ruleset.pl?$rulename'">
    <html><body></body></html>
HTML1



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

sub make_edit
{
    local ($objname, $defval, $fieldlen) = @_;
    
    return "<input type=text name='$objname' size=$fieldlen value='$defval'>";
}

sub make_select
{
    local ($objname, $choices, $defval) = @_;
    
    local $tag = "";
    
    $tag = "<select name='$objname'>";
    foreach $k (split(/\|/,$choices))
    {
        if ($k eq $defval)
        {
            $tag .= "<option selected=selected>". $k;
        }
        else
        {
            $tag .= "<option>". $k;
        }
    }
    $tag .= "</select>";
    
    return $tag;
}


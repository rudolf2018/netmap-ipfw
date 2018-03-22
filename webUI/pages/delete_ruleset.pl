#!/usr/local/bin/perl


require "cgi-lib.pl";



print "Content-type: text/html\n\n";


&ReadParse;


foreach $k (sort(keys(%in)))
{
#    print "$k -> ". $in{$k} ."<br>\n";
}


$rulename = $in{rulename};
$rulefile = "rulesets/$rulename.rule";

unlink($rulefile);

print <<HTML1;
    <meta http-equiv=refresh content="0;url='./ruleset.html'">
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


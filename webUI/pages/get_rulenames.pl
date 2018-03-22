#!/usr/local/bin/perl


print "Content-type: text/html\n\n";

$select_rule = "<select name=rulename>";

while (<rulesets/*.rule>)
{
    $rulefile = $_;
#print "opening $rulefile\n";
    ($rulename = $rulefile) =~ s/(.*)\/(.*)\.(.*)/$2/;
    
    $select_rule .= "<option>". $rulename;
}

$select_rule .= "</select>";

print <<HTML1;
    $select_rule
HTML1


#!/usr/local/bin/perl


print "Content-type: text/html\n\n";

%v = ();

$cnt = 0;
while (<rulesets/*.rule>)
{
    $rulefile = $_;
#print "opening $rulefile\n";
    ($rulename = $rulefile) =~ s/(.*)\/(.*)\.(.*)/$2/;
    $cnt++;
}

    print <<BODY1;
                                        <div class="huge">$cnt</div>
BODY1

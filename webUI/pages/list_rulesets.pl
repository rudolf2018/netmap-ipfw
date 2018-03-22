#!/usr/local/bin/perl


print "Content-type: text/html\n\n";

print <<HEADER1;
	<script language=javascript>
		function delete_ruleset(rulename)
		{
			var reply = confirm("Are you sure to delete ruleset "+rulename+" ?");
			if (reply == true)
			{
				location.href = "./delete_ruleset.pl?rulename=" + rulename;
			}
		}
		function show_ruleset(rulename)
		{
			location.href = "./show_ruleset.pl?" + rulename;
		}
	</script>
                                        <thead>
                                            <tr>
                                                <th width=70%>RuleSet Name</th>
                                                <th width=15% align=center># of pipes</th>
                                                <th>Show Details</th>
						<th>Delete ?</th>
                                            </tr>
                                        </thead>
HEADER1

%v = ();

while (<rulesets/*.rule>)
{
    $rulefile = $_;
#print "opening $rulefile\n";
    ($rulename = $rulefile) =~ s/(.*)\/(.*)\.(.*)/$2/;

    chomp($rtn = `wc $rulefile`);
    ($npipes,undef,undef) = split(" ",$rtn);
    print <<BODY1;
                             <tbody>
                                 <tr class="odd gradeX">
                                     <td>$rulename</td>
                                     <td align=center>$npipes</td>
                                     <td><input type=button value="Show Details..." onClick="show_ruleset('$rulename');"></td>
                                     <td><input type=button value="Delete" onClick="delete_ruleset('$rulename');"></td>
                                 </tr>
BODY1
        print "             </tbody>\n";
}


sub parse_var_pair
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

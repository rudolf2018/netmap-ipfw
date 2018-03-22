#!/usr/local/bin/perl


require "cgi-lib.pl";


print "Content-type: text/html\n\n";


&ReadParse;

$rulename = $in{name};
$rulename =~ s/\s/\_/g;

$rulefile = "rulesets/". $rulename . ".rule";

$addrule = $in{add};

print <<HTML1;

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title></title>

        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- DataTables CSS -->
        <link href="../css/dataTables/dataTables.bootstrap.css" rel="stylesheet">

        <!-- DataTables Responsive CSS -->
        <link href="../css/dataTables/dataTables.responsive.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>

    <script language=javascript>
        function edit_ruleset(rulename)
        {
            location.href = "./edit_ruleset.pl?" + rulename;
        }
    </script>
    
        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">Network Emulator Control Panel</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                </span>
                                </div>
                                <!-- /input-group -->
                            </li>
                            <li>
                                <a href="index.html" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="ruleset.html"><i class="fa fa-bar-chart-o fa-fw"></i> Rule Sets</a>
                            </li>
<!--
                            <li>
                                <a href="settings.html"><i class="fa fa-edit fa-fw"></i> Global Settings</a>
                            </li>
-->
                            <li>
                                <a href="control.html"><i class="fa fa-table fa-fw"></i> Emulator Control</a>
                            </li>
<!--
                            <li>
                                <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="panels-wells.html">Panels and Wells</a>
                                    </li>
                                    <li>
                                        <a href="buttons.html">Buttons</a>
                                    </li>
                                    <li>
                                        <a href="notifications.html">Notifications</a>
                                    </li>
                                    <li>
                                        <a href="typography.html">Typography</a>
                                    </li>
                                    <li>
                                        <a href="icons.html"> Icons</a>
                                    </li>
                                    <li>
                                        <a href="grid.html">Grid</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="#">Second Level Item</a>
                                    </li>
                                    <li>
                                        <a href="#">Second Level Item</a>
                                    </li>
                                    <li>
                                        <a href="#">Third Level <span class="fa arrow"></span></a>
                                        <ul class="nav nav-third-level">
                                            <li>
                                                <a href="#">Third Level Item</a>
                                            </li>
                                            <li>
                                                <a href="#">Third Level Item</a>
                                            </li>
                                            <li>
                                                <a href="#">Third Level Item</a>
                                            </li>
                                            <li>
                                                <a href="#">Third Level Item</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="blank.html">Blank Page</a>
                                    </li>
                                    <li>
                                        <a href="login.html">Login Page</a>
                                    </li>
                                </ul>
                            </li>
-->
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <form action="./save_ruleset.pl" method=post>
                <input type=hidden name=rulename value='$rulename'>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Edit RuleSet Details</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <table border=0 width=100%><tr><td>Rule Set <font color=red size=+1><b>$rulename</b></font></td>
                                <td align=right><input type=button value="Save Changes on Ruleset..." onClick="this.form.submit()">
                                <input type=button value="Add New Pipe..." onClick="addnew_pipe('$rulename')"></td></tr></table>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
HTML1

print <<HEADER1;
                <script language=javascript>
                    function toggle_row_color(rowid)
                    {
                        var rowobj = document.getElementById("row_"+rowid);
                        var delobj = document.getElementById("delete_"+rowid);
                        var delbtnobj = document.getElementById("delbtn_"+rowid);
                        
                        if (delobj.value == "no")
                        {
                            delobj.value = "yes";
                            rowobj.style.backgroundColor = "red";
                            delbtnobj.value = "Undo Delete";
                        }
                        else
                        {
                            delobj.value = "no";
                            rowobj.style.backgroundColor = "white";
                            delbtnobj.value = "Delete Pipe";
                        }
                    }
                    function addnew_pipe(rulename)
                    {
                        location.href = "./edit_ruleset.pl?name=" + rulename + "&add=1";
                    }
                </script>

                                        <thead>
                                            <tr>
                                                <th>Pipe ID</th>
                                                <th>Probability</th>
                                                <th>Protocol</th>
                                                <th>Source IP</th>
                                                <th>Dest. IP</th>
                                                <th>Configuration</th>
                                            </tr>
                                        </thead>
HEADER1

    $allprofs = "";
    $bwprofdir = "/home/bwprofs";
    opendir(DIRF, $bwprofdir);
    while (readdir DIRF)
    {
        if (/(.*)\.txt/)
        {
            $profname = $_;
            $allprofs .= "|". $profname;
        }
    }
    closedir(DIRF);

%v = ();

    open(RULE, "< $rulefile");

    while (<RULE>)
    {
        chomp($ruleline = $_);
        &parse_var_pair_pipe($ruleline);

        $edit_prob = &make_edit("prob_".$v{id}, $v{prob}, 6);
        $select_proto = &make_select("proto_".$v{id}, "all|tcp|udp|sctp|icmp", $v{proto});
        $edit_srcip = &make_edit("srcip_".$v{id}, $v{srcip}, 15);
        $edit_dstip = &make_edit("dstip_".$v{id}, $v{dstip}, 15);
        $edit_bw = &make_edit("bw_".$v{id}, $v{bw}, 7);
        $edit_delay = &make_edit("delay_".$v{id}, $v{delay}, 5);
        $edit_loss = &make_edit("loss_".$v{id}, $v{loss}, 6);

        if ($v{bw} =~ /bw(\d+)\.txt/)
        {
            $bwradio_chk01 = "";
            $bwradio_chk02 = "checked";
            $edit_bw = &make_edit("bw_".$v{id}, 0, 7);
        }
        else
        {
            $bwradio_chk01 = "checked";
            $bwradio_chk02 = "";
        }

        $bwprof_file = $v{bw};
        $select_bwprof = &make_select("bwprof_".$v{id}, substr($allprofs,1), $bwprof_file);

        print <<BODY2;
                                 <tr id="row_$v{id}" class="odd gradeX">
                                         <td class="center">$v{id}<br>
                                             <input type=hidden name="delete_$v{id}" id="delete_$v{id}" value=no>
                                             <input type=button id="delbtn_$v{id}" value="Delete Pipe" onClick="toggle_row_color('$v{id}')"></td>
                                         <td class="center">$edit_prob</td>
                                         <td class="center">$select_proto</td>
                                         <td class="center">$edit_srcip</td>
                                         <td class="center">$edit_dstip</td>
                                         <td><table border=1 cellpadding=2 width=100%>
                                         <tr><td align=top>bandwidth = </td>
                                         <td><input type=radio name=bwradio_$v{id} value="fixed"   $bwradio_chk01> Fixed $edit_bw kbps OR <br>
                                             <input type=radio name=bwradio_$v{id} value="profile" $bwradio_chk02> Profile $select_bwprof</td></tr>
                                         <tr><td>delay = </td><td>$edit_delay ms</td></tr>
                                         <tr><td>loss prob. = </td><td>$edit_loss</td></tr></table></td>
                                 </tr>
BODY2
        print "             </tbody>\n";
    }

    if ($addrule gt "")
    {
        $v{id}++;
        $edit_prob = &make_edit("prob_".$v{id}, "1", 6);
        $select_proto = &make_select("proto_".$v{id}, "all|tcp|udp|sctp|icmp", "all");
        $edit_srcip = &make_edit("srcip_".$v{id}, "0.0.0.0", 15);
        $edit_dstip = &make_edit("dstip_".$v{id}, "0.0.0.0", 15);
        $edit_bw = &make_edit("bw_".$v{id}, "0", 10);
        $edit_delay = &make_edit("delay_".$v{id}, "0", 5);
        $edit_loss = &make_edit("loss_".$v{id}, "0", 6);

        $select_bwprof = &make_select("bwprof_".$v{id}, substr($allprofs,1), "");

        print <<BODY3;
                                 <tr id="row_$v{id}" class="odd gradeX">
                                         <td class="center">$v{id}<br>
                                             <input type=hidden name="delete_$v{id}" id="delete_$v{id}" value=no>
                                         <td class="center">$edit_prob</td>
                                         <td class="center">$select_proto</td>
                                         <td class="center">$edit_srcip</td>
                                         <td class="center">$edit_dstip</td>
                                         <td><table border=0 width=100%>
                                         <tr><td align=top>bandwidth = </td>
                                         <td><input type=radio name=bwradio_$v{id} value="fixed" checked> Fixed $edit_bw kbps OR <br>
                                             <input type=radio name=bwradio_$v{id} value="profile" > Profile $select_bwprof</td></tr>
                                         <tr><td>delay = </td><td>$edit_delay ms</td></tr>
                                         <tr><td>loss prob. = </td><td>$edit_loss</td></tr></table></td>
                                 </tr>
                            </tbody>
BODY3

    }

print <<HTML2;
                    </form>
                                    </table>
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="../js/dataTables/jquery.dataTables.min.js"></script>
        <script src="../js/dataTables/dataTables.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function() {
                $('#dataTables-example').DataTable({
                        responsive: true
                });
            });
        </script>

    </body>
</html>
HTML2


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


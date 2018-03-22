#!/usr/local/bin/perl


print "Content-type: text/html\n\n";

$rulename = $ENV{QUERY_STRING};
$rulefile = "rulesets/". $ENV{QUERY_STRING} . ".rule";

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
            location.href = "./edit_ruleset.pl?name=" + rulename;
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

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">RuleSet Details</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <table border=0 width=100%><tr><td>Rule Set <font color=red size=+1><b>$rulename</b></font></td>
                                <td align=right><input type=button value="Edit Ruleset..." onClick="edit_ruleset('$rulename')"></td></tr></table>
                                
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
HTML1

print <<HEADER1;
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

%v = ();

    open(RULE, "< $rulefile");

    while (<RULE>)
    {
        chomp($ruleline = $_);
        &parse_var_pair_pipe($ruleline);

        if ($v{bw} =~ /bw(\d+)\.txt/)
        {
            $bwstr = sprintf "bandwidth = <font color=red>%s</font>", $v{bw};
        }
        else
        {
            if ($v{bw} == 0)
            {
                $bwstr = "bandwidth = Unlimited";
            }
            else
            {
                $bwstr = "bandwidth = Fixed ". $v{bw} ." kbps";
            }
        }
        
        print <<BODY2;
                                 <tr id="row_$rulename" class="odd gradeX">
                                         <td class="center">$v{id}</td>
                                         <td class="center">$v{prob}</td>
                                         <td class="center">$v{proto}</td>
                                         <td class="center">$v{srcip}</td>
                                         <td class="center">$v{dstip}</td>
                                         <td width=22%>$bwstr<br>delay = $v{delay}ms<br>loss prob. = $v{loss}</td>
                                 </tr>
BODY2
        print "             </tbody>\n";
    }

print <<HTML2;
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


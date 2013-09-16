#============================================================= -*-perl-*-
#
# BackupPC::CGI::StopServer package
#
# DESCRIPTION
#
#   This module implements the StopServer action for the CGI interface.
#
# AUTHOR
#   Craig Barratt  <cbarratt@users.sourceforge.net>
#
# COPYRIGHT
#   Copyright (C) 2003-2013  Craig Barratt
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#========================================================================
#
# Version 4.0.0alpha2, released 15 Sep 2013.
#
# See http://backuppc.sourceforge.net.
#
#========================================================================

package BackupPC::CGI::StopServer;

use strict;
use BackupPC::CGI::Lib qw(:all);

sub action
{
    if ( defined($bpc) && $bpc->ServerOK() ) {
        $bpc->ServerMesg("log User $User requested server shutdown");
        $bpc->ServerMesg("server shutdown");
        for ( my $i = 0; $i < 10; $i++ ) {
            last unless $bpc->ServerOK();
            sleep(1);
        }
        sleep(2);
    }
    print $Cgi->redirect($MyURL);
}

1;

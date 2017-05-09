#!/usr/bin/perl
#
# DW::Controller::HomePage
#
# Controller for the main site home page.
#
# Authors:
#      Jen Griffin <kareila@livejournal.com>
#
# Copyright (c) 2017 by Dreamwidth Studios, LLC.
#
# This program is free software; you may redistribute it and/or modify it under
# the same terms as Perl itself. For a copy of the license, please reference
# 'perldoc perlartistic' or 'perldoc perlgpl'.
#

package DW::Controller::HomePage;

use strict;

use DW::Controller;
use DW::Routing;
use DW::Template;
use LJ::Hooks;

# register the index view
DW::Routing->register_string( '/index', \&index_handler, app => 1 );

sub index_handler {
    my ( $ok, $rv ) = controller( anonymous => 1 );
    return $rv unless $ok;

#    return $rv->{remote} ? userpage( $rv ) : anonpage( $rv );
    return anonpage( $rv );
}

# for logged-out homepage
sub anonpage {
    my $rv = $_[0];  # controller variables
    # hooks and alternate templates may be defined locally
    $rv = LJ::Hooks::run_hook( 'custom_homepage_anon', $rv )
        if LJ::Hooks::are_hooks( 'custom_homepage_anon' );

    return DW::Template->render_template( 'homepage/anon.tt', $rv );
}

# for logged-in homepage
sub userpage {
    my $rv = $_[0];  # controller variables
    # hooks and alternate templates may be defined locally
    $rv = LJ::Hooks::run_hook( 'custom_homepage_user', $rv )
        if LJ::Hooks::are_hooks( 'custom_homepage_user' );

    return DW::Template->render_template( 'homepage/user.tt', $rv );
}


1;

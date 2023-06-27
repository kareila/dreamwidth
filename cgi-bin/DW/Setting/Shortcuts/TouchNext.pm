#!/usr/bin/perl
#
# DW::Setting::Shortcuts::TouchNext
#
# LJ::Setting module which controls the touch shortcut for next item
#
# Authors:
#      Allen Petersen <allen@suberic.net>
#
# Copyright (c) 2017 by Dreamwidth Studios, LLC.
#
# This program is free software; you may redistribute it and/or modify it under
# the same terms as Perl itself.  For a copy of the license, please reference
# 'perldoc perlartistic' or 'perldoc perlgpl'.
#

package DW::Setting::Shortcuts::TouchNext;
use base 'DW::Setting::Shortcuts::TouchGesture';
use strict;
use warnings;

sub prop_name {
    return "opt_shortcuts_touch_next";
}

sub label {
    my $class = shift;
    return $class->ml('setting.shortcuts_touch.next.label');
}

sub prop_key {
    return "shortcuts_touch_next";
}

1;


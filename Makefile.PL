#!/usr/bin/perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'tld.pl',
    AUTHOR       => q{Ivan Trunaev},
    EXE_FILES 	 => [ './bin/tld.pl' ],
    VERSION      => '0.3',
    PREREQ_PM    => {'Mojolicous' => '9.51', 'AnyEvent::HTTPD' => 0.93, 'EV' => '4.37'},
);

1;


=encoding utf8

=head1 NAME

tld.pl - tld.pl Mojolcoius Application

=head1 SYNOPSIS

    Usage: hypnotoad tld.pl --tld=pl
    
    
=head1 AUTHOR

tld.pl developed by Ivan Trunaev, Russia, 2026

Contacts <ivan@trunaev.ru>

=cut

#!/usr/bin/perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'tld.pl',
    AUTHOR       => q{Ivan Trunaev},
    EXE_FILES 	 => [ './bin/tld.pl', './bin/tld-daemon.pl' ],
    VERSION      => '0.81',
    PREREQ_PM    => {'Mojolicous' => '9.51', 'AnyEvent::HTTPD' => 0.93, 'EV' => '4.37'},
);

1;

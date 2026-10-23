#!/usr/bin/perl

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'tld.pl',
    AUTHOR       => q{Ivan Trunaev},
    EXE_FILES 	 => [ './bin/tld.pl' ],
    VERSION      => '0.1',
    PREREQ_PM    => {'AnyEvent::HTTPD' => 0.93, 'EV' => '4.37'},
);

1;

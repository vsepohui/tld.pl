#!/usr/bin/perl

use 5.022;
use warnings;

use Mojo::Base;

use Mojo::Server::Hypnotoad;
use Mojo::Util qw(extract_usage getopt);

getopt \@ARGV, 
  'port=s' 			=> \$ENV{TLD_PORT},
  'tld=s' 			=> \$ENV{TLD},
  'f|foreground' 	=> \$ENV{HYPNOTOAD_FOREGROUND},
  'h|help'       	=> \my $help,
  's|stop'       	=> \$ENV{HYPNOTOAD_STOP},
  't|test'       	=> \$ENV{HYPNOTOAD_TEST},
;

die extract_usage if $help;



my $server = Mojo::Server::Hypnotoad->new;


$server->run('tld.pl');

1;

=pod2 

=head1 NAME

tld-daemon.pl - Starting tld.pl daemon

=head1 SYNOPSIS

    Usage: tld-daemon.pl [--port=80] [--tld=pl]
    
        tld-daemon.pl --port 9090 --tld pl.vsepohui.ru
        tld-daemon.pl -s 	Stopping daemon
        tld-daemon.pl -f 	Foreground run
    
    Options:
    
        port - Binding port (default: 80)
        tld  - TLD (default: pl)

head1 AUTHOR

tld.pl developed by Ivan Trunaev, Russia, 2026

Contacts <ivan@trunaev.ru>

=cut

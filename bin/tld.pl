#!/usr/bin/perl

use 5.022;
use warnings;

use AnyEvent::HTTPD;
use Getopt::Long;

my ($port, $tld);
GetOptions ("port=i" => \$port, "tld=s"  => \$tld);

$port ||= 80;
$tld ||= 'pl';


my $httpd = AnyEvent::HTTPD->new (port => $port);
$httpd->reg_cb (
	'' => sub {
		my ($httpd, $req) = @_;
		my $domain = $req->headers->{host};
		$domain =~ s/\:\d+$//;
		$domain =~ s/\.$tld$//;
		my $url = 'https://metacpan.org/search?q=' . $domain . '&lucky=1';
		$req->respond ([301, '', {'Content-Type' => 'text/plain', 'Location' => $url }]);
	},
);
$httpd->run;


=encoding utf8

=head1 NAME

tld.pl - TLD *.pl redirector to Metacpan

=head1 SYNOPSIS

    Usage: mantra [--port=80] [--tld=pl]
    
        tld.pl --port 9090 --tld pl.vsepohui.ru
    
    Options:
    
        port - Binding port (default: 80)
        tld  - TLD (default: pl)

=head1 AUTHOR

tld.pl developed by Ivan Trunaev, Russia, 2026

Contacts <ivan@trunaev.ru>

=cut


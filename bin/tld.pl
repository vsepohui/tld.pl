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
	'/' => sub {
		my ($httpd, $req) = @_;
		my $domain = $req->headers->{host};
		$domain =~ s/\:\d+$//;
		$domain =~ s/\.$tld$//;
		my $url = 'https://metacpan.org/search?size=20&q=' . $domain;
		$req->respond ([301, '', {'Content-Type' => 'text/plain', 'Location' => $url }, $url]);
	},
);
$httpd->run;

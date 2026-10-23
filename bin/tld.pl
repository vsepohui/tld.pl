#!/usr/bin/perl
use Mojolicious::Lite;

use Getopt::Long;
my $tld;
GetOptions ("tld"  => \$tld);

$tld ||= 'pl';

any '/' => \&handler;
any '/*' => \&handler;

sub handler {
	my $c = shift;
	my $domain = $c->req->headers->host;
	$domain =~ s/\:\d+$//;
	$domain =~ s/\.$tld$//;
	
	my $url = 'https://metacpan.org/search?q=' . $domain . '&lucky=1';
	
	$c->redirect_to($url);
}

app->start;

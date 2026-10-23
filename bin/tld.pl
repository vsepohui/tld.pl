#!/usr/bin/perl
use Mojolicious::Lite;

my $tld = $ENV{'TLD'} || 'pl';
my $port = $ENV{'TLD_PORT'} || '80';

app->config(hypnotoad => {listen => ['http://*:'.$port]});

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

#!/usr/bin/perl

use strict;
use Getopt::Long;
use Log::Message;

$0 =~ s/^\.\///g;

my $args = join(' ', @ARGV);

GetOptions (
    "h|help" => \&help
);

my %log_opts;
my $log = Log::Message->new(%log_opts);

# arguments validation

&doublePrint("Program starts: $0 $args");

&doublePrint("Program ends.");

# --------------------------------------------------------------------------- #
sub doublePrint() {
    my $message = shift;
    print &timestamp() . ' - ' . $message . "\n";
}

# --------------------------------------------------------------------------- #
sub timestamp() {
    my ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
        = localtime(time);
    return sprintf("%04d%02d%02d %02d:%02d:%02d",
        $year+1900, $mon+1, $mday, $hour, $min, $sec);
}

# --------------------------------------------------------------------------- #
sub help() {
    my $message = shift;
    print <<EOF;
usage: $0
    optional
        [-h|help]   :   help
EOF
    print "help!";
    exit 1;
}

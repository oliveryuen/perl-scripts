#!/usr/bin/perl

use strict;
use Getopt::Long;
use Log::Message;

$0 =~ s/^\.\///g;

my $args = join(' ', @ARGV);

GetOptions (
    "h|help" => \&help
);

# arguments validation

&doublePrint("Program starts: $0 $args");

my $dir = "$ENV{HOME}";
&readDir($dir);

open IN, 'file.pl';
while(<IN>) {
    my $line = $_;
    print $line;
}
close IN;

&doublePrint("Program ends.");

# --------------------------------------------------------------------------- #
sub getFileSize() {
    my $file = shift;
    my $filesize = (stat $file)[7];
    return $filesize;
}

# --------------------------------------------------------------------------- #
sub readFile() {
    my $filename = shift;
    open IN, $filename || die("Can't read file: $filename $!");
    while(<IN>) {
        # do stuff
    }
    close IN;
}

# --------------------------------------------------------------------------- #
sub readDir() {
    my $dir = shift;
    my $pattern = shift;
    opendir DIR, $dir || die("Can't read dir: $dir $!");
    my @files = grep { /.*/ } readdir DIR;
    closedir DIR;

    foreach my $file (@files) {
        print "Found file: $dir/$file\n";
    }
}

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

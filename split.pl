#!usr/bin/env perl

use strict;
use warnings;
no warnings 'uninitialized';
use Encode qw(encode decode);
my $enc = 'utf-8';

# Data::Dumper für Debugging
use Data::Dumper;

die "Argumente: $0 ead-xml file | outputpath | Option [num]eric/[nam]e/[isil] \n" unless @ARGV == 3;

# Unicode-Support innerhalb des Perl-Skripts / für Output
use utf8;
binmode STDOUT, ":utf8";

my $eadfile = $ARGV[0] or die "Need to get ead file on the command line\n";

my $buffer;
my $nametype;
my $name;
my $isil;
my $sys;
my $i = 1;
my $number;

if ($ARGV[2] =~ /nam/) {
    $nametype = 1;
} elsif ($ARGV[2] =~ /isil/) {
    $nametype = 2;
} else {
    $nametype = 0;
}

my $outputpath = $ARGV[1];

open(my $eaddata, '<', $eadfile) or die "Could not open '$eadfile' $!\n";
while (my $line = <$eaddata>) {

    $buffer .= $line;

    if ($line =~ /<archdesc level="collection"/) {
        $sys = $line;
	chomp $sys;
	$sys = substr($sys,-10,-1);
    }

    if ($line =~ /<\/repository/) {
        $isil = $line;
	chomp $isil;
	$isil =~ s/<\/repository//g;
	$isil =~ s/^>//g;
	$isil =~ s/ /-/g;
	$name =~ s/ä/ae/g;
	$isil =~ s/Ä/Ae/g;
	$isil =~ s/ö/oe/g;
	$isil =~ s/Ö/Oe/g;
	$isil =~ s/ü/ue/g;
	$isil =~ s/Ü/Ue/g;
	$isil =~ s/ë/e/g;
	$isil =~ s/Ë/E/g;
	$isil =~ s/é/e/g;
	$isil =~ s/É/E/g;
	$isil =~ s/è/e/g;
	$isil =~ s/È/E/g;
	$isil =~ s/ê/e/g;
	$isil =~ s/Ê/E/g;
	$isil =~ s/à/a/g;
	$isil =~ s/À/A/g;
	$isil =~ s/á/a/g;
	$isil =~ s/Á/A/g;
	$isil =~ s/â/a/g;
	$isil =~ s/Â/A/g;
	$isil =~ s/î/i/g;
	$isil =~ s/Î/I/g;
	$isil =~ s/ó/o/g;
	$isil =~ s/Ó/O/g;
	$isil =~ s/ô/o/g;
	$isil =~ s/Ô/O/g;
	$isil =~ s/ń/n/g;
	$isil =~ s/Ń/N/g;
	$isil =~ s/\(//g;
	$isil =~ s/\)//g;
	$isil =~ s/\[//g;
	$isil =~ s/\]//g;
	$isil =~ s/\///g;
	$isil =~ s/\\//g;
	$isil =~ s/=//g;
	$isil =~ s/\.//g;
	$isil =~ s/,//g;
	$isil =~ s/'//g;
	$isil =~ s/’//g;
	$isil =~ s/‘//g;
	$isil =~ s/://g;
	$isil =~ s/‐/-/g;
	$isil =~ s/–/-/g;
	$isil =~ s/"//g;
	$isil =~ s/&amp;//g;
	$isil =~ s/\?//g;
	$isil =~ s/__/-/g;
	$isil =~ s/_-/-/g;
	$isil =~ s/---/-/g;
	$isil =~ s/--/-/g;
    }

    if ($line =~ /<\/titleproper/ ) {
	$name = decode($enc, $line);
	$name = lc $name;
	chomp $name;
	$name =~ s/<\/titleproper//g;
	$name =~ s/^>//g;
	$name =~ s/ /_/g;
	$name =~ s/ä/ae/g;
	$name =~ s/Ä/Ae/g;
	$name =~ s/ö/oe/g;
	$name =~ s/Ö/Oe/g;
	$name =~ s/ü/ue/g;
	$name =~ s/Ü/Ue/g;
	$name =~ s/ë/e/g;
	$name =~ s/Ë/E/g;
	$name =~ s/é/e/g;
	$name =~ s/É/E/g;
	$name =~ s/è/e/g;
	$name =~ s/È/E/g;
	$name =~ s/ê/e/g;
	$name =~ s/Ê/E/g;
	$name =~ s/à/a/g;
	$name =~ s/À/A/g;
	$name =~ s/á/a/g;
	$name =~ s/Á/A/g;
	$name =~ s/â/a/g;
	$name =~ s/Â/A/g;
	$name =~ s/î/i/g;
	$name =~ s/Î/I/g;
	$name =~ s/ó/o/g;
	$name =~ s/Ó/O/g;
	$name =~ s/ô/o/g;
	$name =~ s/Ô/O/g;
	$name =~ s/ń/n/g;
	$name =~ s/Ń/N/g;
	$name =~ s/\(//g;
	$name =~ s/\)//g;
	$name =~ s/\[//g;
	$name =~ s/\]//g;
	$name =~ s/\///g;
	$name =~ s/\\//g;
	$name =~ s/=//g;
	$name =~ s/\.//g;
	$name =~ s/,//g;
	$name =~ s/'//g;
	$name =~ s/’//g;
	$name =~ s/‘//g;
	$name =~ s/://g;
	$name =~ s/‐/-/g;
	$name =~ s/–/-/g;
	$name =~ s/"//g;
	$name =~ s/&amp;//g;
	$name =~ s/\?//g;
	$name =~ s/__/_/g;
	$name =~ s/_-/_/g;

	$name = encode($enc, $name);
	$name = substr($name,0,120);
    }

    if ($line =~ /^>$/) {
	my $exportfile;
	if ($nametype == 1) {
            $exportfile = "$outputpath/$name.xml";             
	} elsif ($nametype == 2) {
	    $exportfile = "$outputpath/ead_CH-001880-7_" . $isil . "_" . $name . ".xml";
	} else {
            $number = sprintf("%05d", $i);	
	    $exportfile = "$outputpath/han$number.xml";   # generate a new filename
	}
        open(my $export, '>', $exportfile) or die "Could not open file '$exportfile' $!";
	print $export $buffer;
	print "File splitted: $exportfile\n";
	$buffer = "";
	$i++; 
    } 

}


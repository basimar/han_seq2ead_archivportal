#!/usr/bin/env perl

use strict;
use warnings;
no warnings 'uninitialized';

# Data::Dumper for debugging
use Data::Dumper;

# XML::Writer to write output file
use XML::Writer;
use IO::File;

# Sortierung von Signaturen
use Sort::Naturally;


my @them = qw(
  1 0 2 3 4 5
);

my @themnew = sort { ncmp($a,$b) } @them;

print join(' ', @themnew), "\n";

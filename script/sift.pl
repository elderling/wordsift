#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

use Getopt::Long;
use Data::Dumper;

use WordSift;
use Dictionary;

my $min_word_length;
my $max_word_length;
my $max_matches;
my $available_letters; 

my $result = GetOptions( 
    'min-word-length=i' => \$min_word_length,
    'max-word-length=i' => \$max_word_length,
    'max-matches=i' => \$max_matches,
    'available-letters=s' => \$available_letters, );

print $available_letters;
exit if !$available_letters;

$min_word_length ||= 7;
$max_matches ||= 10;
$max_word_length ||=100;

print "Requested matches: $max_matches\n";
print "Minimum word length: $min_word_length\n";
print "Maximum word length: $max_word_length\n";
print "Available letters: $available_letters\n";

my $dictionary = Dictionary->new()->word_list();

my @filtered =
  grep { (length $_ >= $min_word_length and length $_ <= $max_word_length) }
  @{$dictionary};

chomp(@filtered);

@filtered = sort { length $b <=> length $a } @filtered;

print scalar @filtered . " words in dictionary\n";

my @matches;

foreach my $word (@filtered) {
    if ( WordSift::match( $word, $available_letters ) ) {
        push @matches, $word;
        if ( scalar @matches == $max_matches ) { last; };
    }
}

print join "\n", @matches;

print "\n";


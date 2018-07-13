package Dictionary;

use strict;
use warnings;
use v5.16;

my $DEFAULT_DICTIONARY = './dict_merged_00.txt';

# TODO: Add POD
# Add some other things, too

sub new {
    my $class = shift;
    my $param = shift;

    my $self = {};

    bless $self, $class;

    my $filename = $param->{'filename'} || $DEFAULT_DICTIONARY;

    $self->_load_dictionary($filename);

    return $self;
}

sub word_list {
    my $self = shift;

    return $self->{'_word_list'};
}

sub _load_dictionary {
    my $self     = shift;
    my $filename = shift;

    open( my $fh, '<', $filename ) or die "Error loading $filename";

    my @dictionary = <$fh>;

    my $chomped = chomp(@dictionary);

    say '$chomped => ' . $chomped;

    $self->{'_word_list'} = \@dictionary;

    return;
}

1;

package WordSift;

use strict;
use warnings;

my $pool_hash;

sub get_pool_hash {
    my $letter_pool = shift;

    return $pool_hash if $pool_hash;

    $pool_hash = {};

    for ( my $i = 0; $i < length $letter_pool; $i++ ) {
        $pool_hash->{ substr( $letter_pool, $i, 1) }++;
    }

    return $pool_hash;
}

sub match {
    my $word = shift;
    my $letter_pool = shift;

    my %pool = %{ get_pool_hash( $letter_pool ) };

    for ( my $i = 0; $i < length $word; $i++ ) {
        my $current_letter = substr( $word, $i, 1 );

        if ( $pool{ $current_letter } ) {
            $pool{ $current_letter }--;
            next;
        }
        else {
            return;
        }
    }

    #print join "\n", @available;

    return 1;
}

1;

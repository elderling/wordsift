package GameBoard;

use v5.16;
use strict;
use warnings;

#<<<

# 4 letters 5 letters
my $board_3x3_a = [ 
    [qw( b k o )], 
    [qw( e o o )], 
    [qw( l b w )], 
];

# 4 letters 6 letters 6 letters
my $board_4x4_a = [
    [qw( l a t o )],
    [qw( o l t r )],
    [qw( g e e a )],
    [qw( b u g n )],
];

# 4 letters 5 letters
my $board_3x3_b = [
    [qw( s k e )],
    [qw( m t t )],
    [qw( o e n )],
];

# 4 letters 4 letters 8 letters
my $board_4x4_b = [
    [qw( f h f s )],
    [qw( l s i k )],
    [qw( a r c e )],
    [qw( g a t n )],
];
#>>>

sub spit_board {
    my $depth = 0;

    # On depth 0, any unused slot is a valid move

    my $current_x = 0;
    my $current_y = 0;

    my $desired_letter;

    my $board = $board_4x4_b;
    for my $x ( 0 .. $#{$board} ) {
        for my $y ( 0 .. $#{$board} ) {
            say "x => $x , y => $y, value => " . $board->[$x][$y];
        }
    }
}

1;

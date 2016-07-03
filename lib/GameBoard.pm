package GameBoard;

use v5.16;
use strict;
use warnings;

#<<<

# 4 letters 5 letters
my $board_3x3_a = [ 
    [qw( b e l )], 
    [qw( k o b )], 
    [qw( o o w )], 
];

# 4 letters 6 letters 6 letters
my $board_4x4_a = [
    [qw( l o g b )],
    [qw( a l e u )],
    [qw( t t e g )],
    [qw( o r a n )],
];

# 4 letters 5 letters
my $board_3x3_b = [
    [qw( s m o )],
    [qw( k t e )],
    [qw( e t n )],
];

# 4 letters 4 letters 8 letters

my $board_4x4_b = [
    [qw( f l a g )],
    [qw( h s r a )],
    [qw( f i c t )],
    [qw( s k e n )],
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
        for my $y ( 0 .. $#{ $board->[$x] } ) {
            say "x => $x , y => $y, value => " . $board->[$x][$y];
        }
    }
}

1;

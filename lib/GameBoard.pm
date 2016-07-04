package GameBoard;

use v5.16;
use strict;
use warnings;

use Data::Dumper;

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

    my $board = $board_4x4_b;
    for my $x ( 0 .. $#{$board} ) {
        for my $y ( 0 .. $#{ $board->[$x] } ) {
            say "x => $x , y => $y, value => " . $board->[$x][$y];
        }
    }
}

sub find_first_moves {
    my $letter = shift;

    my $board = $board_4x4_b;

    my $letter = 'a';

    my $current_x = 0;
    my $current_y = 0;

    my @matches;

    for my $x ( 0 .. $#{$board} ) {
        for my $y ( 0 .. $#{ $board->[$x] } ) {
            #say "x => $x , y => $y, value => " . $board->[$x][$y];
            if ( defined $board->[$x][$y] && $board->[$x][$y] eq $letter ) {
                push @matches, { x => $x, y => $y };
            }
        }
    }

    say Dumper \@matches;

    return \@matches;
}

# possible moves:
# x + 1, y + 0
# x - 1, y - 0
# y + 1, x + 0
# y - 1, y - 0
# 
# x + 1, y + 1
# x + 1, y - 1
# x - 1, y + 1
# x - 1, y - 1

# foreach possible move
# 1) check that the move points to a letter
# 2) check that the move points to the letter we want
# 3) if we already know that the word works, make sure that we take alternate
#    routes where needed (more than one way to get to destination word)
# 4) mark the current letter as unavailable
# 5) record the move
# 6) continue until condition not met or have full word


1;

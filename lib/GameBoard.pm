package GameBoard;

use v5.16;
use strict;
use warnings;

use Data::Dumper;

sub spit_board {
    my $class = shift;
    my $board = shift;

    for my $x ( 0 .. $#{$board} ) {
        for my $y ( 0 .. $#{ $board->[$x] } ) {
            say "x => $x , y => $y, value => " . $board->[$x][$y];
        }
    }
    return;
}

sub find_first_moves {
    my $class = shift;
    my $board = shift;
    my $letter = shift;

    my @matches;

    for my $x ( 0 .. $#{$board} ) {
        for my $y ( 0 .. $#{ $board->[$x] } ) {
            if ( defined $board->[$x][$y] && $board->[$x][$y] eq $letter ) {
                push @matches, { x => $x, y => $y };
            }
        }
    }

    return \@matches;
}

sub all_letters {
    my $class = shift;
    my $board = shift;

    my %all_letters;
    for my $x ( 0 .. $#{$board} ) {
        for my $y ( 0 .. $#{ $board->[$x] } ) {
            if ( defined $board->[$x][$y] ) {
                $all_letters{$board->[$x][$y]}++;
            }
        }
    }

    return \%all_letters;

}

sub possible_moves {
    my $class      = shift;
    my $board      = shift;
    my $coordinate = shift;

    my $x = $coordinate->{x};
    my $y = $coordinate->{y};

    my @moves;

    if ( $x > 0 ) {
        push @moves, { x => $x - 1, y => $y };
    }
    if ( $y > 0 ) {
        push @moves, { x => $x, y => $y - 1 };
    }
    if ( $x < $#{ $board } ) {
        push @moves, { x => $x + 1, y => $y };
    }
    if ( $y < $#{ $board->[$x] } ) {
        push @moves, { x => $x, y => $y + 1};
    }

    return \@moves;
}

1;

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




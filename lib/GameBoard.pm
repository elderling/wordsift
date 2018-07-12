package GameBoard;

use v5.16;
use strict;
use warnings;

use Carp;
use Data::Dumper;

# TODO: Add Some POD
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

# not all moves, moves for passed-in letter
sub find_first_moves {
    my $class  = shift;
    my $board  = shift;
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
                $all_letters{ $board->[$x][$y] }++;
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

    my $min_x = 0;
    my $max_x = $#{$board};
    my $min_y = 0;
    my $max_y = $#{ $board->[$x] };

    # x - 1, y - 0
    if ( $x > $min_x ) {
        my $move = { x => $x - 1, y => $y };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # y - 1, x - 0
    if ( $y > $min_y ) {
        my $move = { x => $x, y => $y - 1 };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # x + 1, y + 0
    if ( $x < $max_x ) {
        my $move = { x => $x + 1, y => $y };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # y + 1, x + 0
    if ( $y < $max_y ) {
        my $move = { x => $x, y => $y + 1 };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # x - 1, y - 1
    if ( $x > $min_x && $y > $min_y ) {
        my $move = { x => $x - 1, y => $y - 1 };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # x + 1, y + 1
    if ( $x < $max_x && $y < $max_y ) {
        my $move = { x => $x + 1, y => $y + 1 };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # x + 1, y - 1
    if ( $x < $max_x && $y > $min_y ) {
        my $move = { x => $x + 1, y => $y - 1 };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    # x - 1, y + 1
    if ( $x > $min_x && $y < $max_y ) {
        my $move = { x => $x - 1, y => $y + 1 };
        if ( $class->letter_at( $board, $move ) ) {
            push @moves, $move;
        }
    }

    return \@moves;
}

sub letter_at {
    my $class      = shift;
    my $board      = shift;
    my $coordinate = shift;

    my $x = $coordinate->{x};
    my $y = $coordinate->{y};

    return $board->[$x][$y];
}

sub valid_moves {
    my $class      = shift;
    my $board      = shift;
    my $coordinate = shift;
    my $letter     = shift;

    my $possible_moves = $class->possible_moves( $board, $coordinate );

    my @valid_moves;

    for my $move ( @{$possible_moves} ) {
        if ( $class->letter_at( $board, $move ) eq $letter ) {
            push @valid_moves, $move;
        }
    }

    return \@valid_moves;
}

sub get_paths {
    my $class        = shift;
    my $current_path = shift // [];
    my $valid_moves  = shift;

    my @return_paths;
    for my $move ( @{$valid_moves} ) {
        push @return_paths, [ @{$current_path}, $move ];

    }

    return \@return_paths;
}

1;

# possible moves:
# x + 1, y + 0
# x - 1, y - 0
# y + 1, x + 0
# y - 1, x - 0
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


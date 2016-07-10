#!/usr/bin/env perl;

use v5.16;
use Test2::Bundle::Extended;
use Test2::Bundle::More;
use Test2::Tools::Compare qw( item in_set hash array bag );
use aliased 'GameBoard';
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

sub board_4x4_b {
    my $board_4x4_b = [
        [qw( f l a g )],
        [qw( h s r a )],
        [qw( f i c t )],
        [qw( s k e n )],
    ];
    return $board_4x4_b;
}

#>>>

is_deeply(
    GameBoard->find_first_moves( board_4x4_b(), 'a' ),
    [ { x => 0, y => 2 }, { x => 1, y => 3 } ],
    "correct first moves for letter 'a'"
);

my $all_letters = GameBoard->all_letters( board_4x4_b() );

cmp_ok( scalar keys %{$all_letters}, 'eq', 13, 'got 13 unique letters' );

is_deeply(
    GameBoard->possible_moves( board_4x4_b(), { x => 1, y => 1 } ),
    bag {
        item hash { field x => 0; field y => 0; };
        item hash { field x => 0; field y => 1; };
        item hash { field x => 0; field y => 2; };
        item hash { field x => 1; field y => 0; };
        item hash { field x => 1; field y => 2; };
        item hash { field x => 2; field y => 0; };
        item hash { field x => 2; field y => 1; };
        item hash { field x => 2; field y => 2; };
        end();
    },
    'Got correct possible_moves(board_4x4_b(), { x => 1, y => 1 } )'
);

is_deeply(
    GameBoard->valid_moves( board_4x4_b(), { x => 2, y => 1 }, 'a' ),
    bag {
        item hash { field x => 3; field y => 0; };
        item hash { field x => 4; field y => 1; };
        end();
    },
    'got correct valid_moves( board_4x4_b(), { x => 2, y => 1 }, "a" )'
);

done_testing;

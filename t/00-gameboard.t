#!/usr/bin/env perl;

use Test2::Bundle::Extended;
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

#my $board_4x4_b = [
#    [qw( f l a g )],
#    [qw( h s r a )],
#    [qw( f i c t )],
#    [qw( s k e n )],
#];
my $board_4x4_b = [
    [qw( f l a g )],
    [qw( h s r a )],
    [qw( f i c t )],
    [qw( s k e n )],
];
#>>>

GameBoard->spit_board($board_4x4_b);

my $first_moves = GameBoard->find_first_moves($board_4x4_b,'a');
note Dumper $first_moves;

cmp_ok( scalar @{$first_moves}, 'eq', 2, 'number of first moves for "a"') ;

my $all_letters = GameBoard->all_letters($board_4x4_b);
note Dumper $all_letters;

cmp_ok( scalar keys %{$all_letters}, 'eq', 13, 'unique letters') ;

GameBoard->spit_board($board_3x3_a);
my $possible_moves = GameBoard->possible_moves($board_3x3_a, {x=>1, y=>1});
note Dumper $possible_moves;
cmp_ok( scalar @{$possible_moves}, 'eq', 8, 'number of possible moves') ;


done_testing;

#!/usr/bin/env perl

use strict;
use warnings;
use v5.16;

use aliased 'GameBoard';

GameBoard->spit_board;

GameBoard->find_first_moves('a');

GameBoard->all_letters();


exit;

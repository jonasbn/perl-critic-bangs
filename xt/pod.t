#!perl

use strict;
use warnings;
use Test::More;
use Perl::Critic::TestUtils qw{ starting_points_including_examples };

if ( not eval 'use Test::Pod 1.00; 1;' ) {  ## no critic (ProhibitStringyEval)
    plan skip_all => 'Test::Pod 1.00 required for testing POD';
}
all_pod_files_ok( all_pod_files( starting_points_including_examples() ) );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab :

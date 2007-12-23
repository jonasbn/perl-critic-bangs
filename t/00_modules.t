#!perl

##############################################################################
#      $URL: http://perlcritic.tigris.org/svn/perlcritic/trunk/Perl-Critic/t/00_modules.t $
#     $Date: 2007-12-20 10:00:02 -0600 (Thu, 20 Dec 2007) $
#   $Author: clonezone $
# $Revision: 2062 $
##############################################################################

use strict;
use warnings;
use PPI::Document;
use Test::More;
use Perl::Critic::TestUtils qw(bundled_policy_names);
use English qw(-no_match_vars);

#-----------------------------------------------------------------------------

# adapted from similar file in Perl::Critic distribution
# revision 2062
our $VERSION = '0.23';

#-----------------------------------------------------------------------------

Perl::Critic::TestUtils::block_perlcriticrc();

my @bundled_policy_names = bundled_policy_names();

plan tests => ( 14 * scalar @bundled_policy_names );

# pre-compute for version comparisons
my $version_string = __PACKAGE__->VERSION;

#-----------------------------------------------------------------------------
# Test module interface for each Policy subclass

{
    for my $mod ( @bundled_policy_names ) {

        use_ok($mod);
        can_ok($mod, 'applies_to');
        can_ok($mod, 'default_severity');
        can_ok($mod, 'default_themes');
        can_ok($mod, 'get_severity');
        can_ok($mod, 'get_themes');
        can_ok($mod, 'new');
        can_ok($mod, 'set_severity');
        can_ok($mod, 'set_themes');
        can_ok($mod, 'set_themes');
        can_ok($mod, 'violates');
        can_ok($mod, 'violation');

        my $policy = $mod->new();
        isa_ok($policy, 'Perl::Critic::Policy');
        is($policy->VERSION(), $version_string, "Version of $mod");
    }
}

#-----------------------------------------------------------------------------

# ensure we run true if this test is loaded by
# t/00_modules.t_without_optional_dependencies.t
1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 78
#   indent-tabs-mode: nil
#   c-indentation-style: bsd
# End:
# ex: set ts=8 sts=4 sw=4 tw=78 ft=perl expandtab :

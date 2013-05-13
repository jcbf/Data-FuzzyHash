use strict;
use warnings;
use 5.008008;
use Module::Build::Pluggable (
    'CPANfile',
    'GithubMeta',
    'XSUtil'   => { 'ppport' => './lib/Data/ppport.h', },
    'CheckLib' => { 'lib'    => 'fuzzy', },
);

my $builder = Module::Build::Pluggable->new(
    module_name        => 'Data::FuzzyHash',
    license            => 'perl',
    dist_author        => 'Hideaki Ohno <hide.o.j55 {at} gmail.com>',
    c_source           => 'xs',
    xs_files           => { './xs/FuzzyHash.xs' => 'lib/Data/FuzzyHash.xs', },
    extra_linker_flags => ['-lfuzzy'],
    add_to_cleanup     => [ 'Data-FuzzyHash-*'],
    no_index           => { 'directory' => [ 't', 'xt', 'inc', 'eg' ] },
    test_files => ( -d '.git' || $ENV{RELEASE_TESTING} ) ? [qw(t/ xt/)] : ['t/'],
    create_readme  => 1,
    create_license => 1,
    meta_add       => {
        keywords  => [qw//],
        resources => { bugtracker => 'https://github.com/hideo55/Data-FuzzyHash/issues', },
    },
);

$builder->create_build_script();

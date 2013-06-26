package builder::MyBuilder;
use strict;
use warnings;
use 5.008008;
use base 'Module::Build::XSUtil';
use Config ();

sub new {
    my ( $self, %args ) = @_;
    $self->SUPER::new(
        %args,
        needs_compiler       => 1,
        xs_files             => { './xs/FuzzyHash.xs' => 'lib/Data/FuzzyHash.xs', },
        add_to_cleanup       => [qw(lib/Data/*.c lib/Data/*.h lib/Data/*.xs lib/Data/*.o)],
        generate_ppport_h    => 'lib/Data/ppport.h',
        extra_linker_flags   => ['-lfuzzy'],
    );
}

1;
__END__

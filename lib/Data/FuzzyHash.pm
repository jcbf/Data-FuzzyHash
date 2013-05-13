package Data::FuzzyHash;
use strict;
use warnings;
use 5.008008;
use base 'Exporter';
use XSLoader;

BEGIN {
    our $VERSION = '0.01';
    XSLoader::load __PACKAGE__, $VERSION;
}

our @EXPORT_OK = qw(
    fuzzy_hash
    fuzzy_hash_file
    fuzzy_compare
);

1;
__END__

=pod

=encoding utf8

=head1 NAME

Data::FuzzyHash - Binding of libfuzzy

=head1 SYNOPSIS

  use strict;
  use warnings;
  use Data::FuzzyHash;

=head1 DESCRIPTION

=head1 METHODS

=head2 fuzzy_hash($str)

=head2 fuzzy_hash_file($filename)

=head2 fuzzy_compare($hash1, $hash2)

=head1 SEE ALSO

=head1 AUTHOR

Hideaki Ohno  E<lt>hide.o.j55 {at} gmail.comE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

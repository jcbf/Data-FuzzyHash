use strict;
use warnings;
use Test::More;
use Test::Fatal qw(lives_ok);
use Data::FuzzyHash qw(fuzzy_hash fuzzy_hash_file fuzzy_compare);

subtest 'same data' => sub {
    my $text1 = random_string(1000000);
    my $text2 = $text1;

    my $hash1 = fuzzy_hash($text1);
    my $hash2 = fuzzy_hash($text2);

    my $res = fuzzy_compare( $hash1, $hash2 );
    is $res, 100;
};

subtest 'similar data' => sub {
    my $text1 = random_string(1000000);
    my $text2 = 'prefix_' . $text1 . '_postfix';

    my $hash1 = fuzzy_hash($text1);
    my $hash2 = fuzzy_hash($text2);

    my $res = fuzzy_compare( $hash1, $hash2 );
    ok( $res > 90 );
};

subtest 'random data' => sub {
    my $text1 = random_string(1000000);
    my $text2 = random_string(1000000);

    my $hash1 = fuzzy_hash($text1);
    my $hash2 = fuzzy_hash($text2);

    my $res = fuzzy_compare( $hash1, $hash2 );
    ok( $res >= 0 );
};

subtest 'random data' => sub {
    my $res = fuzzy_compare( "foo", 'bar' );
    is $res, -1;
};

done_testing;

sub random_string {
    my $n   = shift;
    my $str = q{};
    for ( 1 .. $n ) {
        my $rand = rand(26);
        $str .= chr( ord('A') + $rand );
    }
    return $str;
}

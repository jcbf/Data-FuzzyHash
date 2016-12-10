print "1..2\n";


use Data::FuzzyHash qw/fuzzy_hash_file fuzzy_hash/;


print "not " unless fuzzy_hash_file("./LICENSE") eq "384:Qr2Msr0v0F6gB3KOrc9RlWWwdCnK7LD+MKO6qsC2H:Qr2yv+LoWpdCn4vPA";
print "ok 1\n";

local $/;  # slurp
open(FILE, "<./LICENSE ") || die;
eval 'binmode(FILE, ":bytes")' if $] >= 5.008;
my $tmp = <FILE>;
close(FILE);


print "not " unless fuzzy_hash($tmp) eq "384:Qr2Msr0v0F6gB3KOrc9RlWWwdCnK7LD+MKO6qsC2H:Qr2yv+LoWpdCn4vPA";
print "ok 2\n";

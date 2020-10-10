use strict;
use warnings;
use diagnostics;
open(DF, "df|");
my @mount_points = <DF>;
for my $i (1 .. $#mount_points) {
    my @directories = split ' ', $mount_points[$i];
    my $parent_directory = $directories[5];
    print "$i: $parent_directory\n"   
}
close(DF);
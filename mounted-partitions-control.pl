use strict;
use warnings;
use diagnostics;
open(DF, "df|");
my @mount_points = <DF>;
for my $i (1 .. $#mount_points) {
    my @mounted_point_splitted = split ' ', $mount_points[$i];
    my $mounted_point_path = $mounted_point_splitted[5];
    print "$i: $mounted_point_path\n"   
}
close(DF);
use strict;
use warnings;
use diagnostics;
open(DF, "df|");
my @mount_points = <DF>;
my @media_drives = ();
for my $i (1 .. $#mount_points) {
    my @mounted_point_splitted = split ' ', $mount_points[$i];
    my $mounted_point_path = $mounted_point_splitted[5];
    my @parsed_media_drives = grep(/media/, $mounted_point_path);
    if (scalar(@parsed_media_drives)) {
        push @media_drives, $parsed_media_drives[0];
    }
}
for my $i (0 .. $#media_drives) {
   print "$i: $media_drives[$i]\n"; 
}
close(DF);
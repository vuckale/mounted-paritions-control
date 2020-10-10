#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
open(DF, "df|");
my @mount_points = <DF>;
my @media_drives = ();
my @media_drives_filesystem = ();
for my $i (1 .. $#mount_points) {
    my @mounted_point_splitted = split ' ', $mount_points[$i];
    my $mounted_point_path = $mounted_point_splitted[5];
    my @parsed_media_drives = grep(/media/, $mounted_point_path);
    if (scalar(@parsed_media_drives)) {
        push @media_drives_filesystem, $mounted_point_splitted[0];
        push @media_drives, $parsed_media_drives[0];
    }
}
print "<ID>: <MOUNTED MEDIA>\n\n";
for my $i (0 .. $#media_drives) {
   my $shifted_index = $i + 1;
   printf "%s: $media_drives[$i]\n", $i+1;
   # print "$i: $media_drives_filesystem[$i]\n";
}
print "\nWhich drive do you want to unmount?
 Type <ID> and press ENTER key.\n";
my $done = 0;
while (!$done){
    my $id = <STDIN>;
    if ($id >= 1 && $id <= scalar(@media_drives)) {
        print "$media_drives[$id-1] unmounted\n";
        my $file_system = $media_drives_filesystem[$id-1];
        my $command = "udisksctl unmount -b " . $file_system .
         " && udisksctl power-off -b " . $file_system;
        system $command;
        $done = 1;
    } else {
        print "Entered <ID> does not belong to any
         mounted drive. Try again.\n"
    }
}
close(DF);
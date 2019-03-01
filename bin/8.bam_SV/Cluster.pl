#!/usr/bin/perl
use strict;
use warnings;
my ($file,$binSize,$minSupport)=@ARGV;
#for my $s (1 .. 22,"X","Y"){
my %hash;
my %hash2;
my %HASH;
open IN,"$file";
while(<IN>){
        chomp;
        my @t=split;
#       next unless $t[0] eq $s;
        my $p1=int($t[1]/$binSize)*$binSize;
        my $p2=int($t[3]/$binSize)*$binSize;
        $HASH{"$t[0]\t$p1\t$t[2]\t$p2\t$t[4]"}++;
}

open IN2,"$file";
while(<IN2>){
        chomp;
        my @t=split;
#       next unless $t[0] eq $s;
        my $p1=int($t[1]/$binSize)*$binSize;
        my $p2=int($t[3]/$binSize)*$binSize;
        if (exists $hash2{"$t[5]\t$t[6]"}){
                if($HASH{"$t[0]\t$p1\t$t[2]\t$p2\t$t[4]"}>$HASH{$hash2{"$t[5]\t$t[6]"}}){
                        $hash2{"$t[5]\t$t[6]"}="$t[0]\t$p1\t$t[2]\t$p2\t$t[4]";
                }
        }else{
                $hash2{"$t[5]\t$t[6]"}="$t[0]\t$p1\t$t[2]\t$p2\t$t[4]";
        }
}

my %HASH2;
for my $k (keys %hash2){
        $HASH2{$hash2{$k}}++;
}

for my $K (keys %HASH2){
        print $K,"\t",$HASH2{$K},"\n" if $HASH2{$K}>=$minSupport;
}
#}


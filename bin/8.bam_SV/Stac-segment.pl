#!/usr/bin/perl
use strict;
use warnings;
my ($file,$minReadCount,$minBroad,$maxSegmentCount)=@ARGV;
my %hash;
open IN,"$file";
while(<IN>){
        chomp;
        my @t=split;
        my $i=0;
        my @seq;
        while($i<=$#t){
                my @a=split /[\,\:]/,$t[$i];
                my @b=split /\-/,$t[$i+1];
                push(@seq,$t[$i+1]."-".scalar(@a)) if scalar(@a)>=$minReadCount and $b[2]-$b[1]>$minBroad;
                $i+=2;
        }
        print join("\t",@seq),"\n" if scalar(@seq)>1 and scalar(@seq)<=$maxSegmentCount;
}


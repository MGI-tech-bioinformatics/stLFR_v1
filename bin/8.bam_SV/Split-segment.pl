#!/usr/bin/perl
use strict;
use warnings;
my ($file,$gapDistance,$minReadCountBar)=@ARGV;
open IN,"$file";
while(<IN>){
        chomp;
        my @t=split /\:\s+/,$_;
        my @a=split /\,/,$t[1];
        next if scalar(@a)<$minReadCountBar;
        my @seq=split /[\_\s+]/,$a[0];
        $seq[0]=~s/chr//;
        my $start=$seq[1]+$seq[2];
        print "pois:";
        for my $i (1 .. $#a){
                chomp;
                my @tmp=split /[\_\s+]/,$a[$i];

                # filter for not autosomal
                next if @tmp > 3;

                $tmp[0]=~s/chr//;
                if($tmp[0] eq $seq[0]){
                        my $l= $tmp[1]-$seq[1];
                        next if $l<0;
                        if($l<$gapDistance){
                                print "$l,";
                        }else{
                                print "\t$seq[0]-$start-$seq[1]\t";
                                print "pois:";
                                $start=$tmp[1];
                        }
                }else{
                        print "\t$seq[0]-$start-$seq[1]\t";
                        $start=$tmp[1];
                        print "pois:";
                }
        @seq=@tmp;
        }
        print "\t$seq[0]-$start-$seq[1]";
        print "\n";
}


#!/usr/bin/perl
use warnings;
use strict;
my ($file,$minReadCount)=@ARGV;
open IN,"$file";
while(<IN>){
        chomp;
        my @t=split;
        my @seq;
                for my $s (@t){
                        my @a=split /\-/,$s;
                        push(@seq,[($a[0],$a[1],$a[2],$a[3],$s)]);
                }
        for my $i (0 .. $#seq-1){
                for my $j ($i+1 .. $#seq){
                        next unless $seq[$i]->[3]>=$minReadCount or $seq[$j]->[3]>=$minReadCount;
                        if($seq[$i]->[0] eq $seq[$j]->[0]){
                                print $seq[$i]->[0],"\t",$seq[$i]->[1],"\t",$seq[$j]->[0],"\t",$seq[$j]->[1],"\tINV1\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                                print $seq[$i]->[0],"\t",$seq[$i]->[2],"\t",$seq[$j]->[0],"\t",$seq[$j]->[1],"\tDEL\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                                print $seq[$i]->[0],"\t",$seq[$i]->[1],"\t",$seq[$j]->[0],"\t",$seq[$j]->[2],"\tINS\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                                print $seq[$i]->[0],"\t",$seq[$i]->[2],"\t",$seq[$j]->[0],"\t",$seq[$j]->[2],"\tINV2\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                        }else{
                                print $seq[$i]->[0],"\t",$seq[$i]->[1],"\t",$seq[$j]->[0],"\t",$seq[$j]->[1],"\tITX1\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                                print $seq[$i]->[0],"\t",$seq[$i]->[2],"\t",$seq[$j]->[0],"\t",$seq[$j]->[1],"\tITX2\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                                print $seq[$i]->[0],"\t",$seq[$i]->[1],"\t",$seq[$j]->[0],"\t",$seq[$j]->[2],"\tITX3\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                                print $seq[$i]->[0],"\t",$seq[$i]->[2],"\t",$seq[$j]->[0],"\t",$seq[$j]->[2],"\tITX4\t",$seq[$i]->[4],"\t",$seq[$j]->[4],"\n";
                        }
                }
        }
}



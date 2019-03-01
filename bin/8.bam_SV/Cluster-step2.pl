#!/usr/bin/perl
use strict;
use warnings;
my ($file,$binSize,$clusterBroad)=@ARGV;
my %hash;
open IN,"$file";
while(<IN>){
        chomp;
        my @t=split;
        $hash{"$t[0]\t$t[1]\t$t[2]\t$t[3]\t$t[4]"}=$t[5];
}

my $broadCount=int($clusterBroad/$binSize);
my @lc=(0-$broadCount .. $broadCount);
        for my $s (@lc){$s=$s*$binSize}
open IN2,"$file";
while(<IN2>){
        chomp;
        my @t=split;
my @L;
my @R;
for my $s (@lc){push(@L,$t[1]+$s)}
for my $s (@lc){push(@R,$t[3]+$s)}
my $rec;my $ct=0;
for my $i (@L){
        for my $j (@R){
                next if $i==$t[1] and $j==$t[3];
                if(exists $hash{"$t[0]\t$i\t$t[2]\t$j\t$t[4]"}){
                        if($hash{"$t[0]\t$i\t$t[2]\t$j\t$t[4]"}>$ct){
                                $rec="$t[0]\t$i\t$t[2]\t$j\t$t[4]";
                                $ct=$hash{"$t[0]\t$i\t$t[2]\t$j\t$t[4]"};
                        }
                }
        }
}
        if($ct >=$hash{"$t[0]\t$t[1]\t$t[2]\t$t[3]\t$t[4]"}){
                $hash{$rec}+=$hash{"$t[0]\t$t[1]\t$t[2]\t$t[3]\t$t[4]"};
                delete $hash{"$t[0]\t$t[1]\t$t[2]\t$t[3]\t$t[4]"};
        }
}

for my $k (keys %hash){
        print $k,"\t",$hash{$k},"\n";
}


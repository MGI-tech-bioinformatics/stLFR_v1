#!/usr/bin/perl
use strict;
use warnings;

die "Usage: perl $0 mapping_quality_filter id bam_file samtools\n" unless(@ARGV == 4);
my $mapping_q_filter = shift;
my $id = shift;
my $bam = shift;
my $samtools = shift;

my %barcodes = ();
open IN,"$samtools view $bam |";
while(my $l=<IN>){
    chomp($l);
    my @t=split /\t/, $l;

    # filter for autosomal, 20190228
    next if $t[2] =~ /\_/;

    if($t[1]+0 >= 1024 or $t[8]+0 <= 0) {
  	  next;
    }
    my $bar = (split /#/, $t[0])[1];
    if($bar eq "0_0_0") {
	    next;
    }
    my $chr = $t[2];
    my $pos = $t[3];
    my $leg = $t[8];
    if(exists $barcodes{$bar}) {
	push(@{$barcodes{$bar}}, $chr."_".$pos."_".$leg)
    } else {
	$barcodes{$bar} = [$chr."_".$pos."_".$leg]
    }
}
close IN;

my $leg = 0;
my $output_file = $id."list";
open OUT, ">$output_file" or die $!;
for my $bar (keys %barcodes) {
    $leg = @{$barcodes{$bar}};
    if($leg < 2) {
	next;
    } else {
	print OUT $bar, ": ";
	for my $pos (@{$barcodes{$bar}}) {
	    print OUT $pos, ",";
	}
	print OUT "\n";
    }
}
close OUT;

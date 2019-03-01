#!/usr/bin/perl
use strict;
use warnings;
use Cwd;
use FindBin qw($Bin);
use Getopt::Long;

=head1 NAME:

        Program:        LFR-SV.pl
        Version:        0.1
        Author:         (qianzhaoyang@genomics.cn)
        Modified Date:
                            2018-07-10
        Description:
                    LFR SV analyze pipeline


=head1 Usage:

        LFR-SV.pl   [options]

        Options:
                -i|--input                      <STR>    absolute path for sample file list, col[0]=name col[1]=absolute path (necessary)
                -o|--out                        <STR>    output directory (necessary)
                -g|--gap                        <INT>    distance of gaps for seperate segment, default 30000
                -m|--minreadbar                 <INT>    min read count of a barcode,default 10
                -s|--maxseg     	        <INT>    max number of segment in a barcode,default 10
                -r|--minreadseg                 <INT>    min read count of a segment,default 4
                -l|--seglen                     <INT>    min segment length(bp),default 8000
                -b|--bin                        <INT>    bin size for breakpoint,default 5000
                -p|--minbar                     <INT>    min number of support barcodes,default 5
                -c|--cluster            	<INT>    broad of areas around breakpoint for cluster(bp),default 20000

=head1 Example:

    LFR-SV.pl -i ~/a/b/c/sam.list -o result
    For 10ng library, recommond:
    LFR-SV.pl -i ~/a/b/c/sam.list -g 50000 -m 10 -s 10 -r 2 -l 8000 -b 10000 -p 3 -c 30000
=cut



my ($inputlist,$outdir,);
my ($gap_size,$min_read_bar,$max_seg,$min_read_seg,$seg_len,$bin_size,$min_bar,$cluster);
my $path = $Bin;

GetOptions(
        "i|input=s" => \$inputlist,
        "o|out=s" => \$outdir,
        "g|gap=i" => \$gap_size,
        "m|minreadbar=i" => \$min_read_bar,
        "s|maxseg=i" => \$max_seg,
        "r|minreadseg=i" => \$min_read_seg,
        "l|seglen=i" => \$seg_len,
        "b|bin=i" => \$bin_size,
        "p|minbar=i"  => \$min_bar,
        "c|cluster=i" => \$cluster,
);
$outdir="./" unless defined($outdir);
$gap_size="30000" unless defined($gap_size);
$min_read_bar=4 unless defined($min_read_bar);
$max_seg=10 unless defined($max_seg);
$min_read_seg=4 unless defined($min_read_seg);
$seg_len=8000 unless defined($seg_len);
$bin_size=5000 unless defined($bin_size);
$min_bar=5 unless defined($min_bar);
$cluster=20000 unless defined($cluster);

my $name=(split /\//,$inputlist)[-1];
$name =~ s/\.list$//;
system("perl $path/Split-segment.pl $inputlist $gap_size $min_read_bar >$outdir/$name.segment");
system("perl $path/Stac-segment.pl $outdir/$name.segment $min_read_seg $seg_len $max_seg >$outdir/$name.segment.stac");
system("perl $path/Breakpoint-layout.pl $outdir/$name.segment.stac $min_read_seg >$outdir/$name.segment.layout");
system("perl $path/Cluster.pl $outdir/$name.segment.layout $bin_size $min_bar >$outdir/$name.segment.cluster");
system("perl $path/Cluster-step2.pl $outdir/$name.segment.cluster $bin_size $cluster >$outdir/$name.segment.SV");



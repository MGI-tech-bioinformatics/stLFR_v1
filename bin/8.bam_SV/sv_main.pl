#!/usr/bin/perl
use strict;
use warnings;
use FindBin qw($Bin);
use Cwd qw(abs_path);
use File::Basename;
use Getopt::Long;
use Pod::Usage;
use lib "$Bin/../../lib/perl5";
use MyModule::GlobalVar qw($REF_H_DBPATH $TOOL_PATH);

my ($list, $result, $shell, $cpu, %flag, $watchDog, 
  $bamdir, $maq, $p_sv,
  $samtools, 
  $threads, 
);
GetOptions(
  "i=s"   => \$list,
  "o=s"   => \$result,
  "s=s"   => \$shell,
  "fb=s"  => \$bamdir,
  "cpu=i" => \$cpu,
  "maq=i" => \$maq,
);
die "perl $0 -i input -o result -s shell -fb bamdir\n" unless defined $list && defined $result && defined $shell && defined $bamdir;

$watchDog     = "$Bin/../watchDog_v1.0.pl";
$samtools     = "$TOOL_PATH/samtools-1.3/bin/samtools";
$cpu        ||= 70;
$maq        ||= 20;
$threads    ||= 8;
$p_sv       ||= " -g 50000 -m 10 -s 10 -r 2 -l 8000 -b 10000 -p 3 -c 30000 ";

#=============================================#
# build shell
#=============================================#
open S1,">$shell/run8.bam_SV.1.sh";

open LIST,$list;
while(<LIST>){
  chomp;
  next if /^#/;
  next if /^sample.*path/;
  my @info = split /\s+/;

  $flag{$info[0]}++;
  next if $flag{$info[0]} > 1;  # pass if duplicated samples

  `mkdir -p $result/$info[0]`;
  print S1 "perl $Bin/get_reads_inf2.pl $maq $result/$info[0]/$info[0]. $bamdir/$info[0]/$info[0].sort.rmdup.bam $samtools\n";
  print S1 "perl $Bin/LFR-SV.pl -i $result/$info[0]/$info[0].list $p_sv -o $result/$info[0]\n";
  print S1 "cp $Bin/SV_header $result/$info[0]/$info[0].SV.result.xls\n";
  print S1 "sort -k 1,1 -k 2,2n $result/$info[0]/$info[0].segment.SV >> $result/$info[0]/$info[0].SV.result.xls\n";
  print S1 "rm $result/$info[0]/$info[0].list $result/$info[0]/$info[0].segment*\n";

}
close LIST;

close S1;
#=============================================#
# write main shell script
#=============================================#
open MAINSHELL,">>$shell/pipeline.sh";
print MAINSHELL "echo ========== 8.bam SV start at : `date` ==========\n";
print MAINSHELL "perl $watchDog --mem 60g --num_paral $cpu --num_line 5 $shell/run8.bam_SV.1.sh\n";
print MAINSHELL "echo ========== 8.bam SV   end at : `date` ==========\n\n";
close MAINSHELL;


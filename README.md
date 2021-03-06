stLFR_version1
==============

Introduction
-------
Tools of stLFR(Single Tube Long Fragment Reads) data analysis

stLFR FAQs is directed to bgi-MGITech_Bioinfor@genomics.cn.

Download source code package from https://github.com/MGI-tech-bioinformatics/stLFR_v1


Download/Install
----------------
Due to the size limitation of GitHub repository, followed softwares need to be installed to the specific directory (stLFR_v1/tools):

1. HapCUT2-master; 2. R-3.2.3; 3. bam2depth; 4. cnv; 5. gatk-4.0.3.0;

6. jre1.8.0_101; 7. python3; 8. vcftools; 9. Python-2.7.14; 10. SOAPnuke-1.5.6; 

11. bwa; 12. fqcheck; 13. gnuplot-5.2.2; 14. picard; 15.samtools-1.3.

Furthermore, you need to download the following database to the specific directory:

1. hg19.fa (stLFR_v1/db/hg19);

2. hg19.dbsnp.vcf (stLFR_v1/db/dbsnp).

Or you can download the above database and softwares from BGI Cloud Drive:

1. tools Link: https://pan.genomics.cn/ucdisk/s/2iU3ya
2. database Link: https://pan.genomics.cn/ucdisk/s/RZFRFz

Usage
-------
1. Make sure 'path' file on a right format, you can refer to 'path' file in the example.

2. Run the automatical delivery script.

        sh work.sh

Result
-------
After all analysis processes ending, you will get these files below:

1. Raw data and alignment summary: Alignment.statistics.xls 
2. Variant summary: Variant.statistics.xls 
3. GCbias figure: GCbias.pdf 
4. Insertsize figure: Insertsize.pdf 
5. Depth distribution figure: Sequencing.depthSequencing.depth.pdf 
6. Depth accumulation figure: Sequencing.depth.accumulation.pdf          
7. GCbias metrics: *.gcbias_metrics.txt，*.gcbias_summary_metrics.txt
8. Insertsize metrics: *.insertsize_metrics.txt
9. Phasingcount.*.hapcut2.xls (compare with GIAB vcf)
10. Phasingcount.*.hapcut2_SNP+InDel.xls (compare with own vcf)



License
-------
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions： 
  
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

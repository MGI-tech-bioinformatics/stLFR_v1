stLFR_version1
==============
Introduction
-------
Tools for analyzing stLFR(Single Tube Long Fragment Reads) data

stLFR questions may be directed to bgi-MGITech_Bioinfor@genomics.cn.

See https://github.com/MGI-tech-bioinformatics/stLFR_v1 to download source code package.

See stLFR cookbook for detailed usage of these tools.

Download/Install
----------------
Because of the size limitation of GitHub repository, these are some following softwares you need to install to the specified directory (stLFR_v1/tools):

1. HapCUT2-master; 2. R-3.2.3; 3. bam2depth; 4. cnv; 5. gatk-4.0.3.0;

6. jre1.8.0_101; 7. python3; 8. vcftools; 9. Python-2.7.14; 10. SOAPnuke-1.5.6; 

11. bwa; 12. fqcheck; 13. gnuplot-5.2.2; 14. picard; 15.samtools-1.3.

Furthermore, you need to download the following database to the specified directory:

1. hg19.fa (stLFR_v1/db/hg19);

2. hg19.dbsnp.vcf (stLFR_v1/db/dbsnp).

Or you also can download the above database and softwares from BGI Cloud Drive:


Usage
-------
    sh work.sh

License
-------
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions： 
  
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

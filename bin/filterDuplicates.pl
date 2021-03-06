#!/usr/bin/perl -w
#
#  Remove consecutive SNP ids that are the same.
#
use strict;
use warnings;

die("Usage: $0 plinkin plinkout\n") if ($#ARGV != 1);
my ($psFile1, $psFile2) = @ARGV[0..1];

#
#  Identify duplicates with the same chromosome and position between consecutive lines.
#
open H, "$psFile1.bim" or die();
open I, ">$psFile1.duplicate.snps" or die();
my @laLast = (0,0,0,0);
while (<H>) {
  chomp;
  my @laLine = split "\t";
  if ($laLine[0] eq $laLast[0] && $laLine[3] eq $laLast[3]) {
    print I "$laLast[1]\n";
    print I "$laLine[1]\n";
  } else {
    @laLast = @laLine;
  }
}
close H;
close I;

#
#  Check for more dups.
#
`../bin/plink --noweb --bfile $psFile1 --recode --out a --extract $psFile1.duplicate.snps`;
`cut -d' ' -f7- a.ped > a.tmp`;
open H, "a.tmp" or die();
while (<H>) {
  my $lsLine1 = $_;
  my $lsLine2 = $_;
  if ($lsLine1 ne $lsLine2) {
    print "1\n";
#  } else {
#    print "2\n";
  }
}
close H;
#`rm -f a.tmp a.ped a.fam a.map a.log`;

#
#  Check for more dups.
#
open H, "$psFile1.bim" or die();
open I, ">$psFile1.duplicate.snps" or die();
@laLast = (0,0,0,0);
while (<H>) {
  chomp;
  my @laLine = split "\t";
  if ($laLine[0] eq $laLast[0] && $laLine[3] eq $laLast[3]) {
    print I "$laLine[1]\n";
  }
  @laLast = @laLine;
}
close H;
close I;

#
#  ---------------------------
#  Perform the PLINK exclusion
#  ---------------------------
#
`../bin/plink --noweb --bfile $psFile1 --exclude $psFile1.duplicate.snps --make-bed --out $psFile2`;

#
#  Use the snps.exm2rs file to recode the BIM. First make hash.
#
my %lhE2R;
open H, "snps.exm2rs" or die();
while (<H>) {
  chomp;
  my @laLine = split "\t";
  if ($#laLine == 1) {
    $lhE2R{$laLine[0]} = $laLine[1];
  }
}
close H;

#
#  Encode the BIM usefully and consistently.
#
open H, "$psFile2.bim" or die();
open J, ">a.bim" or die();
@laLast = (0,0,0,0);
while (<H>) {
  chomp;
  my @laLine = split "\t";
  if ($laLine[0] eq $laLast[0] && $laLine[3] eq $laLast[3]) {
    print I "$laLine[1]\n";
  } else {
    if (exists($lhE2R{$laLine[1]})) {
      $laLine[1] = $lhE2R{$laLine[1]};
    } else {
      $laLine[1] = sprintf("Chr%02d:%010d",$laLine[0],$laLine[3]);
    }
    print J join("\t",@laLine) . "\n";
  }
  @laLast = @laLine;
}
close H;
close I;

#
#  Update the BIM.
#
`mv a.bim $psFile2.bim`;


#!/usr/bin/perl
#
# pcat -- parallel cat
#
# takes stdin and pipes it in parallel to multiple procs
#

use strict;
use warnings;
use File::Temp;
use Getopt::Std;
use File::Basename;

# usage vars
my $prog      = basename($0);
my $def_procs = 4;

# usage
my %opt;
getopts('hp:', \%opt);
die <<EOF if $opt{h} || !@ARGV;
usage: $prog [-p num-procs] cmd [cmd-arguments]
       cmd: stdin line-level parallelism: cmd and any arguments given at the 
            end of the command line are invoked in parallel, passed some 
            subset of standard input lines.  Any strings matching /%\\d*d/
            will have the process number substituted.
       -p: specify number of parallel processes (default: $def_procs)
EOF

# set options
$opt{p} ||= $def_procs;

my @cmd = @ARGV;

# start up parallel procs
# TODO: only start up on demand?
my $win = '';
my %procs = map { 
  my $n = $_;
  my @pcmd = @cmd;
  my $num = sprintf('%02d', $n);
  s/%%/$num/g for @pcmd;
  open(my $fh, '|-', @pcmd);  
  my $no = fileno($fh);
  vec($win, $no, 1) = 1;
  fileno($fh) => $fh
} 1..$opt{p};

# loop over STDIN, passing each line to next available child
LINE: while (1) {
  my $wout;
  my $n = select(undef, $wout=$win, undef, undef);
  die "$prog: select() failed with no writeable handles found\n" unless $n;
  for my $no (keys(%procs)) {
    if (vec($wout, $no, 1)) {
      my $line = <STDIN>;
      last LINE unless defined $line;
      syswrite($procs{$no}, $line);
    }
  }
}

# close filehandles to children, ending processes
close($_) for values %procs;

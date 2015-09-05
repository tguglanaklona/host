#/usr/bin/perl

use strict;
use warnings;

my $filed = './res/Data.txt'; my $fd;
open($fd, '<:encoding(UTF-8)', $filed)
  or die "Could not open file '$filed' $!"; #local $/;
my @replacelist;
push @replacelist, (split /\|/,$_)[1] for(<$fd>);

#foreach(<$fd>){
#
#    print substr($_,index($_,"|"));
#    push @replacelist, substr($_,index($_,"|"));
#}

close $fd;

for(@replacelist){
print $_;
}






#/usr/bin/perl

use strict;
use warnings;

my @inputlist = glob "../list/list_cities_*.txt"; my @flist;
for(@inputlist){
    $_ = substr($_,20,index($_,".txt")-20);
    push @flist, $_ if ($_ !~ /^?_replace$/);
}

my $filed = './res/Data.txt'; my $fd;
open($fd, '<:encoding(UTF-8)', $filed)
  or die "Could not open file '$filed' $!";
my @replacelist;
push @replacelist, (split /\|/,$_)[1] for(<$fd>);
chomp $_ for(@replacelist);
close $fd;

## HTML - <h2>Data by country:</h2>

my $filename = './res/Data_by_country.txt'; my $fh;
open($fh, '>:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
my $formattedstring = "    "; my $c = 0;
for(@flist){

	#my $v = ucfirst($_);
	my $v = $replacelist[$c];
	$formattedstring .= "<a href = \"/list/index_$_.php\">$v: Full list of populated places in $v</a>
    ";
    $c++;
}

#print $formattedstring;
print $fh $formattedstring;

close $fh;

## HTML - <h2>Download all databases:</h2>

$filename = './res/Download_all_databases.txt';
open($fh, '>:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

$formattedstring = "  "; $c = 0;
for(@flist){

	#my $v = ucfirst($_);
    my $v = $replacelist[$c];
	$formattedstring .= "<p>
  	<a href=\"/list/list_cities_$_.txt\" name=\"$_-towns-txt\">$v: lst_cities_$_.txt</a>
  </p>
  ";
    $c++;
}

#print $formattedstring;
print $fh $formattedstring;

close $fh;

## HTML - php

my $inputfilename = '../list/index_afghanistan.php';
my @content; my $fout;

$c = 0;
for(@flist){

    #my $v = ucfirst($_);
    my $v = $replacelist[$c];

    $filename = "./res/index_$_.php";
    open($fout, '>:encoding(UTF-8)', $filename)
        or die "Could not open file '$filename' $!";

    open($fh, '<:encoding(UTF-8)', $inputfilename)
      or die "Could not open file '$inputfilename' $!";
    local $/;
	my $text = <$fh>;
	$text =~ s/list_cities_afghanistan/list_cities_$_/g;
    $text =~ s/Afghanistan/$v/g;
    print $fout $text;

    close $fout;
    $c++;
}

close $fh;








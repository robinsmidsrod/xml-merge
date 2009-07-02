#!/usr/bin/perl

use strict;
use warnings;
use XML::LibXML;

my $parser = XML::LibXML->new();
my $xml1 = $parser->parse_string( <<'EOM' );
<r1>
   <searchpath>
     <dir>/usr/bin</dir>
     <dir>/usr/local/bin</dir>
     <dir>/usr/X11/bin</dir>
   </searchpath>
 </r1>
EOM

my $xml2 = $parser->parse_string( <<'EOM' );
<r2>
  <user login="grep" fullname="Gary R Epstein" />
  <user login="stty" fullname="Simon T Tyson" />
</r2>
EOM

my $new_xml = XML::LibXML::Element->new( 'XML' );
$new_xml->appendWellBalancedChunk( $xml1->documentElement()->toString() );
$new_xml->appendWellBalancedChunk( $xml2->documentElement()->toString() );
print $new_xml->toString(1);

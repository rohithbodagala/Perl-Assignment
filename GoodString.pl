#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- GoodString.pl
#   Date created :- 23-05-2021
#   Description :- The script converts any string to GoodString,deletes if there are
#                 consecutive letters in a string.
#########################################################################################


use strict;
 my $T =<STDIN>;#No.of Test cases
for (my $i =0; $i < $T ; $i++)
{
  my $str = <STDIN>;
  chomp $str;
  my @array = split //,$str;
  my $len = @array;
  for (my $j=0; $j < $len; $j++)#Deleting consecutive characters in the string 
  {
    if ( $array[$j] eq $array[$j+1] ) 
    {
      delete $array[$j];
    }
  }
  print(@array);
  print "\n";


}
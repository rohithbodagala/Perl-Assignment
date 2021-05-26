#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- GoodString.pl
#   Date created :- 23-05-2021
#   Description :- The script converts any string to GoodString,deletes if there are
#                 consecutive letters in a string.
#########################################################################################


use strict;
use Scalar::Util qw(looks_like_number);
 print("Enter no.of test cases :\n");
 my $T =<STDIN>;#No.of Test cases
 looks_like_number($T) or die "No.of test cases should be a number!\nInvalid Input..Try again later...\n";
for (my $i =0; $i < $T ; $i++)
{
  print("Enter a string :\n");
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
  print("The string without same consecutives characters : ",@array);
  #print(@array);
  print "\n";


}
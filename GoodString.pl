#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- GoodString.pl
#   Date created :- 23-05-2021
#   Description :- The script converts any string to GoodString,deletes if there are
#                 consecutive letters in a string.
#########################################################################################


use strict;
use Scalar::Util qw(looks_like_number);
sub isValidTestCase{
  my $T=$_[0];
  if($T eq ''){#Check for input string
      warn "Input string can't be empty!\nTry again...\n";
      return 0;
  }
  elsif(!looks_like_number($T)){#Check if string is a number
    warn "No.of test cases should be a number!\nTry again...\n";
    return 0;
  }
  elsif($T<=0 or $T>10){#Checking if test cases are between 1 and 10
    warn "No.of Test cases should be between 1 and 10 !\nTry again...\n";
    return 0;
 }
 return 1;
}
sub isValidString{

  my $str=$_[0];
  my $flag=0;
  my $len=length($str);
  if($len<=0){#Check for empty string
    warn "The string can't be empty!\n";
    $flag=1;
  } 
  if($len>30){#Check if length of string exceeds 30
    warn "The string should not exceed 30 characters!\n";
    $flag=1;
  }
  if($str=~/[A-Z]/){#Checking for uppercase letters
      warn "The string should not contain any Uppercase letters!\n";
      $flag=1;
    }
  if($str=~/[0-9]/){#Checking for numbers
    warn "The string should not contain any Numbers!\n";
    $flag=1;
  }
  if($str=~/[^a-zA-Z0-9_]/){#Checking for special characters
    warn "The string should not contain any special characters!\n";
    $flag=1;
  }
  if($flag==1){
    warn "The string should only contain Lower case letters\nTry again...\n";
    return 0;
  }
  return 1;
}
Testcases:
print("Enter no.of test cases : ");
my $T =<STDIN>;#No.of Test cases
chomp($T);
isValidTestCase($T) or goto Testcases;

for (my $i =0; $i < $T ; $i++)
{
  String:
  print("Enter a string : ");
  my $str = <STDIN>;
  chomp $str;
  isValidString($str) or goto String;
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
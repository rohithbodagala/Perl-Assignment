#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- GoodString.pl
#   Date created :- 25-05-2021
#   Description :- The script determines the no.of dashes a string is made up of.
#########################################################################################
#!/usr/bin/perl
use Scalar::Util qw(looks_like_number);
#Array to strore no.of dashes for each digit
@Dash_digits=(6,2,5,5,4,5,6,3,7,6);
#Taking user input
print("Enter a number to find no.of dashes it is made of :\n");
my $str = <STDIN>;
looks_like_number($str) or die "Input should be a number!\nInvalid Input..Try again later...\n";
$str_len=length($str)-1;
my @chars = split("", $str);
for($i=0;$i<$str_len;$i++)#Calculating no.of dashes in the string
{
    $count=$count+$Dash_digits[$chars[$i]];
}
print("The no.of dashes the string is made of : ",$count);
#print $count;
print "\n";

#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- GoodString.pl
#   Date created :- 25-05-2021
#   Description :- The script determines the no.of dashes a string is made up of.
#########################################################################################

#Array to strore no.of dashes for each digit
@Dash_digits=(6,2,5,5,4,5,6,3,7,6);
#Taking user input
my $str = <STDIN>; 
$str_len=length($str)-1;
my @chars = split("", $str);
for($i=0;$i<$str_len;$i++)#Calculating no.of dashes in the string
{
    $count=$count+$Dash_digits[$chars[$i]];
}
print $count;

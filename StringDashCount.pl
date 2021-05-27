#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- GoodString.pl
#   Date created :- 25-05-2021
#   Description :- The script determines the no.of dashes a string is made up of.
#########################################################################################
#!/usr/bin/perl
use Scalar::Util qw(looks_like_number);

sub isValidInput{
    my $str=$_[0];
    my $flag=0;
    my $len=length($str);
    if($len<=0){
        warn "Input string can't be empty!\n";
        $flag=1;
    } 
    if($len>100){
        warn "Input string should not exceed 100 characters!\n";
        $flag=1;
    }
    if(!looks_like_number($str)){
        warn "Input string should be a number!\n";
        $flag=1;
    }
    if($flag==1){
    warn "Try again...\n";
    return 0;
    }
  return 1;
}
#Array to strore no.of dashes for each digit
@Dash_digits=(6,2,5,5,4,5,6,3,7,6);
#Taking user input
Input:
print("Enter a number to find no.of dashes it is made of : ");
my $str = <STDIN>;
chomp $str;
isValidInput($str) or goto Input;
$str_len=length($str);
my @chars = split("", $str);
for($i=0;$i<$str_len;$i++)#Calculating no.of dashes in the string
{
    $count=$count+$Dash_digits[$chars[$i]];
}
print("The no.of dashes the string is made of : ",$count);
#print $count;
print "\n";

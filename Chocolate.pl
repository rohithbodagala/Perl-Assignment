#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- Chocolate.pl
#   Date created :- 24-05-2021
#   Description :- The script determines whether you can visit each room and find K 
#                   different brands of chocolates. 
#########################################################################################

use Scalar::Util qw(looks_like_number);
print("Enter no.of test cases :\n");
my $T =<STDIN>;#No.of Test cases
looks_like_number($T) or die "No.of test cases should be a number!\nInvalid Input..Try again later...\n";
for (my $i=0 ; $i< $T; $i++)
{
    print("Enter no.of rooms and no.of brands in space seperated integers : \n");
    my $input = <STDIN>;
    my @ch = split(' ',$input);
    my $room = $ch[0];#No.of Rooms
    looks_like_number($room) or die "No.of Rooms should be a number!\nInvalid Input..Try again later...\n";
    my $choc = $ch[1];#No.of Chocolates of different brand to find
    looks_like_number($choc) or die "No.of brands should be a number!\nInvalid Input..Try again later...\n";
    my @allchoc = ();
    print("Enter no.of chocolates and different brands in the room as space seperated input: \n");
    for (my $j =0; $j < $room; $j++)
    {
        print("For Room ",$j+1," :\n");
        my $datainroom = <STDIN>;#Chocolates in each room
        my @roomdata = split(' ',$datainroom);
        looks_like_number($roomdata[0]) or die "No.of chocolates should be a number!\nInvalid Input..Try again later...\n";
        shift (@roomdata);
        push(@allchoc, @roomdata);
    }
    #Finding total chocolate brands from all rooms
    %seen = ();
    @uniqu = grep { ! $seen{$_} ++ } @allchoc;
    if (scalar @uniqu >= $choc)
    {
        print "Yes,you can visit each room and find ",$choc," different brands of chocolates.\n";
    }
    else
    {
        print "No,you can't visit each room and find ",$choc," different brands of chocolates.\n";
    }
}
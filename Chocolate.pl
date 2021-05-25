#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- Chocolate.pl
#   Date created :- 24-05-2021
#   Description :- The script determines whether you can visit each room and find K 
#                   different brands of chocolates. 
#########################################################################################


my $T = <STDIN>;#No.of Test cases
for (my $i=0 ; $i< $T; $i++)
{
    my $input = <STDIN>;
    my @ch = split(' ',$input);
    my $room = $ch[0];#No.of Rooms
    my $choc = $ch[1];#No.of Chocolates of different brand to find
    my @allchoc = ();
    for (my $j =0; $j < $room; $j++)
    {
        my $datainroom = <STDIN>;#Chocolates in each room
        my @roomdata = split(' ',$datainroom);
        shift (@roomdata);
        push(@allchoc, @roomdata);
    }
    #Finding total chocolate brands from all rooms
    %seen = ();
    @uniqu = grep { ! $seen{$_} ++ } @allchoc;
    if (scalar @uniqu >= $choc)
    {
        print "Yes\n";
    }
    else
    {
        print "No\n";
    }
}
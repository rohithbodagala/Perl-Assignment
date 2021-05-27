#########################################################################################
#   Author:- Rohith Bodagala
#   Name of the file :- Chocolate.pl
#   Date created :- 24-05-2021
#   Description :- The script determines whether you can visit each room and find K 
#                   different brands of chocolates. 
#########################################################################################

use Scalar::Util qw(looks_like_number);

sub isValidTestCase{
  my $T=$_[0];
    if($T eq ''){
        warn "Input string can't be empty!\nTry again...\n";
        return 0;
    }
    elsif(!looks_like_number($T)){
        warn "No.of test cases should be a number!\nTry again...\n";
        return 0;
    }
    elsif($T<=0 or $T>5){
        warn "No.of Test cases should be between 1 and 5 !\nTry again...\n";
        return 0;
    }
    return 1;
}
sub isValidN{
    my $n=$_[0];
    my $flag=0;
    if($n eq ''){
      warn "No.of rooms can't be empty!\n";
      return 0;
    }
    elsif(!looks_like_number($n)){
        warn "No.of rooms should be a number!\n";
        return 0;
    }
    elsif($n<=0 or $n>10**2){
        warn "No.of rooms should be between 1 and 10^2 !\n";
        return 0;
    }
    return 1;
        
}
sub isValidK{
    my $k=$_[0];
    $flag=0;
    if($k eq ''){
      warn "No.of brands can't be empty!\n";
      return 0;
    }
    elsif(!looks_like_number($k)){
        warn "No.of brands should be a number!\n";
        return 0;
    }
    elsif($k<=0 or $k>10**3){
        warn "No.of brands should be between 1 and 10^3 !\n";
        return 0;
    }
    return 1;

}
sub isValidP{
    my $p=$_[0];
    $flag=0;
    if($p eq ''){
      warn "No.of brands can't be empty!\n";
      return 0;
    }
    elsif(!looks_like_number($p)){
        warn "No.of brands should be a number!\n";
        return 0;
    }
    elsif($p<=0 or $p>10**2){
        warn "No.of brands should be between 1 and 10^2 !\n";
        return 0;
    }
    return 1;
}
sub isValidRoomData{
    my @args=@_;
    my $p=$args[0];
    shift(@args);
    my @allchoc=@args;
    my $flag=0;
    if(looks_like_number($p) and scalar @allchoc!=$p){
        warn "Given Chocolate brands are not equal to no.of chocolate brands that should be in the room!\n";
        $flag=1;
    }
    for(@allchoc){
        if(length($_)>10 or length($_)<1){
            warn "Chocolate brands should have 1 to 10 characters !\n";
            $flag=1;
            last;
        }
    }
    if($flag==1){
        return 0;
    }
    return 1;
}
Testcases:
print("Enter no.of test cases : ");
my $T =<STDIN>;#No.of Test cases
chomp($T);
isValidTestCase($T) or goto Testcases;
for (my $i=0 ; $i< $T; $i++)
{
    Input:
    print("Enter no.of rooms and no.of brands in space seperated integers : \n");
    my $input = <STDIN>;
    chomp $input;
    my @ch = split(' ',$input);
    my $room = $ch[0];#No.of Rooms
    my $choc = $ch[1];#No.of Chocolates of different brand to find
    my $flag=0;
    isValidN($room) or $flag=1;
    isValidK($choc) or $flag=1;
    if($flag==1){
        warn "Try again..\n";
        goto Input;
    } 
    my @allchoc = ();
    print("Enter no.of chocolates and different brands in the room as space seperated input: \n");
    for (my $j =0; $j < $room; $j++)
    {
        RoomInput:
        print("For Room ",$j+1," :\n");
        my $datainroom = <STDIN>;#Chocolates in each room
        chomp $datainroom;
        my @roomdata = split(' ',$datainroom);
        my $flag=0;
        my $p=$roomdata[0];
        isValidP($p) or $flag=1;
        isValidRoomData(@roomdata) or $flag=1;
        shift (@roomdata);
        if($flag==1){
            warn "Try again..\n";
            goto RoomInput;
        }
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
$base_location='E:\workspace\learning_perl';
print "Copy Started\n";
print "$base_location";
$command=<STDIN>;
$number_of_commands_accepted=5;
while($number_of_commands_accepted)
{
    chomp $command;
    if($command eq "cd ..")
    {
        @path_array=split /\\/,$base_location;
        pop(@path_array);
        $temp_location=join("\\",@path_array);
        $base_location="$temp_location";
    }
    elsif($command eq "dir")
    {
       opendir $dir,$base_location;
       my @files=readdir $dir;
       closedir $dir;
       $number_of_files=@files;
       print "Total number of files: $number_of_files \n\n";
       
       foreach $file (@files)
       {
            print "$file \n";
       }
    }
    # elsif($command eq "cd ")
    # {
        # @path_array=split /\\/,$base_location;
        # push @path_array,$command;
        # $temp_location=join("\\",@path_array);
        # $base_location="$temp_location";
    # }
    else
    {
        print "Command not recognize \n";
    }
    print $base_location;
    $command=<STDIN>;
    $number_of_commands_accepted--;
}
print "Copy ended succesfuly"
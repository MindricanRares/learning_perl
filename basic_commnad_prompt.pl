open($f,'>D:/workspace/learning_perl/command_history.txt');
$base_location='D:\workspace\learning_perl';
print "Copy Started\n";
$number_of_commands_accepted=5;
while($number_of_commands_accepted>0)
{
	print "$base_location>";
	$command=<STDIN>;
	chomp $command;
	@words_in_commnad=split ' ',$command;
	$len=@words_in_commnad;
	if($len<2)
	{
		$command="$command _";
	}
	foreach $var (@words_in_commands)
	{
		print "$var\n";
	}
	if ($words_in_commnad[0] eq 'cd')
	{
		if($words_in_commnad[1] eq '..')
		{
			@path_array=split /\\/,$base_location;
			pop(@path_array);
			$temp_location=join("\\",@path_array);
			$base_location="$temp_location";	
		}
		else
		{
			@path_array=split /\\/,$base_location;
			push @path_array, $words_in_commnad[1];
			$temp_location=join("\\",@path_array);
			$base_location="$temp_location";	
		}
	}
	elsif($words_in_commnad[0] eq 'dir')
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
	elsif ($words_in_commnad[0] eq 'mkdir')
	{
		mkdir("$base_location\\$words_in_commnad[1]");
	}
	else
    {
        print "Command not recognize \n";
    }
	print $f "$words_in_commnad[0]:$words_in_commnad[1]\n";
    $number_of_commands_accepted--;
}
close $f;
print "Copy ended succesfuly"
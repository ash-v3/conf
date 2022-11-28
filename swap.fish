function swap
mv $argv[1] temp
mv $argv[2] $argv[1]
mv temp $argv[2]
end

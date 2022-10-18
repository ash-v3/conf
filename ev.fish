function ev
if test (count $argv) -gt 1
python -c "from math import *; $argv[1]; print($argv[2..])"
else
python -c "from math import *; print($argv)"
end
end

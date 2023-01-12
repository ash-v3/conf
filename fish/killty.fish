function killty
    kill $(procs $argv | choose 0 | rg '^[0-9]*$')
end

# Terminal
## Open Finder from terminal
```open .```

## fzf
Fuzzy Finder

## cp
- Copy with permissions ```cp -au ./data ./data.bk```

## rsync
- ```rsync -a theuser@host:/home/theuser/thefile.txt ./```

## scp
- ```scp theuser@host:/home/theuser/thefile.txt ./```

## watch
```
watch kubectl get pods -n kube-system
```

## regex
Extract the text in group (1)

    echo "kmaster180"|sed -r 's/([a-z]*)([0-9]*)/\1/g'

Extract the number group (2)
    
    echo "kmaster180"|sed -r 's/([a-z]*)([0-9]*)/\2/g'

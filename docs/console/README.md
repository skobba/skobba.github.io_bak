# Terminal

## rsync
> rsync -a theuser@host:/home/theuser/thefile.txt ./

## scp
> scp theuser@host:/home/theuser/thefile.txt ./

# jq
NB: Note the single quotes!
> echo '[{"username":"user1"},{"username":"user2"}]' | jq '. | length'

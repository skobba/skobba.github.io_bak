# alias
```
cat >>~/.zshrc<<EOF
alias kk="kubie ctx"
alias k="kubectl"

k-get-pods-on-node-func() {
    pods=$(kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=$1)

    echo "Pods running ($(echo $pods|awk 'END { print NR-1 }')) on node: $1"
    echo $pods
}
alias k-get-pods-on-node='k-get-pods-on-node-func'

k-ssh-func() {
    ssh -o StrictHostKeyChecking=accept-new "root@10.10.9.$1"
}
alias k-ssh='k-ssh-func'
EOF
```

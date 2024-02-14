# alias

## Get all pods on a node
```sh

k-get-pods-on-node-func() {
    pods=$(kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=$1)

    echo "Pods running ($(echo $pods|awk 'END { print NR-1 }')) on node: $1"
    echo $pods
}

# Assign the function to an alias
alias k-get-pods-on-node='k-get-pods-on-node-func'
```

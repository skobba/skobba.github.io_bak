# Ingress

## List of Ingress Providers
* [https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)

## Overview
An ingress controller is an Kubernetes resource that routes traffics from outside the cluster to whithin the cluster.

```
                   Internet
                      │
             ┌────────▼────────┐
             │  Load Balancer  │
             └────────┬────────┘
                      │
┌─────────────────────┼───────────────────┐
│ Kubernetes Cluster  │                   │
│            ┌────────▼────────┐          │
│            │    Ingress      │          │
│            │    Controller   │          │
│            └───────┬─────────┘          │
│            ┌───────▼─────────┐          │
│            │    Ingress      │          │
│            │    Rules        │          │
│            └──┬─────────┬────┘          │
│    ┌──────────▼───┐ ┌───▼────────┐      │
│    │ Node1        │ │ Node2      │      │
│    │              │ │            │      │
│    │ ClusterIP    │ │ ClusterIP  │      │
│    │   Pod1       │ │    Pod2    │      │
│    └──────────────┘ └────────────┘      │
└─────────────────────────────────────────┘
```

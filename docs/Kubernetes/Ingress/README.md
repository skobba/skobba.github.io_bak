# Ingress

## List of Ingress Providers
* [https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)

## Overview
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

# Ingress

## List of Ingress Providers
* [https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)

## Overview
An ingress controller is an Kubernetes resource that routes traffics from outside the cluster to whithin the cluster.

* Ingress traffic – Traffic entering a Kubernetes cluster
* Egress traffic – Traffic exiting a Kubernetes cluster
* North‑south traffic – Traffic entering and exiting a Kubernetes cluster (also called ingress‑egress traffic)
* East‑west traffic – Traffic moving among services within a Kubernetes cluster (also called service-to-service traffic)
* Service mesh – A traffic management tool for routing and securing service-to-service traffic

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

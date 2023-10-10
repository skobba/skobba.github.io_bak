# App Service

## App Service Plan
Ref.: [https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans](https://learn.microsoft.com/en-us/azure/app-service/overview-hosting-plans)


Isolate your app into a new App Service plan when:

1. The app is resource-intensive. The number may actually be lower depending on how resource intensive the hosted applications are, however as a general guidance, you may refer to the table below:

| App Service Plan SKU | Max Apps                          |
| -------------------- | --------------------------------- |
| B1, S1, P1v2, I1v1   | 8                                 |
| B2, S2, P2v2, I2v1   | 16                                |
| B3, S3, P3v2, I3v1   | 32                                |
| P0v3                 | 8                                 |
| P1v3, I1v2           | 16                                |
| P2v3, I2v2, P1mv3    | 32                                |
| P3v3, I3v2, P2mv3    | 64                                |
| I4v2, I5v2, I6v2     | Max density bounded by vCPU usage |
| P3mv3, P4mv3, P5mv3  | Max density bounded by vCPU usage |

2. You want to scale the app independently from the other apps in the existing plan.

3. The app needs resource in a different geographical region.

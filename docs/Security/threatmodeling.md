# Threat Modeling
Identification (internal, external) -> Likelyhood, Impact, Priorization -> Implement most feasibly effective threat mitigation

Hunt down threats:
* Who are the attackers?
* What do the attackers want?
* How will they attack?
* How can the attack be mitigated?

Modeling:
* Assets must be identified
* Functional requirements must be identified
* Bussiness objective must be identified
* Regulatory compliance
* All phases of the Software Development Life Cycle (SDLC) for developers
* Tools as OWASP Threat Dragon project (Threat Modeling Program)

## Network and Vulnerability Scanning
* Identify hosts and ports
* Identity weaknesses

### Network scan
* Passive
* Hosts
* Services (ports)
* Compare old scans to current scan to identify changes

### Vulnerability scan
* Passive
* Hosts
* Services (ports)
* Vulnerabilities database

### Vulnerability Detection
* Weak passwords
* Anonymously accessible items such as shared folders
* Lack of input validation for web form fields
* Default settings left enabled
* Missing updates
* Use deprecated security protocols such as SSL

## Cloud Application Security
### Firewall
* Whitelists and blacklists
* Demilitarized zone
* Proxies and NAT
* Egress filtering
* Intrusion Detection Systems / Intrusion Prevention Systems (DS/IPS)

### System Security
* Default configurations
* Credential safety
* Access control
* Staging/Test environment
* DDoS protection

### Changes and Notification
* Keep up-to-date
* API changes
* Licenses changes
* Security breaches
* Best practices
* Documentation

### Deployment
* Automation
* Integration tests
* Credential safety
* Access control








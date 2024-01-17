# Semantic version
Semver Calculator: [https://semver.npmjs.com](https://semver.npmjs.com)

Table w/ Backus-Naur form:

| Semver        | Versions      |
| ------------- |-------------|
| version      | Exact version |
|^version|"Approximately equivalent to version (minor)" ^1.2.3 := >=1.2.3 <2.0.0-0|
|~version|"Compatible with version (patch)" ~1.2.3 := >=1.2.3 <1.(2+1).0 := >=1.2.3 <1.3.0-0|

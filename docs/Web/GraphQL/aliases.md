# Aliases
``` 
query getCases {

  firstCase: case(caseId: 1040487) {
    CaseNumber
  }
  
  secondCase: case(caseId: 1001087) {
    CaseNumber
  }
  
  objections {
    CaseNumber
    ObjectionType
  }

}
```

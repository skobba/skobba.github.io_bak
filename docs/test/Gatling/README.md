# Gatling

Ref.: https://www.james-willett.com/gatling-vscode

Install:
* The Scala Metals plugin inside VS Code
* Install Maven
* Install Maven for Java plugin inside VS Code (vscjava.vscode-maven)
* Update VS Code and run: "Maven: Update Maven Archetype Catalog"

Run:
* Run in VS Code: "Maven: Create Maven Project"

To run the script, open a terminal within VS Code, and type mvn gatling:test . If you want to run a specific test script, you can do mvn gatling:test -Dgatling.simulationClass=computerdatabase.BasicSimulation instead.


Authentication:
* Ref.: https://devqa.io/gatling-oath2-authentication/

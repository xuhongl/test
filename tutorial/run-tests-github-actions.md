# Run a test using Github Actions

## **Steps**

1. Click on Actions.
2. Select APIM Load Test on the left pane.
3. Click on Run workflow button on the right.
4. The worflow needs some input parameters. 
5. Name of the test : it's the name of the test you want to run. You can find them in the tests/ directory of this repo (ex: 1-basic-http-test)
6. Short name of the apim service without http(s):// at the beginning and .azure-api.net at the end.
7. Number of Azure Load Testing instances. Each test is made of 100 vUsers. So you need to modulate the number of instances to reach a given capacity (ex: 1000 vUsers = 10 instances x 100 vUsers).

![Run Workflow](/assets/images/run-workflow.png)

8. Click on Run Workflow
9. Observe the workflow running in Github Actions

![Running Workflow](/assets/images/test-running-github.png)

10. You can also observe the test running on Azure Load Testing.
11. Results are uploaded as an artifact at the end.

![End TEst](/assets/images/results.png)

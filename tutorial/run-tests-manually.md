# Run the tests

## **Prerequisites**

1. An Azure subscription that has been allowlisted for the private preview. If you have not already done so, follow the [private preview onboarding instructions](https://github.com/microsoft/azureloadtest#prerequisites).
2. You need [Visual Studio Code](https://code.visualstudio.com/) installed, including the [Azure Load Test extension](https://github.com/microsoft/azureloadtest#installation).
3. You need [Jmeter](https://jmeter.apache.org/download_jmeter.cgi) installed.
4. Ensure to have the jmeter [Plugins Manager](https://jmeter-plugins.org/install/Install/) installed to run the Jmeter script on a fresh Jmeter install since the JMX utilises an Ultimate Thread group.

## **Modify and run a load test**
The repository contains a `tests` folder with contains sub-folders corresponding to different testing scenarios.
Each sub-folders contains two files :
* a `jmx` file which is a JMeter script describing actions to perform and load increase pattern for each test iteration.
* a `yaml` file which describes the Azure Load Testing service configuration for each test iteration.

**Make sure to update the JMeter script with the URL of the APIM endpoint deployed in the previous steps.**

1. Before starting, make sure you have the directory of the cloned repo open in Visual Studio Code.

2. Open the JMX script in a text editor, and update line 99 with the URL of your newly APIM endpoint. Save your changes and close the file.
```xml
<stringProp name="HTTPSampler.domain">APIMNAME.azure-api.net</stringProp>
```
3. Open the YAML file and use **Ctrl+Shift+P** to launch the command palette. Begin typing `Azure load test` and you would see 2 commands associated with the Azure Load Test extension:
    * **Create New Test**: This command is used to author a new cloud load test from an existing JMeter script.
    * **Run Current File as Load Test in Cloud**: This command is used to run an existing cloud load test at scale in Azure.
4. Select **Run Current File as Load Test in Cloud**. Sign in to Azure if prompted.
![Run Test](/assets/images/runtest.png)

5. Select the subscription from which you will run your load test. IMPORTANT: This needs to be the same subscription that has been allowlisted for the private preview.
![List Subscriptions](/assets/images/subslist.png)

6. Select **Create new Test Environment...** and follow the prompts to create a new Azure Load Testing resource.

7. Finally, select the resource group *of the APIM service we're testing* and press **OK**. This tells the load test service to monitor and display the application's server metrics in the test results.
![Application component](/assets/images/appcomp.png)

8. If everything is okay, the test will start with status messages as shown below. Click on the **View here** link to go to the Azure portal and see the metrics related to your load test. *Tip: Note that you can stop a load test at any time from the Azure Portal UI.*
![Run](/assets/images/run.png)

9. You can see the streaming client side metrics while the test is running which auto refreshes every 5s. you can stop the test using the **stop** button and also apply filters to the requests by sampler and errors. The response times can also be aggregated for different percentiles.
![Client metrics](/assets/images/clientmetrics.png)
10. You can see the server side metrics including APIM ones.
![Server metrics](/assets/images/servermetrics.png)
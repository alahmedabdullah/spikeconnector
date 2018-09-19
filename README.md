SPIKE Smart Connector for Chiminey
==================================
SPIKE allows formal model checking of a system modeled as petri net.  'SPIKE Smart Connector for Chiminey' allows payload parameter sweep over SPIKE petri net models. Chiminey facilitates scheduling computes over the cloud for parallel execution of these SPIKE models.

Once 'SPIKE Smart Connector' is activated in Chiminey, Chiminey portal then allows to configure and submit a SPIKE job for execution.

SPIKE Smart Connector(SC) install
-----------------------------------
The SPIKE SC installs SPIKE binary in each Cloud VM. During activation of SPIKE SC, the user is required to provide the Spike binay built for CentOS 7. 
please place the Spike binary(build for CentOS 7) in the 'package' directory of chiminey install. Please refer to installation steps described in https://github.com/alahmedabdullah/spikeconnector/blob/master/SETUP.md file.

The Input Directory
-------------------
A connector in Chiminey system specifes a 'Input Location' through 'Create Job' tab of the Chimney-Portal. Files located in the 'Input Location' directory is loaded to each VM for cloud execution. The content of 'Input Location' may vary for different runs. Chiminey allows parameteisation of the input envrionment. Any file with '_template' suffix located in the input directory is regarded as template file. Chiminey internally replaces values of the template tags based on the 'payload parameter sweep' provied as Json Dictionary from 'Create Job' tab in the Chiminey portal.

The input directory is provided with a default template file 'cli_parameters.txt_template' which is availabe in 'input_spike' directory of SPIKE SC install. All the template tags specified in  the cli_parameters.txt_template file will be internally replaced by Chiminey with corresponding values that are passed in from 'Chiminey Portal' as Json dictionary. The 'cli_parameters.txt_template' is  also renamed to 'cli_parameters.txt' with all template tags replaced with corresponding values.

For example let us assume following shell command is used to execute a SPIKE model using 'conf-sim' file:

```
$./spike-beta-linux64 exe -f conf-sim
``
the con-sim file contain various configuration parameters for the target SPIKE model which is located in the same directory. The con-sim file may be tempalted as conf-sim_template where value for ithe number of runs to be performed one SPIKE model can be passes in from the Chiminey-Portal

The valueis for 'Payload parameter sweep' field has to be a JSON dictionary passed in from Chiminey-Portal's 'Create Job' tab:

```
{ "cli_parameters" :  [ "exe -f conf-sim" ], "runs" :  [ 10, 20, 30 ] }

```
Note that the {{cli_parameters}} is the tag name defined in the 'cli_parameters.txt_template' and {{runs}} is the tag defined in 'conf-sim_template'. These template tags are replaced by appropiate value passed in through JSON dictionary.


Configure, Create and Execute a SPIKE Job
------------------------------------------
'Create Job' tab in 'Chiminey Portal' lists 'spike' form for creation and submission of spike job. The 'spike' form requires definition of 'Compute Resource Name' and 'Storage Location'. Appropiate 'Compute Resource' and 'Storage Resource' need to be defined  through 'Settings' tab in the 'Chiminey portal'.

Payload Parameter Sweep
-----------------------
Payload parameter sweep for 'SPIKE Smart Connector' in the Chiminey System may be performed by specifying appropiate JSON dictionary in 'Payload parameter sweep' field  of the 'spike' form. An example JSON dictionary to run parameter sweep for the 'test.andl' could be as following:

```
{ "cli_parameters" :  [ "exe -f conf-sim" ], "runs" :  [ 10, 20, 30 ] }

```
Note that the {{cli_parameters}} is the tag name defined in the 'cli_parameters.txt_template' and {{runs}} is the tag defined in 'conf-sim_template'. These template tags are replaced by appropiate value passed in through JSON dictionary.

Above would create three individual process. If maximum one cloud VMs  is allocated for the job - three SPIKE jobs will be executed in the same VM,  input fields in 'Cloud Compute Resource' for 'pike' form has to be:

```
Number of VM instances : 1
Minimum No. VMs : 1
```

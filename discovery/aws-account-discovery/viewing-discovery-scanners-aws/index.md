[title]: # (Viewing Discovery Scanners for the AWS Discovery Source)
[tags]: # (AWS, Account Discovery, scanner)
[priority]: # (1000)

# Viewing Discovery Scanners for the AWS Discovery Source

 To view these scanners:
$1
$2
   ![image-20200730121408367](images/image-20200730121408367.png)
$1
$2
   ![image-20200730105028646](images/image-20200730105028646.png)
$1
$2
   ![image-20200730132312502](images/image-20200730132312502.png)
$1
$2
   ![image-20200730121852926](images/image-20200730121852926.png)
$1
$2
   - **Platform Include Filter**: Comma separated list for platforms to include in the scan. Example: `windows`.
   - **Platform Exclude Filter**: Comma separated list for platform to exclude from the scan. Example: `windows`,
   - **Custom Additional Filters**: Additional filters to scan. Example: `tag:Purpose=store,database;`
   - **Instance Name Preference**: If found on the instance, this is used for the Computer Name. Consider how the machine will be accessed with the selection. If selection is not found, it defaults to PrivateDnsName.
$1
$2

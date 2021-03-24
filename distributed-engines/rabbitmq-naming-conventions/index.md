[title]: # (RabbitMQ Naming Conventions for Queues)
[tags]: # (RabbitMQ,queues)
[priority]: # (1000)

# RabbitMQ Naming Conventions for Queues

## Introduction

This document addresses RabbitMQ naming conventions for its queues. These queues are useful for application troubleshooting and proactive application monitoring.

Secret Server is an asynchronous message-based system where operational instructions and data are passed back and forth between various components running in Web nodes or distributed Engines. A GUI interaction to perform an action, such as heartbeat, remote password change, or bulk operations publishes a message and then returns control back to the user. RabbitMQ is the message bus or broker that facilitates the message traffic.

> **Note:** All SS messages are encrypted on the bus, so you cannot peek into the message contents during transit.

> **Note:** Messages have a lifetime, and consumers discard expired messages. Therefore, any accumulation or backup of messages in any queue is abnormal and indicative of an application problem.

## Secret Server Roles

Secret Server divides its functionality by named and unnamed roles, and only named roles are configurable in a Web node via the GUI.

**Table:** Secret Server Roles Related to Message Queues

| **Role**                 | **Type** | **Comment**                                                  |
| ------------------------ | -------- | ------------------------------------------------------------ |
| Background Worker        | Named    | Background work initiated by a task, schedule or UI  interaction. Final action of the work might be done in the current Web node, another Web node or sent to a  distributed Eengine to complete. |
| Engine                   | Unnamed  | Processes work related to but not limited to: Active Directory  synchronization, discovery, heartbeat, and remote password change. |
| Engine Worker            | Named    | Processes the response sent back from an engine.             |
| Session Recording Worker | Named    | Background work dedicated to session recording processing.   |
| UI                       | Unnamed  | IIS/ASP.NET processing, inbound access controlled by a load balancer. |
| API                      | Unnamed  | IIS/ASP.NET processing, inbound access controlled by a load balancer. |

  []()

## Queue Names

A queue name is divided into three major sections with a colon (:) delimiter between each section:

`Section1:Section2:Section3`

### Section1

Section1 represents a RabbitMQ exchange name. There are three predetermined exchange names, two legacy predetermined exchange names, and then a variable number of exchanges determined by the number of SS sites.

**Table:** RabbitMQ Exchange Names

| **Role**                 | **Exchange Name**           | **Type**             | **Consumer  Component Location** | **Comment**                                                  |
| ------------------------ | --------------------------- | -------------------- | -------------------------------- | ------------------------------------------------------------ |
| Background Worker        | thycotic-ss                 | Predetermined        | Web Node                         |                                                              |
| Engine                   | Site Name                   | Variable             | Web Node or Distributed Engine   | The out-of-the-box local site can be configured for either a Web node  or a distributed engine. Any other site name is processed by a distributed engine. |
| Engine Worker            | thycotic-ss-engine-response | Predetermined        | Web Node                         |                                                              |
| Session Recording Worker | thycotic-sessionrec         | Predetermined        | Web Node                         |                                                              |
| Session Recording Worker | thycotic-sr                 | Predetermined-Legacy | Web Node                         | Legacy: background work dedicated to session recording processing. |
| Session Recording Worker | thycotic-sr-agent-response  | Predetermined-Legacy | Web Node                         | Legacy: processes data sent by an advanced session recoding agent. |

 []()

Variable site exchanges: If the SS site is called local, then `local:` will also be the exchange name. If the Site is called Mars, then `Mars:` will be the exchange name.

###  Section2

Section2 typically has a name which represents a functional area in SS code that is a consumer of the message.

###  Section3

Section3 represents the message name.

## Secret Server Roles and Queues

This section of the message associates roles with queues and breaks the down by product functionality. Functionality can span multiple roles, for example, discovery is done by background worker, engine and engine worker roles while event pipelines is only done by a background worker role.

### Background Worker Role Queues

List of queues for background worker’s functional areas:

#### Active Directory Synchronization

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ActiveDirectorySynchronization.SynchronizationConsumer:Thycotic.ihawu.Business.Messages.Areas.ActiveDirectorySynchronization.Request.RunNowSynchronizationMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ActiveDirectorySynchronization.SynchronizationConsumer:Thycotic.ihawu.Business.Messages.Areas.ActiveDirectorySynchronization.Request.SynchronizationMessage`

#### Bulk Operation

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.BulkOperation.BulkOperationConsumer:Thycotic.ihawu.Business.Messages.Areas.BulkOperation.Request.BulkOperationMessage`

#### ConnectWise Integration

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ConnectWise.ConnectWiseConsumer:Thycotic.ihawu.Business.Messages.Areas.ConnectWise.Request.ConnectWiseMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ConnectWise.ConnectWiseConsumer:Thycotic.ihawu.Business.Messages.Areas.ConnectWise.Request.RunNowConnectWiseMessage`

#### Discovery

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.ComputerScanConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.ComputerScanMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.ComputerScanConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.RunNowComputerScanMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.DiscoveryConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.DiscoveryMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.ComputerScanConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.RunNowComputerScanMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.DiscoveryRuleApplierConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.RunDiscoveryRuleApplierMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.ComputerScanConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.RunNowComputerScanMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Discovery.SecretComputerMatcherConsumer:Thycotic.ihawu.Business.Messages.Areas.Discovery.Request.SecretComputerMatcherMessage`

#### Duo Integration

- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.Duo.DuoAuthConsumer:Thycotic.Messages.ihawu.Areas.Duo.DuoRequestMessage`

#### Email Processing

- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.Email.SendEmailConsumer:Thycotic.Messages.ihawu.Areas.Email.Request.SystemSendEmailMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.Email.VerifySendEmailConsumer:Thycotic.Messages.ihawu.Areas.Email.Request.VerifySendEmailRequest`

#### Event Pipelines

- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.EventPipelines.EventPipelineActivityConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.EventPipelineActivityEventMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.EventPipelines.PipelinePolicyProcessConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.PipelinePoliciesProcessBlockingMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.EventPipelines.PipelinePolicyProcessConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.PipelinePoliciesProcessMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.EventPipelines.PipelinePolicyProcessConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.PipelinePoliciesProcessBlockingMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.EventPipelines.PipelineProcessConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.PipelineProcessMessageWithPolicies`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.EventPipelines.PipelinePolicyProcessConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.PipelinePoliciesProcessBlockingMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.EventPipelines.PipelinePolicyProcessEventConsumer:Thycotic.Messages.ihawu.Areas.EventPipelines.Request.PipelinePolicyProcessEventMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.EventPipelines.PipelineProcessScheduledEventConsumer:Thycotic.ihawu.Business.Messages.Areas.EventPipelines.ProcessPipelineScheduledEventMessage`

#### Heartbeat and Remote Password Change

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.CheckinExpiredCheckedoutSecretConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.CheckinExpiredCheckedoutSecretMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ExpiredSecretLocalPasswordChangeConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.ExpiredSecretLocalPasswordChangeMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ExpiredSecretLocalPasswordChangeConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.RunNowExpiredSecretLocalPasswordChangeMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ExpiredSecretLocalPasswordChangeConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.ExpiredSecretLocalPasswordChangeMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ExpiredSecretPasswordChangeConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.RunNowExpiredSecretPasswordChangeMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ExpiredSecretLocalPasswordChangeConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.ExpiredSecretLocalPasswordChangeMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ProcessHeartbeatConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.RunNowProcessHeartbeatMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ExpiredSecretLocalPasswordChangeConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.ExpiredSecretLocalPasswordChangeMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RemotePasswordChanging.ProcessLocalHeartbeatConsumer:Thycotic.ihawu.Business.Messages.Areas.RemotePasswordChanging.Request.RunNowProcessLocalHeartbeatMessage`

#### Import

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Import.SecretImportConsumer:Thycotic.ihawu.Business.Messages.Import.SecretImportBulkMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Import.SecretImportFileConsumer:Thycotic.ihawu.Business.Messages.Import.SecretImportFileMessage`

#### Management: Backup, and Cleanup

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.OnPremisesOnly.BackgroundWorkerTaskConsumer:Thycotic.ihawu.Business.Messages.Areas.OnPremisesOnly.BackgroundWorkerTaskMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.OnPremisesOnly.BackupConsumer:Thycotic.ihawu.Business.Messages.Areas.OnPremisesOnly.BackupMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.OnPremisesOnly.BackupConsumer:Thycotic.ihawu.Business.Messages.Areas.OnPremisesOnly.RunNowBackupMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.OnPremisesOnly.BackupConsumer:Thycotic.ihawu.Business.Messages.Areas.OnPremisesOnly.BackupMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.SessionArchiving.RecordedSessionsArchiveConsumer:Thycotic.ihawu.Business.Messages.Areas.SessionArchiving.Request.ArchiveRecordedSessionsMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.OnPremisesOnly.BackupConsumer:Thycotic.ihawu.Business.Messages.Areas.OnPremisesOnly.BackupMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.SessionArchiving.RecordedSessionsArchiveConsumer:Thycotic.ihawu.Business.Messages.Areas.SessionArchiving.Request.RunNowDeleteRecordedSessionsMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.OnPremisesOnly.BackupConsumer:Thycotic.ihawu.Business.Messages.Areas.OnPremisesOnly.BackupMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.TruncateRecords.TruncateRecordsConsumer:Thycotic.ihawu.Business.Messages.Areas.TruncateRecords.TruncateRecordsForConfigurationMessage`
- `thycotic-ss:Thycotic.MessageQueue.Common.Consumers.AutomaticSink.CreateAutomaticSinkConsumer:Thycotic.MessageQueue.Common.Messages.AutomaticSink.Request.CreateAutomaticSinkMessage`

#### Distributed Engine Management

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.DistributedEngine.EngineStatusUpdateConsumer:Thycotic.ihawu.Business.Messages.Areas.DistributedEngine.Request.EngineStatusUpdateMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.DistributedEngine.TruncateEngineLogConsumer:Thycotic.ihawu.Business.Messages.Areas.DistributedEngine.Request.TruncateEngineLogMessage`

#### Password Generation

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.PasswordGeneration.GeneratePasswordConsumer:Thycotic.ihawu.Business.Messages.Areas.PasswordGeneration.Request.GeneratePasswordMessage`

####  Reports

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Report.EmailReportConsumer:Thycotic.Messages.ihawu.Areas.Email.Request.EmailReportMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Report.ScheduledReportConsumer:Thycotic.ihawu.Business.Messages.Areas.Reports.Request.ProcessReportsMessage`

#### Run Now

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowProcessDashboardJsonValidationConsumer:Thycotic.ihawu.Business.Messages.Areas.RunOnceTasks.RunNowProcessDashboardJsonValidationMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesConsumer:Thycotic.ihawu.Business.Messages.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.ProcessFieldEncryptionChangesMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesConsumer:Thycotic.ihawu.Business.Messages.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowProcessSecretPolicyChangesConsumer:Thycotic.ihawu.Business.Messages.Areas.RunOnceTasks.RunNowProcessSecretPolicyChangesMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesConsumer:Thycotic.ihawu.Business.Messages.Areas.RunOnceTasks.RunNowProcessFieldEncryptionChangesMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.RunOnceTasks.RunNowToggleHsmConsumer:Thycotic.ihawu.Business.Logic.Areas.SecretKeyRotation.Messages.RunNowToggleHsmMessage`

#### Scheduled Tasks

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.DatabaseCleanupConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.DatabaseCleanupMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.EventQueueMonitorConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.EventQueueMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.ExpiringLicenseTaskConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.ExpiringLicenseTaskMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.EventQueueMonitorConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.EventQueueMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.PasswordRequirementConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.PasswordRequirementMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.EventQueueMonitorConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.EventQueueMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ScheduledTask.TruncateDatabaseCacheConsumer:Thycotic.ihawu.Business.Messages.Areas.ScheduledTask.Request.TruncateDatabaseCacheMessage`

#### Search

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.ProxySessionDataHashIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.ProxySessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.RunNowProxySessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.ProxySessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.RdpSessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.RdpSessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.ProxySessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.SecretItemHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.RunNowSecretItemHashIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.ProxySessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.SessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.RunNowSessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.ProxySessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.ProxySessionDataHashReIndexRequest`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Search.SessionDataHashConsumer:Thycotic.ihawu.Business.Messages.Areas.Search.Request.SessionDataHashReIndexRequest`

#### SSH Terminal

- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.SSHTerminal.TerminalCommandBackgroundConsumer:Thycotic.Messages.DE.Server.Areas.SSHTerminal.Request.TerminalCommandMessage`

####  Thycotic Privilege Behavior Analytics Integration

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaAppendMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SAAppendMetadataSinkMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaCreateMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SACreateMetadataSinkMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaDirectiveConsumer:Thycotic.ihawu.Business.Messages.Areas.PBA.Request.DirectiveProcessMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaCreateMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SACreateMetadataSinkMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaEventUploadConsumer:Thycotic.Messages.SA.Areas.EventData.Request.SAEventUploadMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaCreateMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SACreateMetadataSinkMessage`
- `thycotic-ss:Thycotic.SecurityAnalytics.DataUploader.Consumers.DirectiveAddConsumer:Thycotic.Messages.SA.Areas.Directive.Request.SADirectiveSendMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.Pba.PbaCreateMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SACreateMetadataSinkMessage`
- `thycotic-ss:Thycotic.SecurityAnalytics.DataUploader.Consumers.HealthCheckConsumer:Thycotic.Messages.SA.Areas.Status.Request.SAHealthCheckMessage`
- `thycotic-ss:Thycotic.SecurityAnalytics.DataUploader.Consumers.HeartbeatConsumer:Thycotic.Messages.SA.Areas.Status.Request.SAHeartbeatMessage`

####  Thycotic Privilege Manager Integration

- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.TmsNotifications.NotifyTmsDatabaseUpdatedConsumer:Thycotic.Messages.ihawu.Areas.TmsNotifications.Request.NotifyTmsDatabaseUpdatedMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.TmsNotifications.NotifyTmsEmailSettingsUpdatedConsumer:Thycotic.Messages.ihawu.Areas.TmsNotifications.Request.NotifyTmsEmailSettingsUpdatedMessage`
- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.TmsNotifications.NotifyTmsLicenseUpdatedConsumer:Thycotic.Messages.ihawu.Areas.TmsNotifications.Request.NotifyTmsLicenseUpdatedMessage`

####  Thycotic Telemetry

- `thycotic-ss:Thycotic.ihawu.BackgroundWorker.Logic.Areas.Telemetry.TelemetryConsumer:Thycotic.Messages.ihawu.Areas.Telemetry.Request.SendAnonymousTelemetryMessage`

####  Thycotic One Identify Provider Integration

- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ThycoticOne.ThycoticOneSyncUserConsumer:Thycotic.ihawu.Business.Messages.Areas.ThycoticOne.Request.ThycoticOneScheduledSyncMessage`
- `thycotic-ss:Thycotic.ihawu.Business.Logic.Areas.ThycoticOne.ThycoticOneSyncUserConsumer:Thycotic.ihawu.Business.Messages.Areas.ThycoticOne.Request.ThycoticOneSyncUserMessage`

### Engine Role Queues

List of queues for engines’ functional areas.

> **Note:** In the example listed below, the SS site name is called “Gamma-Engines”.

#### Active Directory Synchronization

- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.ADSyncRequestConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.ADSyncMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.AllUsersByDomainQueryConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.AllUsersByDomainQueryMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.GenericQueryConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.GroupsAndMembersQueryMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.AllUsersByDomainQueryConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.AllUsersByDomainQueryMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.GenericQueryConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.UsersByGroupsQueryMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.AllUsersByDomainQueryConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.AllUsersByDomainQueryMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.ResolveDomainNameConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.ResolveFullyQualifiedDomainNameMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.ActiveDirectory.AllUsersByDomainQueryConsumer:Thycotic.Messages.DE.Engine.Areas.ActiveDirectory.Request.AllUsersByDomainQueryMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.AdSync.Areas.General.DomainCredentialTestConsumer:Thycotic.Messages.DE.Engine.Areas.General.Request.DomainCredentialTestMessage`

####  Discovery

- `Gamma-Engines:Thycotic.DE.Feature.SS.LocalAccountDiscovery.Areas.Discovery.HostRangeConsumer:Thycotic.Messages.DE.Engine.Areas.Discovery.Request.ScanHostRangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.LocalAccountDiscovery.Areas.Discovery.HostRangeConsumer:Thycotic.Messages.DE.Engine.Areas.Discovery.Request.SpecificOuScanHostRangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.LocalAccountDiscovery.Areas.Discovery.LocalAccountConsumer:Thycotic.Messages.DE.Engine.Areas.Discovery.Request.ScanLocalAccountMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.LocalAccountDiscovery.Areas.Discovery.MachineConsumer:Thycotic.Messages.DE.Engine.Areas.Discovery.Request.ScanMachineMessage`

####  Heartbeat, Remote Password Change, and Dependency

- `Gamma-Engines:Thycotic.DE.Feature.SS.PasswordChanging.Areas.BlockingChangePasswordConsumer:Thycotic.Messages.DE.Engine.Areas.PasswordChanging.Request.BlockingPasswordChangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.PasswordChanging.Areas.BlockingPrivilegeChangePasswordConsumer:Thycotic.Messages.DE.Engine.Areas.PasswordChanging.Request.BlockingPrivilegedPasswordChangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.PasswordChanging.Areas.Heartbeat.SecretHeartbeatConsumer:Thycotic.Messages.DE.Engine.Areas.Heartbeat.Request.SecretHeartbeatMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.PasswordChanging.Areas.BlockingPrivilegeChangePasswordConsumer:Thycotic.Messages.DE.Engine.Areas.PasswordChanging.Request.BlockingPrivilegedPasswordChangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.PasswordChanging.Areas.SecretPrivilegeChangePasswordConsumer:Thycotic.Messages.DE.Engine.Areas.PasswordChanging.Request.SecretPrivilegedPasswordChangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.PasswordChanging.Areas.BlockingPrivilegeChangePasswordConsumer:Thycotic.Messages.DE.Engine.Areas.PasswordChanging.Request.BlockingPrivilegedPasswordChangeMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.ServiceAccountManagement.Areas.Dependency.DependencyConsumer:Thycotic.Messages.DE.Engine.Areas.Discovery.Request.ScanDependencyMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.ServiceAccountManagement.Areas.Dependency.SecretTestDependencyConsumer:Thycotic.Messages.DE.Engine.Areas.PasswordChanging.Request.SecretTestDependencyMessage`

#### Management

- `Gamma-Engines:Thycotic.DistributedEngine.Logic.Areas.Connectivity.PingConsumer:Thycotic.Messages.DE.Engine.Areas.Connectivity.Request.PingMessage`
- `Gamma-Engines:Thycotic.MessageQueue.Common.Consumers.AutomaticSink.CreateAutomaticSinkConsumer:Thycotic.MessageQueue.Common.Messages.AutomaticSink.Request.CreateAutomaticSinkMessage`

#### Proxy

- `Gamma-Engines:Thycotic.DE.Feature.SS.RdpProxy.AssignProxiedRdpSessionConsumer:Thycotic.Messages.DE.Engine.Areas.RDPProxy.Request.AssignProxiedRdpSessionMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.SshProxy.Areas.Proxy.AssignProxiedSessionConsumer:Thycotic.Messages.DE.Engine.Areas.SSHProxy.Request.AssignProxiedSessionMessage`

#### Scripting

- `Gamma-Engines:Thycotic.DistributedEngine.Logic.Areas.Script.ScriptConsumer:Thycotic.Messages.DE.Engine.Areas.Script.Request.PowerShellScriptMessage`
- `Gamma-Engines:Thycotic.DistributedEngine.Logic.Areas.Script.ScriptConsumer:Thycotic.Messages.DE.Engine.Areas.Script.Request.SqlScriptMessage`
- `Gamma-Engines:Thycotic.DistributedEngine.Logic.Areas.Script.ScriptConsumer:Thycotic.Messages.DE.Engine.Areas.Script.Request.SshScriptMessage`

#### Syslog Integration

- `Gamma-Engines:Thycotic.DE.Feature.SS.AdvancedAuditing.Areas.SIEM.SysLogConsumer:Thycotic.Messages.DE.Engine.Areas.SIEM.Request.SysLogMessage`

####  Thycotic Privilege Behavior Analytics Integration

- `Gamma-Engines:Thycotic.DE.Feature.SS.Pba.Areas.Event.PbaEventConsumer:Thycotic.Messages.SA.Areas.EventData.Request.SAEventMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.Pba.Areas.MetaData.PbaAppendMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SAAppendMetadataSinkMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.Pba.Areas.MetaData.PbaCreateMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SACreateMetadataSinkMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.Pba.Areas.MetaData.PbaAppendMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SAAppendMetadataSinkMessage`
- `Gamma-Engines:Thycotic.SecurityAnalytics.DataUploader.Consumers.DirectiveCheckConsumer:Thycotic.Messages.SA.Areas.Directive.Request.SADirectiveCheckMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.Pba.Areas.MetaData.PbaAppendMetadataSinkConsumer:Thycotic.Messages.SA.Areas.Metadata.Request.SAAppendMetadataSinkMessage`
- `Gamma-Engines:Thycotic.SecurityAnalytics.DataUploader.Consumers.HeartbeatConsumer:Thycotic.Messages.SA.Areas.Status.Request.SAHeartbeatMessage`

#### Ticketing System Integration

- `Gamma-Engines:Thycotic.DE.Feature.SS.SecretWorkflow.Areas.TicketingSystem.TicketingAddCommentConsumer:Thycotic.Messages.DE.Engine.Areas.TicketingSystem.Request.TicketingAddCommentBasicRequest`
- `Gamma-Engines:Thycotic.DE.Feature.SS.SecretWorkflow.Areas.TicketingSystem.TicketingAddCommentConsumer:Thycotic.Messages.DE.Engine.Areas.TicketingSystem.Request.TicketingAddCommentMessage`
- `Gamma-Engines:Thycotic.DE.Feature.SS.SecretWorkflow.Areas.TicketingSystem.TicketingGetStatusConsumer:Thycotic.Messages.DE.Engine.Areas.TicketingSystem.Request.TicketingGetStatusMessage`

### Engine Worker Role Queues

List of queues for engine worker’s functional areas:

#### Active Directory Synchronization

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.ActiveDirectory.ActiveDirectorySynchronizationConsumer:Thycotic.Messages.DE.Server.Areas.ActiveDirectory.Request.ADSyncMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.ActiveDirectory.AllUsersByDomainQueryConsumer:Thycotic.Messages.DE.Server.Areas.ActiveDirectory.Request.AllUsersByDomainQueryMessage`

####  Discovery

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Discovery.ScanDepedencyConsumer:Thycotic.Messages.DE.Server.Areas.Discovery.Request.ScanDependencyMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Discovery.ScanHostRangeResponseConsumer:Thycotic.Messages.DE.Server.Areas.Discovery.Request.ScanHostRangeMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Discovery.ScanLocalAccountConsumer:Thycotic.Messages.DE.Server.Areas.Discovery.Request.ScanLocalAccountMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Discovery.ScanHostRangeResponseConsumer:Thycotic.Messages.DE.Server.Areas.Discovery.Request.ScanHostRangeMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Discovery.SpecificOuScanHostRangeResponseConsumer:Thycotic.Messages.DE.Server.Areas.Discovery.Request.SpecificOuScanHostRangeMessage`

####  RDP Proxy, SSH Proxy, and SSH Terminal

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.RDPProxy.AppendKeystrokeDataConsumer:Thycotic.Messages.DE.Engine.Areas.RDPProxy.Request.AppendKeystrokeDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.AppendSessionDataConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.AppendSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.CloseSecretSessionConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.EndSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.AppendSessionDataConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.AppendSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.GetStatusUpdatesRequestConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.GetStatusUpdatesMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.AppendSessionDataConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.AppendSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.InitiateSSHProxiedSessionConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.InitiateProxiedSessionMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.AppendSessionDataConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.AppendSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.RdpProxySessionStatusesConsumer:Thycotic.Messages.DE.Engine.Areas.RDPProxy.Request.GetRdpProxySessionStatusesMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.AppendSessionDataConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.AppendSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.UpdateUserPasswordRequestConsumer:Thycotic.Messages.DE.Server.Areas.SSHTerminal.Request.UpdateUserPasswordMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SSHProxy.AppendSessionDataConsumer:Thycotic.Messages.DE.Server.Areas.SSHProxy.Request.AppendSessionDataMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.UserSession.CloseUserSessionConsumer:Thycotic.Messages.DE.Server.Areas.UserSession.CloseUserSessionMessage`

#### Syslog Integration

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.SEIM.SysLogResultResponseConsumer:Thycotic.Messages.DE.Server.Areas.SEIM.Request.SysLogResultMessage`

#### Heartbeat, Remote Password Change, and Dependency

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Dependency.DependencyChangeConsumer:Thycotic.Messages.DE.Server.Areas.Dependency.Request.DependencyChangeMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Heartbeat.SecretHeartbeatConsumer:Thycotic.Messages.DE.Server.Areas.Heartbeat.Request.SecretHeartbeatMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.PasswordChanging.RemotePasswordChangeResponseStoreConsumer:Thycotic.Messages.DE.Server.Areas.PasswordChanging.Request.RemotePasswordChangeMessage`

#### Thycotic Privilege Behavior Analytics Integration

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.PasswordChanging.PbaDisableConsumer:Thycotic.Messages.DE.Server.Areas.PBA.PbaDisableMessage`

#### Distributed Engine Management

- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Connectivity.PingConsumer:Thycotic.Messages.DE.Server.Areas.Connectivity.Request.PingMessage`
- `thycotic-ss-engine-response:Thycotic.ihawu.EngineWorker.Logic.Areas.Maintenance.LogConsumer:Thycotic.Messages.DE.Server.Areas.Maintenance.Request.EngineLogMessage`
- `thycotic-ss-engine-response:Thycotic.MessageQueue.Common.Consumers.AutomaticSink.CreateAutomaticSinkConsumer:Thycotic.MessageQueue.Common.Messages.AutomaticSink.Request.CreateAutomaticSinkMessage`

### Session Recording Worker

List of queues for session recording worker’s functional areas:

#### Post Recording

- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.PostMetadataConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.ProcessUploadedMetadataMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.PostRecordedSessionConsumer:Thycotic.Messages.DE.Server.Areas.AdvancedSessionRecording.Request.RecordedSessionChunkMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.PostRecordedSessionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.ProcessBusStreamedSessionMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.PostRecordedSessionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.ProcessUploadedSessionMessage`

#### Video Conversion

- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.VideoConversionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.ConvertAllVideosMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.VideoConversionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.ConvertVideoMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.VideoConversionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.DeleteOldCompletedImagesMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.VideoConversionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.ConvertVideoMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.VideoConversionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.RunNowSetStatusForTimedOutSessionsMessage`
- `thycotic-sessionrec:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.VideoConversionConsumer:Thycotic.Messages.ihawu.Areas.SessionRecording.Request.SetStatusForTimedOutSessionsMessage`

####  Post Recording (Legacy)

- `thycotic-sr-agent-response:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.PostMetadataConsumer:Thycotic.Messages.DE.Server.Areas.AdvancedSessionRecording.Request.PostMetadataMessage`
- `thycotic-sr-agent-response:Thycotic.ihawu.SessionRecordingWorker.Logic.Areas.SessionRecording.PostRecordedSessionConsumer:Thycotic.Messages.DE.Server.Areas.AdvancedSessionRecording.Request.PostRecordedSessionMessage`

####  Management

- `thycotic-sessionrec:Thycotic.MessageQueue.Common.Consumers.AutomaticSink.CreateAutomaticSinkConsumer:Thycotic.MessageQueue.Common.Messages.AutomaticSink.Request.CreateAutomaticSinkMessage`

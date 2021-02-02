[title]: # "Discovery and Sites"
[tags]: # "Discovery, sites, distributed engine"
[priority]: # "1020"

## Discovery and Sites—Where Does Secret Server Run Discovery Scans?

Like many operations in SS, you can configure discovery to run locally on IIS machines running SS using website processing or by running through a distributed engine. Distributed engines are agents that you can deploy to remotely process work. They are useful for scenarios where performance is an issue or the work must take place in a remote network where the ports required by discovery are not available. You can configure discovery to use a single site location per discovery source or on a per-OU basis for AD. 
[title]: # (Distributed Engine Offline and Online Events)
[tags]: # (Distributed Engine Offline and Online Events)
[priority]: # (1000)

# Distributed Engine Offline and Online Events

As of version 10.7.000059, Thycotic updated the definition of distributed engines' offline status to be the configured heartbeat interval times three. For instance, if your heartbeat interval is configured at 5 minutes, the engine will report offline if SS and the engine do not successfully communicate within a 15-minute time period. Engine online and offline states were also added to subscription actions to allow notification to admins when engine states change.

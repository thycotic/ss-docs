[title]: # (Stability and Compatibility with Older ASRAs)
[tags]: # (XXX)
[priority]: # (10)

# Stability and Compatibility with Older ASRAs

The latest ASRAs use more-reliable durable message exchanges, which are not compatible with earlier (already deployed) ASRAs. Version 7.7+ of the ASRA only requires HTTP connectivity to SS—the distributed engine response-bus site connector is no longer required. 

To prevent this from breaking older ASRS, exchanges remain permanently transient. Newer ASRAs use HTTP uploads, which do not use the message queue. Thus, older versions of ASRAs  continue to function as they have, and newer ASRA versions do not use the message queue and will have "durable" behavior over HTTP. We recommend updating your ASRA to version 7.7 or later as soon as feasible.

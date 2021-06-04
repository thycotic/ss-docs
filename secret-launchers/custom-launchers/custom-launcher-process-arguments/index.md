[title]: # (Custom Launcher Process Arguments)
[tags]: # (Launcher, Process Arguments)
[priority]: # (1000)
[redirect]: # (CustomLauncherProcessArguments,MacCustomLauncherProcessArguments)

# Custom Launcher Process Arguments

Custom launcher process arguments can use a combination of parameters from:

- A field value from the secret.
- A field value from a linked secret.
- User input obtained from a prompt prior to launching.
- `$Host` and `$Port` (for use with a proxied SSH process)

> **Note:** For more information, see the [Dependency Token List](../../../api-scripting/dependency-tokens/index.md).

## Syntax

Parameters are prefixed with a dollar sign `$`. To obtain a value from the secret being launched, use `$FieldName`. To obtain a value from a prompt, use `$PromptName`. To obtain a value from a linked secret being launched, use `$[n]$FieldName` (where n represents the nth linked secret). Linked secrets can be configured in the Launcher tab.

## Examples

`-user $UserName -color $[1]$Color -Location $LocationPrompt`

`-ssh $UserName@$Host -pw $Password -P $Port`
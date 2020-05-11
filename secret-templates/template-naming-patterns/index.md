[title]: # (Template Naming Patterns)
[tags]: # (Template)
[priority]: # (1000)

# Template Naming Patterns

SS supports naming patterns for secret templates. Naming patterns are a way for administrators to maintain consistency for secret names and can help ease both browsing and grouping secrets by name. Patterns are created using regular expressions. Regular expressions are a formal set of symbols commonly used to match text to patterns. For example, the regular expression `^\w+\\\w+$,` allows `NTDOMAIN01\USER3454` but not `USER3454` on `NTDOMAIN01`.

> **Note:** Regular expressions are beyond the scope of this document. They are very powerful and can get quite complex—books have been written on the topic. Microsoft offers a good overview at their [Regular Expression Language Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference) Web page.

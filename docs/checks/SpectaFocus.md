SpectaFocus
===========

Checks for instances of fcontext(…), fdescribe(…), fexample(…), fit(…), and fspecify(…).

#### Example

```
$ obcd --path=spec/fixtures/SpectaFocus/FocusedSpec.m find SpectaFocus
FocusedSpec.m: 5 violations
FocusedSpec.m:5:1: warning: SpectaFocus: Unexpected fcontext(…) found.
FocusedSpec.m:6:1: warning: SpectaFocus: Unexpected fdescribe(…) found.
FocusedSpec.m:7:1: warning: SpectaFocus: Unexpected fexample(…) found.
FocusedSpec.m:9:1: warning: SpectaFocus: Unexpected fit(…) found.
FocusedSpec.m:11:1: warning: SpectaFocus: Unexpected fspecify(…) found.
Found 5 violations.
```

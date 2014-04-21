#import "Specta.h"

SpecBegin(Focus)
  fdescribe (@"focused describe with space before the opening parenthesis" ^{
    fit  (  @"focused it with two spaces before and after the opening parenthesis" ^{
    })
  })
});

SpecEnd

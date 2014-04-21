#import "Specta.h"

SpecBegin(Focus)

fcontext(@"focused context", ^{
  fdescribe(@"focused describe", ^{
    fexample(@"focused example" ^{
    });
    fit(@"focused it", ^{
    });
    fspecify(@"focused specify", ^{
    });
  });
});

SpecEnd

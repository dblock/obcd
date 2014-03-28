Obcd
====

[![Build Status](https://travis-ci.org/dblock/obcd.png)](https://travis-ci.org/dblock/obcd)

Deal with obsessive compulsive issues of programmers in Objective-C.

Eventually, the goal of OBCD is to become to Objective-C what [Rubocop](https://github.com/bbatsov/rubocop) is to Ruby. So far it does one useful thing: help you fix the comment style on top of .h and .m files. For example, it can tell you that the name of the file in that comment doesn't match the actual file name.

## Checks

* [HeaderStyle](checks/HeaderStyle.md): Check header style on top of .h, .m and .pch files.

## Usage

```
gem install obcd
```

#### Get Help

```
obcd help
```

#### Example: Find Files with Invalid Headers

```
$ obcd --path=spec/fixtures find HeaderStyle

Checking HeaderStyle/WrongExtension.m: [1 violation(s) found]
 HeaderStyle: line 2: Filename extension doesn't match, expected .m, got .h.

Checking HeaderStyle/WrongFilename.h: [1 violation(s) found]
 HeaderStyle: line 2: Expected header to include file name, instead got //  ThisFilenameIsWrong.h.

Found 2 violation(s).
```

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## Copyright and License

Copyright (c) 2014, Daniel Doubrovkine, [Artsy](http://artsy.github.io).

This project is licensed under the [MIT License](LICENSE.md).

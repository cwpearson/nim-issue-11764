# nim-issue-11764
code for https://github.com/nim-lang/Nim/issues/11764

```
nim c -d:release -r slow_set.nim
```

* (1): insert 0.200k into set in order
* (2): insert 0..100k and 100k..200k interleaved
* (3): insert 0..100k and 1M..1.1M interleaved
* (4): (3), but hashset is sized for 100k insertions
* (5): (3), but hashset is sized for 200k insertions
* (6): (3), but hashset is sized for 1.1M insertions

example output 
```
Nim Compiler Version 1.0.0 [Linux: amd64]
Compiled at 2019-09-23
Copyright (c) 2006-2019 by Andreas Rumpf

git hash: f7a8fc46c0012033917582eb740dc0343c093e35
active boot switches: -d:release
```

```
(1) time 0.015417049
(2) time 0.952415456
(3) time 12.335662364
(4) time 12.212460556
(5) time 7.530930397999999
(6) time 0.003257626999996432
```
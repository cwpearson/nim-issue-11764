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
* (7): (3), but inserted in a random order
* (8): (3), but IntSet

example output 
```
Nim Compiler Version 1.0.0 [Linux: amd64]
Compiled at 2019-09-23
Copyright (c) 2006-2019 by Andreas Rumpf

git hash: f7a8fc46c0012033917582eb740dc0343c093e35
active boot switches: -d:release
```

```
(1) time 0.013764
(2) time 1.22484
(3) time 16.345614
(4) time 16.208671
(5) time 9.738357999999998
(6) time 0.002867999999999427
(7) time 15.688863
(3) time 0.002161999999998443
```
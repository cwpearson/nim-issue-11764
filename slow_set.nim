import sets
import times
import random
import intsets

when isMainModule:
    var hs1: HashSet[uint64]
    var hs2: HashSet[uint64]
    var hs3: HashSet[uint64]
    var hs4 = initHashSet[uint64](rightSize(100_000))
    var hs5 = initHashSet[uint64](rightSize(200_000))
    var hs6 = initHashSet[uint64](rightSize(1_100_000))
    var hs7: HashSet[uint64]
    var hs8 = initIntSet()

    # insert 0..200k
    var time = cpuTime()
    for i in 0..200_000:
        let k1 = uint64(i)
        hs1.incl(k1)
    echo "(1) time ", (cpuTime() - time)

    # interleave insert 0..100k and 100k..200k
    time = cpuTime()
    for i in 0..100_000:
        let k1 = uint64(i)
        let k2 = uint64(i + 100_000)
        hs2.incl(k1)
        hs2.incl(k2)
    echo "(2) time ", (cpuTime() - time)

    # interleave insert 0..100k and 1.0M..1.1M
    time = cpuTime()
    for i in 0..100_000:
        let k1 = uint64(i)
        let k2 = uint64(i + 1_000_000)
        hs3.incl(k1)
        hs3.incl(k2)
    echo "(3) time ", (cpuTime() - time)

    # interleave insert 0..100k and 1.0M..1.1M
    # but insert into a hashSet with space for 100k
    time = cpuTime()
    for i in 0..100_000:
        let k1 = uint64(i)
        let k2 = uint64(i + 1_000_000)
        hs4.incl(k1)
        hs4.incl(k2)
    echo "(4) time ", (cpuTime() - time)

    # interleave insert 0..100k and 1.0M..1.1M
    # but insert into a hashSet with space for 200K
    time = cpuTime()
    for i in 0..100_000:
        let k1 = uint64(i)
        let k2 = uint64(i + 1_000_000)
        hs5.incl(k1)
        hs5.incl(k2)
    echo "(5) time ", (cpuTime() - time)

    # interleave insert 0..100k and 1.0M..1.1M
    # but insert into a hashSet with space for 1.1M
    time = cpuTime()
    for i in 0..100_000:
        let k1 = uint64(i)
        let k2 = uint64(i + 1_000_000)
        hs6.incl(k1)
        hs6.incl(k2)
    echo "(6) time ", (cpuTime() - time)

    # interleave insert 0..100k and 1M..1.1M in a random order
    var vals: seq[int]
    for i in 0..100_000:
        vals.add(i)
    for i in 1_000_000..1_100_000:
        vals.add(i)
    shuffle(vals)
    time = cpuTime()
    for i in 0..<len(vals):
        let k1 = uint64(vals[i])
        hs7.incl(k1)
    echo "(7) time ", (cpuTime() - time)

    # interleave insert 0..100k and 1.0M..1.1M intset
    time = cpuTime()
    for i in 0..100_000:
        let k1 = i
        let k2 = i + 1_000_000
        hs8.incl(k1)
        hs8.incl(k2)
    echo "(8) time ", (cpuTime() - time)
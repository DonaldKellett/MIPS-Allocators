# MIPS-Allocators

Collection of malloc/free implementations in MIPS

## Synopsis

| Directory \# | Description |
| --- | --- |
| 0 | Naive allocator attaining maximum throughput but minimal resource utilization |

## To run

Copy `allocator.asm` from one of the numbered directories and paste in the same directory as `benchmark.asm`, then open `benchmark.asm` in the [MARS MIPS simulator](http://courses.missouristate.edu/kenvollmar/mars/), make sure "Settings > Assemble all files in directory" is checked, assemble and run. You should see the following output:

```
Person { name = Kevin Walker; age = 42; gender = MALE }
Person { name = Alice Buzzard; age = 70; gender = FEMALE }
Person { name = Jonathan Lomas; age = 13; gender = MALE }
Person { name = Catherine Forbes; age = 28; gender = FEMALE }
1 0
0 1
1 0 0 0 0 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0 0 0 0
0 0 0 1 0 0 0 0 0 0 0 0
0 0 0 0 1 0 0 0 0 0 0 0
0 0 0 0 0 1 0 0 0 0 0 0
0 0 0 0 0 0 1 0 0 0 0 0
0 0 0 0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 0 0 0 1
1 0 0 0 0 0 0 0 0
0 1 0 0 0 0 0 0 0
0 0 1 0 0 0 0 0 0
0 0 0 1 0 0 0 0 0
0 0 0 0 1 0 0 0 0
0 0 0 0 0 1 0 0 0
0 0 0 0 0 0 1 0 0
0 0 0 0 0 0 0 1 0
0 0 0 0 0 0 0 0 1
1 0 0 0 0 0 0
0 1 0 0 0 0 0
0 0 1 0 0 0 0
0 0 0 1 0 0 0
0 0 0 0 1 0 0
0 0 0 0 0 1 0
0 0 0 0 0 0 1
```

## Possible Improvements

Currently, `benchmark.asm` performs no benchmarking and only contains a sanity check that the allocator does not fail on a typical example. Ideally, the sanity check would be replaced with proper benchmarking tests to carefully analyze the throughput and utilization of each allocator.

## Credits

The allocators in this repo are inspired by the following sources:

- [Computer Systems: A Programmer's Perspective](http://guanzhou.pub/files/Computer%20System_EN.pdf)

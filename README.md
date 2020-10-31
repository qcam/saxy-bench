# Saxy Bench

The previous benchmarking suite of [Saxy](https://github.com/qcam/saxy).

**NOTE:** This repo is archived. The suite has been moved to [Saxy](https://github.com/qcam/saxy).

## TL;DR report

The benchmark result shows:

For simple XML, Saxy is 1.5 times faster than Erlsom.

For large and nested XML, Saxy is noticeably faster than Erlsom with 4.35 times.

## Benchmark results

### Machine information

```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i5-5257U CPU @ 2.70GHz
Number of Available Cores: 4
Available memory: 8 GB
Elixir 1.6.1
Erlang 20.2.2
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
parallel: 1
inputs: none specified
Estimated total run time: 24 s
```

### SAX parser

#### [Hackernoon RSS](https://hackernoon.com/feed)

```
Name               ips        average  deviation         median         99th %
exomler        2270.16        0.44 ms     ±8.58%        0.43 ms        0.61 ms
saxy            530.25        1.89 ms     ±4.79%        1.87 ms        2.10 ms
erlsom          340.88        2.93 ms    ±16.55%        3.01 ms        4.11 ms
meeseeks        236.90        4.22 ms     ±4.89%        4.19 ms        4.92 ms

Comparison:
exomler        2270.16
saxy            530.25 - 4.28x slower
erlsom          340.88 - 6.66x slower
meeseeks        236.90 - 9.58x slower
```

### [/r/sweden Reddit RSS (Unicode characters)](https://www.reddit.com/r/sweden/.rss)

```
Name               ips        average  deviation         median         99th %
saxy            791.08        1.26 ms    ±11.38%        1.22 ms        1.92 ms
erlsom          522.45        1.91 ms    ±20.71%        1.86 ms        3.07 ms
exomler         447.38        2.24 ms     ±5.42%        2.22 ms        2.62 ms
meeseeks        279.84        3.57 ms     ±6.87%        3.51 ms        4.90 ms

Comparison:
saxy            791.08
erlsom          522.45 - 1.51x slower
exomler         447.38 - 1.77x slower
meeseeks        279.84 - 2.83x slower
```

### Nested XML document

```
Name               ips        average  deviation         median         99th %
saxy             18.77       53.28 ms     ±5.88%       53.10 ms       62.19 ms
meeseeks          7.13      140.17 ms     ±6.23%      138.82 ms      190.32 ms
exomler           6.43      155.40 ms     ±1.83%      155.34 ms      168.21 ms
erlsom            4.14      241.55 ms     ±2.06%      241.98 ms      250.00 ms

Comparison:
saxy             18.77
meeseeks          7.13 - 2.63x slower
exomler           6.43 - 2.92x slower
erlsom            4.14 - 4.53x slower
```

## Simple Form parsing

#### [Hackernoon RSS](https://hackernoon.com/feed)

```
Name               ips        average  deviation         median         99th %
exomler        2213.38        0.45 ms     ±7.05%        0.45 ms        0.57 ms
saxy            525.08        1.90 ms     ±4.59%        1.88 ms        2.15 ms
erlsom          372.05        2.69 ms    ±16.09%        2.97 ms        3.36 ms
meeseeks        237.52        4.21 ms     ±4.11%        4.18 ms        4.96 ms
xmerl            61.58       16.24 ms    ±15.60%       15.56 ms       24.06 ms

Comparison:
exomler        2213.38
saxy            525.08 - 4.22x slower
erlsom          372.05 - 5.95x slower
meeseeks        237.52 - 9.32x slower
xmerl            61.58 - 35.94x slower
```

### [/r/sweden Reddit RSS (Unicode characters)](https://www.reddit.com/r/sweden/.rss)

```
Name               ips        average  deviation         median         99th %
saxy            750.28        1.33 ms     ±8.03%        1.30 ms        1.66 ms
erlsom          481.57        2.08 ms    ±23.62%        1.84 ms        3.26 ms
exomler         444.24        2.25 ms     ±7.02%        2.23 ms        2.73 ms
meeseeks        269.00        3.72 ms     ±6.22%        3.68 ms        4.37 ms
xmerl           112.03        8.93 ms     ±8.93%        8.63 ms       10.94 ms

Comparison:
saxy            750.28
erlsom          481.57 - 1.56x slower
exomler         444.24 - 1.69x slower
meeseeks        269.00 - 2.79x slower
xmerl           112.03 - 6.70x slower
```

### Nested XML document

```
Name               ips        average  deviation         median         99th %
saxy             17.37       57.58 ms     ±7.18%       57.13 ms       72.39 ms
meeseeks          7.18      139.30 ms     ±2.47%      138.76 ms      148.10 ms
exomler           6.36      157.35 ms     ±3.51%      156.23 ms      193.53 ms
xmerl             3.88      257.83 ms     ±9.13%      245.73 ms      334.42 ms
erlsom            3.64      274.71 ms     ±1.75%      273.99 ms      297.76 ms

Comparison:
saxy             17.37
meeseeks          7.18 - 2.42x slower
exomler           6.36 - 2.73x slower
xmerl             3.88 - 4.48x slower
erlsom            3.64 - 4.77x slower
```

## Streaming parsing

### Nested XML document (1.1 MB)

```
Name                    ips        average  deviation         median         99th %
saxy.binary           14.04       71.25 ms     ±3.71%       71.20 ms       80.35 ms
saxy.stream           12.58       79.51 ms     ±3.50%       79.12 ms       88.43 ms
erlsom.stream          4.68      213.73 ms    ±11.47%      211.54 ms      274.33 ms
erlsom.binary          3.52      284.45 ms     ±2.31%      284.33 ms      302.44 ms

Comparison:
saxy.binary           14.04
saxy.stream           12.58 - 1.12x slower
erlsom.stream          4.68 - 3.00x slower
erlsom.binary          3.52 - 3.99x slower
```

### Large XML document (30 MB)

```
Name                    ips        average  deviation         median         99th %
saxy.binary            0.25         4.04 s     ±0.43%         4.04 s         4.05 s
saxy.stream           0.189         5.29 s     ±0.55%         5.29 s         5.32 s
erlsom.stream         0.160         6.23 s    ±13.55%         6.23 s         7.08 s
erlsom.binary         0.133         7.51 s     ±9.02%         7.51 s         8.19 s

Comparison:
saxy.binary            0.25
saxy.stream           0.189 - 1.31x slower
erlsom.stream         0.160 - 1.54x slower
erlsom.binary         0.133 - 1.86x slower
```

## Encoding

### `mix bench.encode.simple`

```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-6567U CPU @ 3.30GHz
Number of Available Cores: 4
Available memory: 16 GB
Elixir 1.6.5
Erlang 20.3.4
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 1
inputs: none specified
Estimated total run time: 14 s


Benchmarking saxy...
Benchmarking xml_builder...

Name                  ips        average  deviation         median         99th %
saxy              14.39 K       69.48 μs    ±17.57%          66 μs         118 μs
xml_builder        3.46 K      288.71 μs    ±13.61%         278 μs         450 μs

Comparison:
saxy              14.39 K
xml_builder        3.46 K - 4.16x slower
```

### `mix bench.encode.nested`

```
Generated saxy_bench app
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-6567U CPU @ 3.30GHz
Number of Available Cores: 4
Available memory: 16 GB
Elixir 1.6.5
Erlang 20.3.4
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 1
inputs: none specified
Estimated total run time: 21 s


Benchmarking saxy...
Benchmarking xml_builder indented...
Benchmarking xml_builder no format...

Name                            ips        average  deviation         median         99th %
saxy                         278.59        3.59 ms    ±11.67%        3.51 ms        5.42 ms
xml_builder no format         14.09       70.97 ms     ±8.57%       69.40 ms       95.40 ms
xml_builder indented           0.36     2790.85 ms     ±0.18%     2790.85 ms     2795.99 ms

Comparison:
saxy                         278.59
xml_builder no format         14.09 - 19.77x slower
xml_builder indented           0.36 - 777.51x slower
```

### `mix bench.encode.long`

```
Operating System: macOS
CPU Information: Intel(R) Core(TM) i7-6567U CPU @ 3.30GHz
Number of Available Cores: 4
Available memory: 16 GB
Elixir 1.6.5
Erlang 20.3.4
Benchmark suite executing with the following configuration:
warmup: 2 s
time: 5 s
parallel: 1
inputs: none specified
Estimated total run time: 21 s


Benchmarking saxy...
Benchmarking xml_builder indented...
Benchmarking xml_builder no format...

Name                            ips        average  deviation         median         99th %
saxy                        1138.55        0.88 ms    ±29.18%        0.81 ms        2.00 ms
xml_builder no format        659.89        1.52 ms     ±5.37%        1.47 ms        1.84 ms
xml_builder indented         651.91        1.53 ms     ±7.56%        1.48 ms        2.03 ms

Comparison:
saxy                        1138.55
xml_builder no format        659.89 - 1.73x slower
xml_builder indented         651.91 - 1.75x slower
```

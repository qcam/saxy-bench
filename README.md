# Saxy Bench

The benchmarking suite of [Saxy](https://github.com/qcam/saxy).

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
Name             ips        average  deviation         median         99th %
saxy          437.79        2.28 ms     ±8.48%        2.22 ms        3.21 ms
erlsom        275.23        3.63 ms    ±16.01%        3.71 ms        5.03 ms

Comparison:
saxy          437.79
erlsom        275.23 - 1.59x slower
```

### [/r/sweden Reddit RSS (Unicode characters)](https://www.reddit.com/r/sweden/.rss)

```
Name             ips        average  deviation         median         99th %
saxy          582.05        1.72 ms    ±12.19%        1.65 ms        2.80 ms
erlsom        386.85        2.59 ms    ±18.56%        2.69 ms        4.12 ms

Comparison:
saxy          582.05
erlsom        386.85 - 1.50x slower
```

### Nested XML document

```
Name             ips        average  deviation         median         99th %
saxy           15.37       65.08 ms     ±5.36%       64.98 ms       76.18 ms
erlsom          3.53      283.09 ms     ±1.28%      282.47 ms      294.30 ms

Comparison:
saxy           15.37
erlsom          3.53 - 4.35x slower
```

## Simple Form parsing

#### [Hackernoon RSS](https://hackernoon.com/feed)

```
Name             ips        average  deviation         median         99th %
saxy          421.99        2.37 ms     ±9.78%        2.29 ms        3.72 ms
erlsom        286.80        3.49 ms    ±15.11%        3.79 ms        4.46 ms

Comparison:
saxy          421.99
erlsom        286.80 - 1.47x slower
```

### [/r/sweden Reddit RSS (Unicode characters)](https://www.reddit.com/r/sweden/.rss)

```
Name             ips        average  deviation         median         99th %
saxy          565.88        1.77 ms    ±12.68%        1.70 ms        2.98 ms
erlsom        409.14        2.44 ms    ±22.06%        2.24 ms        4.11 ms

Comparison:
saxy          565.88
erlsom        409.14 - 1.38x slower
```

### Nested XML document

```
Name             ips        average  deviation         median         99th %
saxy           14.09       70.96 ms     ±5.30%       70.90 ms       77.98 ms
erlsom          3.05      327.58 ms     ±1.18%      327.04 ms      337.97 ms

Comparison:
saxy           14.09
erlsom          3.05 - 4.62x slower
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
saxy             531.20 K        1.88 μs  ±2607.67%           2 μs           3 μs
xml_builder       58.35 K       17.14 μs   ±123.35%          16 μs       38.96 μs

Comparison:
saxy             531.20 K
xml_builder       58.35 K - 9.10x slower
```

### `mix bench.encode.nested`

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
saxy                        7067.60      0.00014 s    ±12.67%      0.00014 s      0.00022 s
xml_builder no format         42.14       0.0237 s     ±6.64%       0.0236 s       0.0265 s
xml_builder indented           0.39         2.56 s     ±0.13%         2.56 s         2.57 s

Comparison:
saxy                        7067.60
xml_builder no format         42.14 - 167.72x slower
xml_builder indented           0.39 - 18114.15x slower
```

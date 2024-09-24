---
title: "solve set partition problem"
date: 2022-03-27 03:01:00
tags:
  - algorithm
---

# Set Partition Problem

## Solution

### Solution 1 (Stirling)

#### Code

```java
    public static int S(int n, int m) {
        if (m == 0 || n < m) return 0;
        if (m == 1 || n == m) return 1;
        return S(n - 1, m - 1) + m * S(n - 1, m);
    }

    public static int A(int n) {
        int sum = 0;
        for (int m = 1; m <= n; m++) {
            sum += S(n, m);
        }
        return sum;
    }
```

#### Benchmark

```yaml
-----------------------------------------------------
Current Case: BELL0.in & BELL0.out
Expected  Input: [5]
Expected Output: [52]
Your     Output: [52]
Time Cost: 1.643300 ms (1643300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL1.in & BELL1.out
Expected  Input: [15]
Expected Output: [1382958545]
Your     Output: [1382958545]
Time Cost: 1.033600 ms (1033600 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL2.in & BELL2.out
Expected  Input: [16]
Expected Output: [1890207555]
Your     Output: [1890207555]
Time Cost: 0.819100 ms (819100 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL3.in & BELL3.out
Expected  Input: [17]
Expected Output: [1260491180]
Your     Output: [1260491180]
Time Cost: 0.877300 ms (877300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL4.in & BELL4.out
Expected  Input: [14]
Expected Output: [190899322]
Your     Output: [190899322]
Time Cost: 0.726000 ms (726000 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL5.in & BELL5.out
Expected  Input: [13]
Expected Output: [27644437]
Your     Output: [27644437]
Time Cost: 0.634700 ms (634700 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL6.in & BELL6.out
Expected  Input: [6]
Expected Output: [203]
Your     Output: [203]
Time Cost: 0.676200 ms (676200 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL7.in & BELL7.out
Expected  Input: [7]
Expected Output: [877]
Your     Output: [877]
Time Cost: 0.712700 ms (712700 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ 
```



### Solution 2 (Simulation)

#### Code

```java
    public static ArrayList<Integer> M = new ArrayList<>(Arrays.asList(1, 1));

    public static ArrayList<Integer> generateSimulateList(int n) {

        /* Initialize simulate list */
        ArrayList<Integer> simulateList = new ArrayList<>(Arrays.asList(1));
        if (n == 0) return simulateList;

        /* Construct simulate list */
        for (int k = 2; k < n; k++) {
            ArrayList<Integer> tempList = new ArrayList<>();
            int sum = 0;

            for (int t : simulateList) {
                // add a (self + 1)
                tempList.add(t + 1);

                // add self amount of self
                for (int i = 0; i < t; i++) tempList.add(t);

                // calc sum
                sum += (t + 1) + (t * t);
            }

            if (k == M.size()) {
                M.add(sum);
            }

            simulateList = tempList;
        }

        return simulateList;
    }

    public static int solve(int n) {

        /* Generate M[] */
        generateSimulateList(n);

        /* Accumulate plans */
        int sum = 0;
        for (int k = 0; k < n; k++) {
            sum += M.get(k);
        }
        return sum;
    }
```

#### Benchmark

```yaml
-----------------------------------------------------
Current Case: BELL0.in & BELL0.out
Expected  Input: [5]
Expected Output: [52]
Your     Output: [52]
Time Cost: 1.638300 ms (1638300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL1.in & BELL1.out
Expected  Input: [15]
Expected Output: [1382958545]
Your     Output: [1382958545]
Time Cost: 5871.995300 ms (5871995300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL2.in & BELL2.out
Expected  Input: [16]
Expected Output: [1890207555]
Your     Output: []
Skipped.
-----------------------------------------------------
Current Case: BELL3.in & BELL3.out
Expected  Input: [17]
Expected Output: [1260491180]
Your     Output: []
Skipped.
-----------------------------------------------------
Current Case: BELL4.in & BELL4.out
Expected  Input: [14]
Expected Output: [190899322]
Your     Output: [190899322]
Time Cost: 5377.599300 ms (5377599300 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL5.in & BELL5.out
Expected  Input: [13]
Expected Output: [27644437]
Your     Output: [27644437]
Time Cost: 45.983500 ms (45983500 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL6.in & BELL6.out
Expected  Input: [6]
Expected Output: [203]
Your     Output: [203]
Time Cost: 0.636100 ms (636100 ns)
Accepted.
-----------------------------------------------------
Current Case: BELL7.in & BELL7.out
Expected  Input: [7]
Expected Output: [877]
Your     Output: [877]
Time Cost: 0.658200 ms (658200 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ → → √ √ √ √ 
```

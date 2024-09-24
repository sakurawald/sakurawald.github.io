---
title: "solve majority problem"
date: 2022-03-25 19:27:00
tags:
  - algorithm
---

# Majority Problem

{% raw %}
$$
\boxed{@}
% Color %
\newcommand\c[2]{\textcolor{#1}{#2}}
\newcommand\r[1]{\textcolor{red}{#1}}
\newcommand\g[1]{\textcolor{green}{#1}}
\newcommand\b[1]{\textcolor{blue}{#1}}
\newcommand\red[1]{\textcolor{red}{#1}}
\newcommand\blue[1]{\textcolor{blue}{#1}}
\newcommand\green[1]{\textcolor{green}{#1}}
\newcommand\black[1]{\textcolor{black}{#1}}
\newcommand\white[1]{\textcolor{white}{#1}}
\newcommand\cyan[1]{\textcolor{cyan}{#1}}
\newcommand\magenta[1]{\textcolor{magenta}{#1}}
\newcommand\yellow[1]{\textcolor{yellow}{#1}}
\newcommand\orange[1]{\textcolor{orange}{#1}}
\newcommand\lime[1]{\textcolor{lime}{#1}}
\newcommand\pink[1]{\textcolor{pink}{#1}}
\newcommand\darkgray[1]{\textcolor{darkgray}{#1}}
\newcommand\gray[1]{\textcolor{gray}{#1}}
\newcommand\lightgray[1]{\textcolor{lightgray}{#1}}
\newcommand\brown[1]{\textcolor{brown}{#1}}
\newcommand\olive[1]{\textcolor{olive}{#1}}
\newcommand\purple[1]{\textcolor{purple}{#1}}
\newcommand\teal[1]{\textcolor{teal}{#1}}
\newcommand\violet[1]{\textcolor{violet}{#1}}
\newcommand\hotpink[1]{\textcolor{hotpink}{#1}}
\newcommand\blueviolet[1]{\textcolor{blueviolet}{#1}}
\newcommand\navyblue[1]{\textcolor{navyblue}{#1}}
\newcommand\peach[1]{\textcolor{Peach}{#1}}
\newcommand\orangeRed[1]{\textcolor{OrangeRed}{#1}}
\newcommand\salmon[1]{\textcolor{Salmon}{#1}}
\newcommand\skyblue[1]{\textcolor{SkyBlue}{#1}}
\newcommand\springreen[1]{\textcolor{SpringGreen}{#1}}
\newcommand\aqua[1]{\textcolor{aqua}{#1}}
\newcommand\navy[1]{\textcolor{navy}{#1}}
\newcommand\silver[1]{\textcolor{silver}{#1}}
\newcommand\fuchsia[1]{\textcolor{fuchsia}{#1}}
\newcommand\maroon[1]{\textcolor{maroon}{#1}}
\definecolor{luo}{RGB}{102,204,255}
\definecolor{miku}{RGB}{57,197,187} 
\newcommand\luo[1]{\textcolor{luo}{#1}}
\newcommand\miku[1]{\textcolor{miku}{#1}}

% Typography %
\newcommand\a[1]{\begin{aligned}#1\end{aligned}}
\newcommand\t[1]{\text{#1}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}

% Misc %
\newcommand\s[1]{\{#1\}}
\newcommand\qed{\quad\square}
\newcommand\define{\dot{=}}
\newcommand\then{\implies}
\newcommand\rounddown[1]{\lfloor{#1}\rfloor}
\newcommand\roundup[1]{\lceil{#1}\rceil}
\newcommand\graph[4]{#1 = (#2, #3) \quad |#2| = #4}
\newcommand\G{G = (V, E) \quad |V| = n}
\newcommand\so{\therefore}
\newcommand\comment[1]{\quad\text{(#1)}}
\newcommand\note[1]{\quad\text{(#1)}}
\newcommand\bt[1]{\boxed{\text{#1}}}
\newcommand\max[1]{\textbf{ max } \{#1\} }
\newcommand\min[1]{\textbf{ min } \{#1\} }
\newcommand\IF{\textbf{ IF }}
\newcommand\if{\textbf{ if }}
\newcommand\IS{\textbf{ IS }}
\newcommand\is{\textbf{ is }}
\newcommand\but{\textbf{ but }}
\newcommand\however{\textbf{ however }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\IN{\textbf{ IN }}
\newcommand\NOTIN{\textbf{ NOT-IN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\text{ such that }}
\newcommand\hold{\text{ holds }}
\newcommand\lhs{\text{ LHS }}
\newcommand\rhs{\text{ RHS }}
\newcommand\wlg{\text{ Without loss of generality }}
\newcommand\nb{\text{ nota bene }}
\newcommand\analogously{\text{ analogously }}
\newcommand\viceversa{\textbf{ viceversa }}
\newcommand\let{\textbf{ let }}
\newcommand\as{\textbf{ as }}
\newcommand\for{\textbf{ As for }}
\newcommand\select{\textbf{ SELECT }}
\newcommand\m[1]{\mathit{#1}}
\newcommand\+[1]{\mathcal{#1}}
\newcommand\warnning[1]{\colorbox{Blue}{\textcolor{Yellow}{#1}}}
\newcommand\error[1]{\colorbox{Black}{\textcolor{White}{#1}}}
$$

{% endraw %}

## Problem

### Description

給定含有 n 個元素的多重集合 S，每個元素在 S 中出現的次數稱為該元素的重數。多重

集 S 中重數最大的元素稱為眾數。

例如，S={1，2，2，2，3，5}。

多重集 S 的眾數是 2，其重數為 3。 

### Input

輸入數據由文件名為 input.txt 的文本文件提供。

文件的第 1 行多重集 S 中元素個數 n；接下來的 n 行中，每行有一個自然數。

### Output

程序運行結束時，將計算結果輸出到文件 output.txt 中。輸出文件有 2 行，第 1 行給

出眾數，第 2 行是重數

### Sample

input.txt 

6 

1 

2 

2 

2 

3 

5 

output.txt 

2 

3 

## Solution 1 （HashMap）

### Analysis

對於給定多重集合S，可以通過一個O(n)的線性掃描，將集合的所有元素進行計次。

使用HashMap實現的解法容易編寫，也容易處理答案具有多個眾數的情況。

總體需要一次O(n)的線性掃描，以及在完成計數後再一次O(n)的取最大值。

### Source

```java
    public static Pair<Integer, Integer> getMajority(int[] nums, int L, int R) {

        HashMap<Integer, Integer> counter = new HashMap<>();
        for (int num : nums) {
            counter.put(num, counter.getOrDefault(num, 0) + 1);
        }

        int majorityKey = 0xdead;
        int majorityValue = -1;
        for (int key : counter.keySet()) {
            if (counter.get(key) > majorityValue) {
                majorityKey = key;
                majorityValue = counter.get(key);
            }
        }

        return new Pair<>(majorityKey, majorityValue);
    }
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.335700 ms (335700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [47527, 38]
Your     Output: [47527, 38]
Time Cost: 84.643900 ms (84643900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.025400 ms (25400 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.013600 ms (13600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.011000 ms (11000 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.010100 ms (10100 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 lines...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.010300 ms (10300 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 lines...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.026100 ms (26100 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 lines...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.035500 ms (35500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 lines...]
Expected Output: [17, 8]
Your     Output: [17, 8]
Time Cost: 0.128000 ms (128000 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 lines...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 3.114500 ms (3114500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 lines...]
Expected Output: [1507, 11]
Your     Output: [1507, 11]
Time Cost: 9.872700 ms (9872700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 lines...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 26.197800 ms (26197800 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 lines...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 47.612200 ms (47612200 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 46.967400 ms (46967400 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ √ √ √ √ √ 
```

## Solution 2 （Sort + Two-Way Divided）

### Analysis

從直觀來看，眾數是整個數組裏`出現次數最多的元素`，因此眾數元素應當占據原始數組的`絕大部分位置`。更重要地，如果我們對`原始數組`進行`排序`，那麽所有的眾數很顯然應當被`連續地排列在一起`。

所以，我們可以得到眾數在`已排序的原始數組`中的`存在結構`。



假設使用分治法，我們猜測，可以`已排序數組中的眾數`總是可以從`前一半已排序數組中的眾數`和`後一半已排序數組中的眾數`來得到。換句話說，我們希望使用分治法，並且利用`前一半已排序數組的眾數` 和`後一半已排序數組中的眾數`這兩個`子問題的解`來獲得`原問題的解`



為了證明`分治法`對於`已排序數組的求眾數問題`是有效的，我們嘗試歸納所有可能的情況：

#### Cases

##### Case1: 最終解的眾數僅從某一半已排序數組之中產生（該眾數沒有越過分割點）

如 (1 1 1 1 1) (2 2 2 2 3) -> majority = 1, count = 5

`最終解眾數1`只分布僅僅在`前一半的已排序數組`。

對於這種情況，很顯然`後一半的已排序數組`中`產生的眾數`不可能`戰勝``前一半已排序數組`所`產生的眾數`（當然，`後一半數組`的`最優情況`至多只是和`前一半已排序數組`打成`平手`）



`前一半已排序數組`和`後一半已排序數組`打成`平手`的特殊情況：

(1 1 1 1 1) (2 2 2 2 2) 對於這種情況，我們可以`任意`取`其中一半的已排序數組`作為`勝出`（因為這題我們只要得出1個眾數即可，即使輸入數據存在多個眾數）



> 如果 前一半已排序數組中產生的眾數 = 後一半已排序數組中產生的眾數，那麽很明顯沒有任何其他數可以打敗這個眾數，因此這個眾數就是 整個已排序數組的眾數。

```java
        Pair<Integer, Integer> majority1 = getMajority(nums, L, M);
        Pair<Integer, Integer> majority2 = getMajority(nums, M, R);

        if (Objects.equals(majority1.key, majority2.key))
            return new Pair<>(majority1.key, majority1.value + majority2.value);
```



##### Case2: 最終解的眾數來自某一半已排序數組（且該眾數越過分割點）

如 (1 1 1 1 1) (1 2 2 2 3) -> majority = 1, count = 6

和 (1 1 1 1 2) (2 2 2 2 3) -> majority = 2, count = 5

這兩種情況是`對稱的`，我們這裏僅從考慮第前一種情況。



在這一種情況中，由於`最終解的眾數從兩個已排序數組的並集`之中產生。

而且，我們知道在這種情況下，`最終解的眾數的分布`必然要`越過兩個已排序數組數組的邊界`。

也就是說，這種情況的成立條件是：`前一半已排序數組的最後一個元素`=`後一半已排序數組的第一個元素`。對此，我們需要從`中點`開始，從`中點`統計`前後兩個已排序數組`中`眾數最遠可以分布到多遠`。

也就是說，我們`從中點開始`對`整個已排序數組`做`二分查找`，試圖找出`lowerBound`和`upperBound`。

這樣，即可算出`該候選數的出現的次數`=`upperBound`-`lowerBound`



> 請註意，對於這種情況，我們僅僅是通過upperBound-lowerBound來算出處於中點附近的那個數（我們稱為候選數）的出現次數。但是有可能這個 候選數 並不是 整個已排序數組的眾數。
>
> 你可以想象到，這個數只是恰好出現在 中點附近，被分割開。所以我們需要合並它出現的次數，已獲得它在整個已排序數組中正確的出現次數。（但這不意味著這個數就是整個已排序數組的眾數）



```java
            if (majority1.key == nums[M]) {
                int extra = upperBound(nums, M, R, majority1.key) - M;
                majority1.value += extra;
            } else if (majority2.key == nums[M - 1]) {
                int extra = M - lowerBound(nums, L, M, majority2.key) - 1;
                majority2.value += extra;
			}
```



##### Case3: 最終解的眾數來自兩個已排序數組（很顯然該眾數越過分割點）

如：(1 1 1 3 3) (3 3 2 2 2) -> majority = 3, count = 4

對於這種情況，`這整個已排序數組的眾數`並不是`前半個已排序數組所產生的眾數` majority1，也不是`後半個已排序數組所產生的眾數` majority2。

而是，我們在發現`中點兩側的元素值相同時`（很顯然，如果中點兩側的元素值不同，那麽這個元素就不可能通過`聯合`來`打敗` `majority1` 和 `majority2`），則`嘗試檢查`這個`元素`是否能`通過合並前後兩半已排序數組中自己的出現次數`來分別`打敗` `前一半已排序數組所產生的眾數 majority1`和`後一半已排序數組所產生的眾數 majority2`



```java
            if (nums[M - 1] == nums[M]) {
                int lower = lowerBound(nums, L, M, nums[M]);
                int upper = upperBound(nums, M, R, nums[M]);
                int amount = upper - lower - 1;
                Pair<Integer, Integer> majority3 = new Pair<>(nums[M], amount);
                if (majority3.value > majority1.value && majority3.value > majority2.value) {
                    return majority3;
                }
            }
```

### Source

Auxiliary Functions

```java
/**
 * Return the first element that greater than the bound in [L, R)
 * if not found, return array.length
 */
// (1 1 2) -> (1) (1 2) -> lower = 0, upper = 1
// 1 1 2 2 2 2 3
public static int upperBound(int[] nums, int L, int R, int bound) {
    if (nums[R - 1] == bound) return R;
    while (R - L > 1) {
        int M = L + (R - L) / 2;
        if (nums[M] <= bound) L = M;
        else if (nums[M] > bound) R = M;
    }
    return R;
}

/**
 * if not found, return -1
 */
public static int lowerBound(int[] nums, int L, int R, int bound) {
    if (nums[L] == bound) return -1;
    while (R - L > 1) {
        int M = L + (R - L) / 2;
        if (nums[M] < bound) L = M;
        else if (nums[M] >= bound) R = M;
    }
    return L;
}
```

Core

```java
    public static Pair<Integer, Integer> getMajority(int[] nums, int L, int R) {
        // Case1: (1 1 1 1 1) (2 2 2 2 3) -> majority = 1, count = 5
        // Case2: (1 1 1 1 1) (1 2 2 2 3) -> majority = 1, count = 6
        // Case3: (1 1 1 1 2) (2 2 2 2 3) -> majority = 2, count = 5
        // Case4: (1 1 1 3 3) (3 3 2 2 2) -> majority = 3, count = 4

        /* Base Case */
        if (L == R) return new Pair<>(0xdead, 0);
        if (R - L == 1) return new Pair<>(nums[L], 1);

        /* Recursive Case */
        int M = L + (R - L) / 2;
        Pair<Integer, Integer> majority1 = getMajority(nums, L, M);
        Pair<Integer, Integer> majority2 = getMajority(nums, M, R);

        /* Case1: the majority number of 2 parts are the same. */
        if (Objects.equals(majority1.key, majority2.key))
            return new Pair<>(majority1.key, majority1.value + majority2.value);
        else {
            /* Case2, Case3, Case4 */
            if (majority1.key == nums[M]) {
                // Case2
                int extra = upperBound(nums, M, R, majority1.key) - M;
                majority1.value += extra;
            } else if (majority2.key == nums[M - 1]) {
                // Case3
                int extra = M - lowerBound(nums, L, M, majority2.key) - 1;
                majority2.value += extra;
            } else if (nums[M - 1] == nums[M]) {
                // Case4
                int lower = lowerBound(nums, L, M, nums[M]);
                int upper = upperBound(nums, M, R, nums[M]);
                int amount = upper - lower - 1;
//                System.out.println("num = " + nums[M] + " amount = " + amount);
                Pair<Integer, Integer> majority3 = new Pair<>(nums[M], amount);

                // Can we just union and beat majority1 and majority2 ?
                // Be careful, if majority1 or majority2 equals to majority3, we'll choose the latter one.
                // (1 1 2 2) (2 3 3 3 3) -> majority = 3, count = 4
                // (1 1 2 2 2) (2 3 3 3 3) -> majority = 3, count = 4 (majority = 2, count = 4 is also correct)
                if (majority3.value > majority1.value && majority3.value > majority2.value) {
                    return majority3;
                }
            }
            // Just need to compare the majority1 and majority2
            return majority1.value > majority2.value ? majority1 : majority2;
        }
    }
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.290600 ms (290600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [47527, 38]
Your     Output: [49879, 38]
Time Cost: 169.661600 ms (169661600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.003900 ms (3900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.003500 ms (3500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.003400 ms (3400 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [3, 4]
Time Cost: 0.002500 ms (2500 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 lines...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.040600 ms (40600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 lines...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.021600 ms (21600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 lines...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.037600 ms (37600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 lines...]
Expected Output: [17, 8]
Your     Output: [29, 8]
Time Cost: 0.329700 ms (329700 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 lines...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 1.173000 ms (1173000 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 lines...]
Expected Output: [1507, 11]
Your     Output: [13432, 11]
Time Cost: 6.893800 ms (6893800 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 lines...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 46.909500 ms (46909500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 lines...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 103.301900 ms (103301900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 108.699100 ms (108699100 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ × √ √ √ × √ √ √ × √ × √ √ √ 
```

> 註: 部分案例出現Wrong Answer是由於解法僅要求找出1個眾數，所以對重數相同的眾數的選擇是任意的。

### Summary

由於該解法需要對`原始數組`進行`預處理: 排序 `後再進行`分治法`，其效率可能會比較低。（而且遞歸過程中創建對象所消耗的代價較大）

## Solution 3 (Sort + Three-Way Divided)

### Analysis

采用類似QuickSort的方法，但將`原始數組` 先進行`排序`，然後從`中間`進行`劃分`為3個部分：

1. Part1 = {x | x < pivot}
2. Part2 = {x | x = pivot}
3. Part3 = {x | x > pivot}



首先考慮`完整的已排序數組`，取`該數組的中間元素`作為`pivot`，然後分別用`線性掃描`的方式，求出`該pivot元素`的`lowerBound`和`upperBound`，進而求得`該pivot元素的數量`（即Part2，Part2的所有元素均由`同一個元素`，即`pivot元素`組成)

很顯然，如果Part2.size() > Part1.size() && Part2.size() > Part3.size()，那麽`pivot的值就是整個已排序數組所產生的眾數`

否則，眾數有可能`產生自Part1`，也可能`產生自Part2`。因此，我們`分別都`需要`檢查Part1和Part2`，即`遞歸地對這兩部分進行處理`



* 此處采用遞歸的基本原理是：

  * 該問題存在一個平凡問題（即基本問題）：基本問題很簡單，我們可以很容易直觀地解出來。也就是 子問題的整個已排序數組 僅包含1個元素，那麽 該已排序數組所產生的眾數 就只能是這個元素。

  * 我們可以通過合並2個子問題的解來得到原問題的解：這也很容易，我們可以簡單地`檢查`這`Part1, Part2, Part3 三者中哪一個部分`產生的`眾數的重數`是`最大的`

    

> 註：此算法也不考慮處理存在多個重數相等的眾數的情況。如果重數相等，則任取一個。

> 註：該解法和Solution2非常類似，均需要先應排序進行預處理。然後使用分治法劃分子問題，區別在於對子問題的劃分方式不同。Solution2總是采用固定區間大小的二分法進行劃分，而Solution3的劃分區間的大小則更加動態，並且是3劃分的。

### Source

```java
    public static Pair<Integer, Integer> getMajority(int[] nums, int L, int R) {
        /* Base Case */
        // R - L = {0, 1}
        if (R - L <= 1) return new Pair<>(nums[L], 1);

        /* Recursive Case */
        int M = L + (R - L) / 2;
        int M_Value = nums[M];

        int lowerBound = M, upperBound = M;
        while (lowerBound >= 0 && nums[lowerBound] == M_Value) lowerBound--;
        while (upperBound < nums.length && nums[upperBound] == M_Value) upperBound++;

        int M_Count = upperBound - lowerBound - 1;
        Pair<Integer, Integer> majorityMiddle = new Pair<>(M_Value, M_Count);

        // Anyway, Part2 will always win !
        if (M_Count >= (lowerBound - L + 1) && M_Count >= (R - upperBound)) return majorityMiddle;

        // Ok, we should choose the largest one among Part1, Part2 and Part3.
        Pair<Integer, Integer> majorityLeft = getMajority(nums, L, lowerBound + 1);
        Pair<Integer, Integer> majorityRight = getMajority(nums, upperBound, R);
        if (M_Count >= majorityLeft.value && M_Count >= majorityRight.value) return majorityMiddle;
        else return majorityLeft.value > majorityRight.value ? majorityLeft : majorityRight;
    }
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.226700 ms (226700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [47527, 38]
Your     Output: [49879, 38]
Time Cost: 165.034000 ms (165034000 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.003500 ms (3500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.002500 ms (2500 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.003200 ms (3200 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 lines...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.002800 ms (2800 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 lines...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.042700 ms (42700 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 lines...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.024600 ms (24600 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 lines...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.026300 ms (26300 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 lines...]
Expected Output: [17, 8]
Your     Output: [29, 8]
Time Cost: 0.174600 ms (174600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 lines...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 4.243100 ms (4243100 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 lines...]
Expected Output: [1507, 11]
Your     Output: [13432, 11]
Time Cost: 6.618700 ms (6618700 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 lines...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 38.010200 ms (38010200 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 lines...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 73.012900 ms (73012900 ns)
Accepted.
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 lines...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 86.186500 ms (86186500 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ × √ √ √ √ √ √ √ × √ × √ √ √ 
```



## Solution 4 (Three-Way QuickSort)

### Analysis

在前面所提到的 `分治法` 中，都需要對 `原始數組` 進行 `排序` 。

但實際上，我們可以將 `排序` 和 `尋找眾數` 的過程 `同時進行`。

我們之前所提的 `需要預排序的二分法` 和 `需要預排序的三分法` 之所以需要 `排序`，

是因為我們 `某個數字` 可能 `零散地分布` 在 `原始數組` 的 `各個角落`，這將使得 `我們的分治方法` 必須 `把相同的數字` 都 `聚集`在一起，否則將無法 `統計` `該數字的出現次數`。

> 實際上，如果僅僅是為了 `尋找眾數`，我們並不需要使得 `原始數組` 是 `完全地有序的`。
>
> > 當我們發現，`在對某個區間的某個元素` 進行 `3向劃分`之後，`該元素的出現次數` `大於` `該區間的長度的一半`，
> >
> > 那麽顯然，`該元素` 必定就是 `該區間` 的 `眾數`。我們就沒有必要再對 `該區間的其余部分` 繼續進行 `劃分`。

設想，如果對於 `任意給定的數組`，我們可以 `使得該數組中某個數字` 進行 `聚集`，然後求得 `該數字的出現次數`。

那麽，我們可以采用 `摩爾投票法 (Moore Voting Method)` 的思想：

- 如果我們發現，`該數字的出現次數 ` `大於` `其余部分的長度`，則顯然 `該數字` 就是 `眾數`

  > `摩爾投票法` 將 `序列` 分成 `2部分`： `等於指定元素` 和 `不等於指定元素`

- 否則，我們可以對 `剩余的部分` 繼續進行 `聚集數字的操作`

  > 由於我們使用的是 `三向快速排序 (Three-Way QuickSort)`，所以我們的 `劃分函數 (Partition Function)` 會將 `給定的數組` 劃分為3個部分，使得在部分中的任何元素滿足：`x < pivot`，`x = pivot` 和 `x > pivot` 

在對 `指定的數字` 進行 `劃分` 之後，我們可以獲得以下 `信息` ：

- `該數字的出現次數`：$count = upper\_bound - lower\_bound + 1$

- 比 `該數字的出現次數` 少的 `部分`之中，不可能產生 `眾數`。

  > n.b. 在 `Moore Voting Method`中，我們要求 `尋找多數`。
  >
  > > `多數`：在 `序列`中，`出現次數` `超過` `序列的長度的一半` 的 `元素`
  >
  > `摩爾投票法` 並不要求 `原始數組` 是有序的，因為根據 `多數` 的定義，`多數的出現次數` 大於 `其他所有元素出現的次數`，所以我們可以 `確定`。
  >
  > `序列中某個元素的出現次數`如果超過 `序列的長度的一半`，則 `該元素` 必定是 `多數`。
  >
  > > 其實，有另一種求 `多數` 的 `簡單策略`：直接將 `原始序列` 進行 `排序`，然後 `位於序列中間的元素` 就是 `多數`
  >
  > > `Moree Voting Method` 最多需要進行 $\roundup{\frac{3n}{2}} - 2$ 次 `比較操作`。
  > >
  > > 而 `Three-Way Quicksort Method` 在處理 `相等元素` 非常多且選定 `該元素`作為 `基準元素 (pivot)` 的情況下，可以達到 `趨近於線性的復雜度`。
  > >
  > > > 可以通過 `隨機化技術` 來 `透明地` 改變 `基準元素的選取`。
  > > >
  > > > ```java
  > > >          // randomize pivot
  > > >          swap(nums, left_index, random.nextInt(right_index - left_index + 1) + left_index);
  > > > ```
  > > >
  > > > 但根據實際測試，這並不會對本題 `有較好的改善`。
  > > >
  > > > 由於 `眾數的出現次數較多`，相應地 `在指定位置的元素是眾數的概率` 也 `自然` 應當較大。而此時 `隨機化技術` 並沒有 `提高` `選取到眾數的概率`，反而我們還需要付出 `較為昂貴的隨機數生成的代價`。
  > > >
  > > > 然而，對於 `普通的2向快速排序` 和 `普通的3向快速排序`來說，可以認為 `原始數組的元素` 是 `隨機的`，但我們可以用 `隨機化技術` 來避免在 `某些特殊情況下`，選取到 `壞的基準元素`。

### Source

```java
package Lab3;

import util.Judger;

import java.util.Scanner;

/**
 * @author Teeth
 * @date 3/12/2022 07:48
 */
public class MajoritySolver_QuickSort {

    public static class Node {

        public int majority;
        public int count;
        public int left_index;
        public int right_index;
        public int lower_bound;
        public int upper_bound;

        public Node(int majority, int count, int left_index, int right_index, int lower_bound, int upper_bound) {
            this.majority = majority;
            this.count = count;
            this.left_index = left_index;
            this.right_index = right_index;
            this.lower_bound = lower_bound;
            this.upper_bound = upper_bound;
        }

        public Node(int left_index, int right_index) {
            this.left_index = left_index;
            this.right_index = right_index;
        }

    }

    private static final Judger judger = new Judger(".\\Cases\\Lab3\\MAJORITY").disablePrettyFormat().redirectErrorToErrorFile().setMaxExpectInputLines(1);

    public static void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }

    /*
    [left_index..left_bound-1] < majority
    [left_bound..right_bound] = majority
    [right_bound+1..right_index] > majority
    array = 2 2 3 5 3 5 1 2 3 4
     */
    public static Node partition(int[] nums, int left_index, int right_index) {
        int lower_bound = left_index;
        int upper_bound = right_index;
        int i = left_index + 1;

        while (i <= upper_bound) {
            // n.b. we use [lower_bound..upper_bound] to present x = majority
            if (nums[i] < nums[lower_bound]) {
                swap(nums, lower_bound++, i++);
            } else if (nums[i] > nums[lower_bound]) {
                // n.b. index i should not be incremented
                swap(nums, upper_bound--, i);
            } else i++;
        }

        /* Construct node */
        return new Node(nums[lower_bound], upper_bound - lower_bound + 1, left_index, right_index, lower_bound, upper_bound);
    }

    public static Node quickSort(int[] nums, int left_index, int right_index) {

        if (left_index < right_index) {
            Node split = partition(nums, left_index, right_index);
            int majority_nums_count = split.upper_bound - split.lower_bound + 1;
            int left_nums_count = split.lower_bound - split.left_index;
            int right_nums_count = split.right_index - split.upper_bound;

            // n.b. select strategy: non-strict partial order
            // n.b. use MOORE VOTING METHOD here!
            if ((majority_nums_count >= left_nums_count && majority_nums_count >= right_nums_count)) {
                return new Node(nums[split.lower_bound], majority_nums_count, split.left_index, split.right_index, split.lower_bound, split.upper_bound);
            } else {
                Node left_nums_node = quickSort(nums, left_index, split.lower_bound - 1);
                Node right_nums_node = quickSort(nums, split.upper_bound + 1, right_index);

                // n.b. select strategy: non-strict partial order
                Node winner = left_nums_node.count >= right_nums_node.count ? left_nums_node : right_nums_node;
                winner = winner.count >= split.count ? winner : split;
                return winner;
            }
        }

        // empty node
        return new Node(left_index, right_index);
    }

    public static Node getMajority(int[] nums, int begin, int end) {
        return quickSort(nums, begin, end - 1);
    }

    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            // Skip the first line.
            int capacity = scanner.nextInt();

            // Read the numbers.
            int[] nums = new int[capacity];
            for (int i = 0; scanner.hasNextInt(); i++) {
                nums[i] = scanner.nextInt();
            }

            // call the algorithm
            judger.manuallyStartTimer();
            Node node = getMajority(nums, 0, nums.length);
            judger.manuallyStopTimer();

            // Output
            System.out.println(node.majority);
            System.out.println(node.count);
        }
    }
}
```

### Benchmark

```yaml
-----------------------------------------------------
Current Case: MODE1.in & MODE1.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [1, 5]
Your     Output: [1, 5]
Time Cost: 0.045200 ms (45200 ns)
Accepted
-----------------------------------------------------
Current Case: MODE10.in & MODE10.out
Expected  Input: [1234567, Omit the remaining 1234567 line(s)...]
Expected Output: [47527, 38]
Your     Output: [47527, 38]
Time Cost: 104.330000 ms (104330000 ns)
Accepted
-----------------------------------------------------
Current Case: MODE11.in & MODE11.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [1, 6]
Your     Output: [1, 6]
Time Cost: 0.001100 ms (1100 ns)
Accepted
-----------------------------------------------------
Current Case: MODE12.in & MODE12.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [2, 5]
Your     Output: [2, 5]
Time Cost: 0.001000 ms (1000 ns)
Accepted
-----------------------------------------------------
Current Case: MODE13.in & MODE13.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.000901 ms (901 ns)
Accepted
-----------------------------------------------------
Current Case: MODE14.in & MODE14.out
Expected  Input: [10, Omit the remaining 10 line(s)...]
Expected Output: [2, 4]
Your     Output: [2, 4]
Time Cost: 0.001200 ms (1200 ns)
Accepted
-----------------------------------------------------
Current Case: MODE15.in & MODE15.out
Expected  Input: [10, Omit the remaining 9 line(s)...]
Expected Output: [3, 4]
Your     Output: [3, 4]
Time Cost: 0.001101 ms (1101 ns)
Accepted
-----------------------------------------------------
Current Case: MODE2.in & MODE2.out
Expected  Input: [50, Omit the remaining 50 line(s)...]
Expected Output: [3, 8]
Your     Output: [3, 8]
Time Cost: 0.002099 ms (2099 ns)
Accepted
-----------------------------------------------------
Current Case: MODE3.in & MODE3.out
Expected  Input: [100, Omit the remaining 100 line(s)...]
Expected Output: [28, 9]
Your     Output: [28, 9]
Time Cost: 0.004400 ms (4400 ns)
Accepted
-----------------------------------------------------
Current Case: MODE4.in & MODE4.out
Expected  Input: [500, Omit the remaining 500 line(s)...]
Expected Output: [17, 8]
Your     Output: [29, 8]
Time Cost: 0.029600 ms (29600 ns)
Wrong Answer.
-----------------------------------------------------
Current Case: MODE5.in & MODE5.out
Expected  Input: [10000, Omit the remaining 10000 line(s)...]
Expected Output: [152, 11]
Your     Output: [152, 11]
Time Cost: 0.564300 ms (564300 ns)
Accepted
-----------------------------------------------------
Current Case: MODE6.in & MODE6.out
Expected  Input: [50000, Omit the remaining 50000 line(s)...]
Expected Output: [1507, 11]
Your     Output: [1507, 11]
Time Cost: 3.741200 ms (3741200 ns)
Accepted
-----------------------------------------------------
Current Case: MODE7.in & MODE7.out
Expected  Input: [500000, Omit the remaining 500000 line(s)...]
Expected Output: [62872, 23]
Your     Output: [62872, 23]
Time Cost: 37.026301 ms (37026301 ns)
Accepted
-----------------------------------------------------
Current Case: MODE8.in & MODE8.out
Expected  Input: [1000000, Omit the remaining 1000000 line(s)...]
Expected Output: [15875, 34]
Your     Output: [15875, 34]
Time Cost: 71.459100 ms (71459100 ns)
Accepted
-----------------------------------------------------
Current Case: MODE9.in & MODE9.out
Expected  Input: [1234567, Omit the remaining 1234567 line(s)...]
Expected Output: [44678, 42]
Your     Output: [44678, 42]
Time Cost: 83.852201 ms (83852201 ns)
Accepted
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ × √ √ √ √ √ 
```

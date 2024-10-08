---
title: "solve multiple-knapsack problem & pebble merge problem"
date: 2022-04-19 07:53:00
tags:
  - algorithm
  - dynamic_programming
---

# Dynamic Programming Problems

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

## Multiple-Knapsack Problem

### Description

設有 n 種不同面值的硬幣，各硬幣的面值存於數組 T［1:n］中。現要用這些面值的硬
幣來找錢。可以使用的各種面值的硬幣個數存於數組 Coins［1:n］中。
對任意錢數 0≤m≤20001，設計一個用最少硬幣找錢 m 的方法。

### Input

由文件 input.txt 提供輸入數據，文件的第一行中只有 1 個整數給出n 的值,第 2 行起每
行 2 個數，分別是 T[j]和 Coins[j]。最後 1 行是要找的錢數 m。

### Output

程序運行結束時，將計算出的最少硬幣數輸出到文件 output.txt 中。問題無解時輸出-1。

### Sample

**輸入文件示例**

input.txt

3
1 3
2 3
5 3
18

**輸出文件示例**

output.txt

5

### Analysis

#### Analyse the Dimensions & Establish the Recursive Equation

```mermaid
classDiagram
class Knapsack {
 +capacity
}

class Item {
 +value
 +weight
 +amount
}
```

首先，分析出題目中的 `對象 (Object)` 所涉及到的 `屬性 (Attribute)`  有哪些。

我們可以得到：

- 與`物品 (硬幣)`有關的屬性有`面值 (value)`和`數量 (amount)`。

  > 實際上，`物品`還有一個屬性為 `重量 (weight)`。
  >
  > 由於 `優化目標`為 `所需的最少硬幣的數量`，所以可以將 `所有物品的重量`均視為 `單位重量`，
  >
  > 然後 `忽略` 掉這個屬性。

- 與`背包 (需要湊的零錢)`有關的屬性有`容量 (capacity)`

所以，我們可以得到3個 `數據維度 (Dimension)`：`硬幣的面值`，`硬幣的數量`，`需要湊的零錢`，

> `硬幣的數量` 應該算 `2個維度`，加起來總共 `4個維度`

並且，我們可以定義`遞推關系的值`為`所需的最少硬幣數`。

> 這是因為 `所需的最少硬幣數`是 `題目所需求的解`。
>
> > 一般直接將 `遞推關系的值` 定義為 `題目所需要求解的值`，然後進行 `劃分子問題`，
> >
> > 這樣等到 `遞推方程的值`計算完成，我們就可以 `直接`得到 `問題的解`。

---

現在，我們不妨考慮一下，在`最終湊齊零錢`之前發生了什麽？

在`最後一步 (The Final Step)`  ，我們會將`某種面值的硬幣`放入`k枚`，然後滿足`目標容量`。

> n.b. 這裏如果認為：`最後一步` 會將 `某種面值的硬幣` 放入`1枚` 也可以。
>
> 但實際上，`某種面值的硬幣` 可以 `一次性` 地放入 `多枚`，並且效果 `等價於`
>
> `分多次在不同步` 放入 `該種硬幣1枚`

因此，我們可以立即得出下面的`遞推方程`。
$$
\boxed{\t{Just take the final step into consideration}} \\
dp[capacity][type][amount] = 
\lb{
& dp[capacity \r{- (k * values[type])}][type-1][amount \r{+ k}] + \g{k},&(\t{use coins}) \\
& dp[capacity][type-1][amount],&(\t{don't use coins})
}
$$

---

#### Compress the Recursive Equation

到此，我們已經得到了`遞推方程`，但該方程是`4維`的，`時間復雜度` 可能會較大。

> 後面我們會對比 `4維解法` 和 `2維解法` 的 `性能差異`。
>
> 當 `問題規模` 變得 `稍微大一些` 的時候， `4維解法` 的 `時間復雜度` 將無法在 `可接受的時間` 內完成求解。

接下來我們可以考慮，能否`壓縮 (Compress)` `某些維度`來達到`降維優化`的效果。

> 實際上，該 `遞推方程`的 `數量 (amount)`維度存有 `冗余的信息`。

---

關於`每種硬幣的數量限製`，不妨考慮：

如果`每種硬幣`都是`無限的`，那麽我們很確信，`capacity較大的問題的最優解`由`capacity較小的問題的最優解`來`組成`。

>  因為`每種硬幣 `是 `無限的`，我們只需要簡單地把`capacity較小的問題的找零方案`進行`組合`即可。

但是，如果`每種硬幣都是有限的`，如何知道`capacity較大的問題的最優解`是否可以 `直接` 由`capacity較小的問題的最優解`組合得到，而且 `不違反每種硬幣的數量限製`？

換句話說：如果我們需要`湊齊500元`，而`湊齊500元的最優解`由`湊齊200元的最優解`和`湊齊300元的最優解`來`組合`得到。假設，`湊齊200元的最優解`和`湊齊500元的最優解`都用到了`5元硬幣`，則我們如何`確保所使用的5元硬幣的總量符合數量限製`？

這個問題其實依賴於我們的`計算順序`，`湊齊200元的最優解`和`湊齊300元的最優解`並不是`獨立地被計算出來的`。

我們會在`湊齊200元的最優解`的 `基礎上` 進行計算`湊齊300元的最優解`，也就是從`capacity較小的問題`開始計算。

同時，`保證任何時候的湊零錢方式`都符合 `每種硬幣的數量限製`。

也就是說，我們是通過`在capacity較小的問題`的 `基礎 (Base)`之上，`動態地` 計算 `capacity較大的問題的最優解`，

> 換句話說，如果我們在 `capacity較小的問題` 的 `基礎` 之上，求解 `capacity較大的問題`的 `最優解`。
>
> 那麽違反 `數量限製的解` 本質上就是 `非法解`，並不是 `合法解`，更談不上 `最優解`！
>
> 這使得處理 `數量限製`的約束非常容易，我們需要做的僅僅是 `在子問題的基礎之上求解原問題`。
>
> > 即要求我們滿足 `最優子結構 (Optimal Substructure)` 性質

---

關於`每種硬幣的數量限製`，還有一個重要的性質，那就是`湊硬幣的順序是可交換的`。

比如說：

$$
\a{
50 &= 30 + 10 + 10 \\
&= 10 + 30 + 10 \\
&= 10 + 10 + 30
}
$$
也就是`同樣面值的固定數量的硬幣`，按 `任意順序` 放入，最終的 `效果` 是等價的。

> 即 `整數的加法`是 `可交換的`

那麽，也就是說：如果我們要求`湊齊50元硬幣的最優解`，而我們 `擁有一些10元硬幣`，

則我們無需考慮`到底要按照什麽順序放入這些10元硬幣`，而僅僅需要考慮，`到底一次性要放多少枚10元硬幣`才可以得到`湊齊50元硬幣的最優解`。

因此，我們實際上利用 `可交換性`可以`壓縮` 掉 `amount維度`：

由於對於 `某種硬幣`來說， `分多步放入共k枚`和 `在1步就一次性放入k枚`的 `效果`是 `等價的`，

那麽我們不妨就可以 `依次考慮每種類型的硬幣`，並 `確定一次性要放多少枚該種硬幣`。

在已知`正在考慮的硬幣類型`和 `當前需要湊齊的金額`時，我們可以很容易地得出 `當前類型的硬幣的數量`的 `上下界`，

然後依次考慮 `k的所有可能取值`，找出 `原問題的最優解`。

> 如果沒有這樣壓縮，則我們要為`amount維度`的每種可能的來源方式做考慮：
>
> 如果沒有 `可交換性`的話，我們就需要為 `硬幣數量的所有可能來源`做考慮。
>
> 如 5枚 = 0+5 = 1 + 4 = 2 + 3 = 3 + 2 = 4 + 1 = 5 + 0

---

因而，我們可以得到 `壓縮後的遞推方程`。
$$
\boxed{\t{Just take the final step into consideration}} \\
dp[capacity][type] = \lb{
&dp[capacity \r{- (k * values[type])}][type-1]\g{+ k},&(\t{use coins of the current type}) \\
&dp[capacity][type-1],&(\t{don't use coins of the current type})
}
$$
> n.b. 當我們`集中起來一次性考慮每種面額要放多少枚硬幣`時，我們將`非常容易地`實現`對每種面值的硬幣的數量的限製`（只需要通過簡單地取定`當前面值的硬幣`的`循環下限`和`循環上限`即可）
>
> > 同時這也意味著，`每種硬幣的數量是特定的`和`每種硬幣的數量是無限的`這兩種問題本質上是相同的。

### Solution

#### Iterative Method

##### Diagram

```yaml
Expected  Input: [3, 2 3, 3 3, 6 1, 12]
Expected Output: [3]
```

| item\capacity |  0   |     1      |     2      |     3      |     4      |                              5                               |     6      |     7      |     8      |     9      |     10     |     11     |     12     |
| :-----------: | :--: | :--------: | :--------: | :--------: | :--------: | :----------------------------------------------------------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: | :--------: |
|       0       |  0   | 1061109567 | 1061109567 | 1061109567 | 1061109567 |                          1061109567                          | 1061109567 | 1061109567 | 1061109567 | 1061109567 | 1061109567 | 1061109567 | 1061109567 |
|       1       |  0   | 1061109567 |     1      | 1061109567 |     2      |                          1061109567                          |     3      | 1061109567 | 1061109567 | 1061109567 | 1061109567 | 1061109567 | 1061109567 |
|       2       |  0   | 1061109567 |     1      |     1      |     2      |                              2                               |     2      | 1061109567 |     3      |     3      | 1061109567 |     4      | 1061109567 |
|       3       |  0   | 1061109567 |     1      |     1      |     2      | xxxxxxxxxx -----------------------------------------------------Current Case: MODE1.in & MODE1.outExpected  Input: [10, Omit the remaining 10 line(s)...]Expected Output: [1, 5]Your     Output: [1, 5]Time Cost: 0.045200 ms (45200 ns)Accepted-----------------------------------------------------Current Case: MODE10.in & MODE10.outExpected  Input: [1234567, Omit the remaining 1234567 line(s)...]Expected Output: [47527, 38]Your     Output: [47527, 38]Time Cost: 104.330000 ms (104330000 ns)Accepted-----------------------------------------------------Current Case: MODE11.in & MODE11.outExpected  Input: [10, Omit the remaining 10 line(s)...]Expected Output: [1, 6]Your     Output: [1, 6]Time Cost: 0.001100 ms (1100 ns)Accepted-----------------------------------------------------Current Case: MODE12.in & MODE12.outExpected  Input: [10, Omit the remaining 10 line(s)...]Expected Output: [2, 5]Your     Output: [2, 5]Time Cost: 0.001000 ms (1000 ns)Accepted-----------------------------------------------------Current Case: MODE13.in & MODE13.outExpected  Input: [10, Omit the remaining 10 line(s)...]Expected Output: [2, 4]Your     Output: [2, 4]Time Cost: 0.000901 ms (901 ns)Accepted-----------------------------------------------------Current Case: MODE14.in & MODE14.outExpected  Input: [10, Omit the remaining 10 line(s)...]Expected Output: [2, 4]Your     Output: [2, 4]Time Cost: 0.001200 ms (1200 ns)Accepted-----------------------------------------------------Current Case: MODE15.in & MODE15.outExpected  Input: [10, Omit the remaining 9 line(s)...]Expected Output: [3, 4]Your     Output: [3, 4]Time Cost: 0.001101 ms (1101 ns)Accepted-----------------------------------------------------Current Case: MODE2.in & MODE2.outExpected  Input: [50, Omit the remaining 50 line(s)...]Expected Output: [3, 8]Your     Output: [3, 8]Time Cost: 0.002099 ms (2099 ns)Accepted-----------------------------------------------------Current Case: MODE3.in & MODE3.outExpected  Input: [100, Omit the remaining 100 line(s)...]Expected Output: [28, 9]Your     Output: [28, 9]Time Cost: 0.004400 ms (4400 ns)Accepted-----------------------------------------------------Current Case: MODE4.in & MODE4.outExpected  Input: [500, Omit the remaining 500 line(s)...]Expected Output: [17, 8]Your     Output: [29, 8]Time Cost: 0.029600 ms (29600 ns)Wrong Answer.-----------------------------------------------------Current Case: MODE5.in & MODE5.outExpected  Input: [10000, Omit the remaining 10000 line(s)...]Expected Output: [152, 11]Your     Output: [152, 11]Time Cost: 0.564300 ms (564300 ns)Accepted-----------------------------------------------------Current Case: MODE6.in & MODE6.outExpected  Input: [50000, Omit the remaining 50000 line(s)...]Expected Output: [1507, 11]Your     Output: [1507, 11]Time Cost: 3.741200 ms (3741200 ns)Accepted-----------------------------------------------------Current Case: MODE7.in & MODE7.outExpected  Input: [500000, Omit the remaining 500000 line(s)...]Expected Output: [62872, 23]Your     Output: [62872, 23]Time Cost: 37.026301 ms (37026301 ns)Accepted-----------------------------------------------------Current Case: MODE8.in & MODE8.outExpected  Input: [1000000, Omit the remaining 1000000 line(s)...]Expected Output: [15875, 34]Your     Output: [15875, 34]Time Cost: 71.459100 ms (71459100 ns)Accepted-----------------------------------------------------Current Case: MODE9.in & MODE9.outExpected  Input: [1234567, Omit the remaining 1234567 line(s)...]Expected Output: [44678, 42]Your     Output: [44678, 42]Time Cost: 83.852201 ms (83852201 ns)Accepted-----------------------------------------------------Result Statistics: √ √ √ √ √ √ √ √ √ × √ √ √ √ √ yaml |     1      | 1061109567 |     2      |     2      |     3      |     3      |     3      |

##### Source

```java
    public static int solve(int[] values, int[] amounts, int capacity) {
        // define dp array
        int[][] dp = new int[values.length + 1][capacity + 1];

        // init
        for (int i = 0; i <= values.length; i++) {
            dp[i][0] = 0;
        }
        for (int j = 1; j <= capacity; j++) {
            dp[0][j] = 0x3f3f3f3f;
        }

        // only use the first i coins
        for (int i = 1; i <= values.length; i++) {
            int value = values[i - 1];
            // to satisfy j capacity
            for (int j = 1; j <= capacity; j++) {
                // how many coins of this type should be used ?
                for (int k = 0; k <= j / value && k <= amounts[i - 1]; k++) {
                    dp[i][j] = Math.min(dp[i - 1][j], dp[i - 1][j - k * value] + k);
                }
            }
        }

        int ans = dp[values.length][capacity];
        return ans == 0x3f3f3f3f ? -1 : ans;
    }
```

##### Benchmark

```yaml
-----------------------------------------------------
Current Case: COINS0.in & COINS0.out
Expected  Input: [10, 1 0, 2 12, 5 180, 10 0, 20 109, 50 126, 100 192, 200 107, 500 47, 1000 20, 14758]
Expected Output: [21]
Your     Output: [21]
Time Cost: 25.284600 ms (25284600 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS1.in & COINS1.out
Expected  Input: [10, 1 0, 2 12, 5 180, 10 0, 20 109, 50 126, 100 192, 200 107, 500 47, 1000 20, 14758]
Expected Output: [21]
Your     Output: [21]
Time Cost: 16.951400 ms (16951400 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS2.in & COINS2.out
Expected  Input: [10, 1 0, 2 45, 5 0, 10 148, 20 145, 50 136, 100 181, 200 17, 500 172, 1000 152, 16834]
Expected Output: [23]
Your     Output: [23]
Time Cost: 13.734800 ms (13734800 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS3.in & COINS3.out
Expected  Input: [10, 1 0, 2 22, 5 0, 10 27, 20 52, 50 192, 100 164, 200 110, 500 62, 1000 98, 17397]
Expected Output: [-1]
Your     Output: [-1]
Time Cost: 10.814700 ms (10814700 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS4.in & COINS4.out
Expected  Input: [10, 1 0, 2 99, 5 173, 10 11, 20 54, 50 101, 100 6, 200 44, 500 15, 1000 126, 12810]
Expected Output: [16]
Your     Output: [16]
Time Cost: 8.838500 ms (8838500 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS5.in & COINS5.out
Expected  Input: [10, 1 0, 2 133, 5 6, 10 137, 20 196, 50 198, 100 176, 200 0, 500 168, 1000 94, 2253]
Expected Output: [-1]
Your     Output: [-1]
Time Cost: 1.159000 ms (1159000 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS6.in & COINS6.out
Expected  Input: [10, 1 0, 2 0, 5 3, 10 131, 20 24, 50 78, 100 66, 200 84, 500 147, 1000 152, 16423]
Expected Output: [-1]
Your     Output: [-1]
Time Cost: 8.171400 ms (8171400 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ 
```

#### Recursive Method (2-Dimension)

##### Diagram

```yaml
Expected  Input: [3, 2 3, 3 3, 6 1, 12]
Expected Output: [3]
```

```mermaid
graph TD;
root((root)) --#1, 0 * 6--> 47c306e5((12))
47c306e5 --#2, 0 * 3--> 1c2ac852((12))
1c2ac852 --#3, 0 * 2--> a6e0b278((12))
1c2ac852 --#4, 1 * 2--> d03ca462((10))
1c2ac852 --#5, 2 * 2--> 91c93566((8))
1c2ac852 --#6, 3 * 2--> 4180836e((6))
style 4180836e fill: lightgreen,stroke: #333,stroke-width: 4px
47c306e5 --#7, 1 * 3--> 5ecc1041((9))
5ecc1041 --#8, 0 * 2--> b759c285((9))
5ecc1041 --#9, 1 * 2--> 01ecf723((7))
5ecc1041 --#10, 2 * 2--> a3105e86((5))
5ecc1041 --#11, 3 * 2--> 25c25e57((3))
style 25c25e57 fill: lightgreen,stroke: #333,stroke-width: 4px
47c306e5 --#12, 2 * 3--> be869faa((6))
style be869faa fill: lightgreen,stroke: #333,stroke-width: 4px
be869faa --#13, 0 * 2--> 3314f76a((6))
style 3314f76a fill: lightgray,stroke: #333,stroke-width: 4px
be869faa --#14, 1 * 2--> e07a5826((4))
be869faa --#15, 2 * 2--> bdcf5e09((2))
be869faa --#16, 3 * 2--> b6de7abb((0))
style b6de7abb fill: lightgreen,stroke: #333,stroke-width: 4px
47c306e5 --#17, 3 * 3--> 4fd2a78a((3))
style 4fd2a78a fill: lightgreen,stroke: #333,stroke-width: 4px
4fd2a78a --#18, 0 * 2--> 24309338((3))
style 24309338 fill: lightgray,stroke: #333,stroke-width: 4px
4fd2a78a --#19, 1 * 2--> a9927e68((1))
root((root)) --#20, 1 * 6--> 30bd713b((6))
30bd713b --#21, 0 * 3--> 82f6a912((6))
style 82f6a912 fill: lightgray,stroke: #333,stroke-width: 4px
30bd713b --#22, 1 * 3--> a1adc784((3))
style a1adc784 fill: lightgray,stroke: #333,stroke-width: 4px
30bd713b --#23, 2 * 3--> 2bd1ac23((0))
2bd1ac23 --#24, 0 * 2--> 9eccd897((0))
style 9eccd897 fill: lightgray,stroke: #333,stroke-width: 4px

```

##### Source

```java
    static int n;
    static int[] values;
    static int[] amounts;
    static int capacity;
    static int[][] dp;
    static boolean[][] visited;
    static int INF = 0x3f3f3f3f;

    public static int f(int firstCoins, int capacity) {

        /* Base Case */
        if (visited[firstCoins][capacity] || firstCoins == 0) return dp[firstCoins][capacity];
        else visited[firstCoins][capacity] = true;

        /* Recursive Case */
        int value = values[firstCoins - 1];
        for (int k = 0; (k <= capacity / value) && (k <= amounts[firstCoins - 1]); k++) {
            // the following are the same
            // dp[firstCoins][capacity] = Math.min(f(firstCoins - 1, capacity), f(firstCoins - 1, capacity - (k * value)) + k);
            dp[firstCoins][capacity] = Math.min(dp[firstCoins - 1][capacity], f(firstCoins - 1, capacity - (k * value)) + k);
        }

        return dp[firstCoins][capacity];
    }

    public static int solve() {

        // define dp array
        dp = new int[values.length + 1][capacity + 1];
        visited = new boolean[values.length + 1][capacity + 1];

        // init
        for (int i = 0; i <= values.length; i++) {
            for (int j = 0; j <= capacity; j++) {
                dp[i][j] = INF;
            }
        }

        for (int i = 0; i <= values.length; i++) {
            dp[i][0] = 0;
        }
        for (int j = 1; j <= capacity; j++) {
            dp[0][j] = INF;
        }

        // dp
        int ans = f(values.length, capacity);
        return ans == INF ? -1 : ans;
    }

    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            n = scanner.nextInt();
            values = new int[n];
            amounts = new int[n];
            for (int i = 0; i < n; i++) {
                int value = scanner.nextInt();
                int amount = scanner.nextInt();
                values[i] = value;
                amounts[i] = amount;
            }
            capacity = scanner.nextInt();
            judger.manuallyStartTimer();
            System.out.println(solve());
            judger.manuallyStopTimer();
        }
    }
```

##### Benchmark

```yaml
-----------------------------------------------------
Current Case: COINS0.in & COINS0.out
Expected  Input: [10, 1 0, 2 12, 5 180, 10 0, 20 109, 50 126, 100 192, 200 107, 500 47, 1000 20, 14758]
Expected Output: [21]
Your     Output: [21]
Time Cost: 8.383200 ms (8383200 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS1.in & COINS1.out
Expected  Input: [10, 1 0, 2 12, 5 180, 10 0, 20 109, 50 126, 100 192, 200 107, 500 47, 1000 20, 14758]
Expected Output: [21]
Your     Output: [21]
Time Cost: 5.690600 ms (5690600 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS2.in & COINS2.out
Expected  Input: [10, 1 0, 2 45, 5 0, 10 148, 20 145, 50 136, 100 181, 200 17, 500 172, 1000 152, 16834]
Expected Output: [23]
Your     Output: [23]
Time Cost: 6.921800 ms (6921800 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS3.in & COINS3.out
Expected  Input: [10, 1 0, 2 22, 5 0, 10 27, 20 52, 50 192, 100 164, 200 110, 500 62, 1000 98, 17397]
Expected Output: [-1]
Your     Output: [-1]
Time Cost: 1.721700 ms (1721700 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS4.in & COINS4.out
Expected  Input: [10, 1 0, 2 99, 5 173, 10 11, 20 54, 50 101, 100 6, 200 44, 500 15, 1000 126, 12810]
Expected Output: [16]
Your     Output: [16]
Time Cost: 4.294700 ms (4294700 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS5.in & COINS5.out
Expected  Input: [10, 1 0, 2 133, 5 6, 10 137, 20 196, 50 198, 100 176, 200 0, 500 168, 1000 94, 2253]
Expected Output: [-1]
Your     Output: [-1]
Time Cost: 1.258100 ms (1258100 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS6.in & COINS6.out
Expected  Input: [10, 1 0, 2 0, 5 3, 10 131, 20 24, 50 78, 100 66, 200 84, 500 147, 1000 152, 16423]
Expected Output: [-1]
Your     Output: [-1]
Time Cost: 2.296300 ms (2296300 ns)
Accepted.
-----------------------------------------------------
Current Case: COINS7.in & COINS7.out
Expected  Input: [3, 1 1, 2 2, 3 3, 11]
Expected Output: [4]
Your     Output: [4]
Time Cost: 0.092600 ms (92600 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ 
```

#### Recursive Method (4-Dimension)

##### Diagram

```yaml
Expected  Input: [3, 2 3, 3 3, 6 1, 12]
Expected Output: [3]
```

```mermaid
graph TD;
root((root)) --#36, 0 * 6--> a7411865((12))
a7411865 --#37, 0 * 3--> 45b1eb92((12))
45b1eb92 --#38, 0 * 2--> 23c84bd8((12))
style 23c84bd8 fill: lightgray,stroke: #333,stroke-width: 4px
45b1eb92 --#39, 1 * 2--> 3a989a55((10))
style 3a989a55 fill: lightgray,stroke: #333,stroke-width: 4px
45b1eb92 --#40, 2 * 2--> 01f72111((8))
style 01f72111 fill: lightgray,stroke: #333,stroke-width: 4px
45b1eb92 --#41, 3 * 2--> bf018faf((6))
style bf018faf fill: lightgray,stroke: #333,stroke-width: 4px
a7411865 --#42, 1 * 3--> e48ee7e2((9))
e48ee7e2 --#43, 0 * 2--> 4edc439b((9))
style 4edc439b fill: lightgray,stroke: #333,stroke-width: 4px
e48ee7e2 --#44, 1 * 2--> f92a6278((7))
style f92a6278 fill: lightgray,stroke: #333,stroke-width: 4px
e48ee7e2 --#45, 2 * 2--> 1b25d26a((5))
style 1b25d26a fill: lightgray,stroke: #333,stroke-width: 4px
e48ee7e2 --#46, 3 * 2--> 39611a30((3))
style 39611a30 fill: lightgray,stroke: #333,stroke-width: 4px
a7411865 --#47, 2 * 3--> 0abad9d3((6))
0abad9d3 --#48, 0 * 2--> ba8ca012((6))
style ba8ca012 fill: lightgray,stroke: #333,stroke-width: 4px
0abad9d3 --#49, 1 * 2--> 0475bb15((4))
style 0475bb15 fill: lightgray,stroke: #333,stroke-width: 4px
0abad9d3 --#50, 2 * 2--> ea8374c3((2))
style ea8374c3 fill: lightgray,stroke: #333,stroke-width: 4px
0abad9d3 --#51, 3 * 2--> eeff9ef2((0))
style eeff9ef2 fill: lightgray,stroke: #333,stroke-width: 4px
a7411865 --#52, 3 * 3--> fbb80b24((3))
fbb80b24 --#53, 0 * 2--> a96a30bc((3))
style a96a30bc fill: lightgray,stroke: #333,stroke-width: 4px
fbb80b24 --#54, 1 * 2--> fc4ee4be((1))
style fc4ee4be fill: lightgray,stroke: #333,stroke-width: 4px
root((root)) --#55, 1 * 6--> 8c399954((6))
8c399954 --#56, 0 * 3--> 59fdd542((6))
59fdd542 --#57, 0 * 2--> 49d33747((6))
style 49d33747 fill: lightgray,stroke: #333,stroke-width: 4px
59fdd542 --#58, 1 * 2--> 8d975ef6((4))
style 8d975ef6 fill: lightgray,stroke: #333,stroke-width: 4px
59fdd542 --#59, 2 * 2--> 89d23054((2))
style 89d23054 fill: lightgray,stroke: #333,stroke-width: 4px
59fdd542 --#60, 3 * 2--> 1ec22271((0))
style 1ec22271 fill: lightgray,stroke: #333,stroke-width: 4px
8c399954 --#61, 1 * 3--> 4de3015f((3))
4de3015f --#62, 0 * 2--> 010c58d1((3))
style 010c58d1 fill: lightgray,stroke: #333,stroke-width: 4px
4de3015f --#63, 1 * 2--> 951f5029((1))
style 951f5029 fill: lightgray,stroke: #333,stroke-width: 4px
8c399954 --#64, 2 * 3--> ce3992c9((0))
style ce3992c9 fill: lightgray,stroke: #333,stroke-width: 4px

```

##### Source

```java
    static int n;
    static int[] values;
    static int[] amounts;
    static int capacity;
    static int INF = 0x3f3f3f3f;

    public static class Memo {
        private static final ArrayList<Memo> memo = new ArrayList<>();
        public int firstCoins;
        public int capacity;
        public int[] amounts;
        public int value;
        public boolean visited;

        public Memo(int firstCoins, int capacity, int[] amounts, int value, boolean visited) {
            this.firstCoins = firstCoins;
            this.capacity = capacity;
            this.amounts = amounts;
            this.value = value;
            this.visited = visited;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            Memo memo = (Memo) o;
            if (firstCoins != memo.firstCoins) return false;
            if (capacity != memo.capacity) return false;
            return Arrays.equals(amounts, memo.amounts);
        }

        public static void resetMemo() {
            memo.clear();
        }

        public static void set(int firstCoins, int capacity, int[] amounts, int value, boolean visited) {
            int index = memo.indexOf(new Memo(firstCoins, capacity, amounts, value, visited));
            if (index == -1) {
                memo.add(new Memo(firstCoins, capacity, amounts, value, visited));
            } else {
                memo.set(index, new Memo(firstCoins, capacity, amounts, value, visited));
            }
        }

        public static Memo MEMO_ZERO = new Memo(0, 0, null, 0, true);
        public static Memo MEMO_INF = new Memo(0, 0, null, INF, true);

        public static Memo get(int firstCoins, int capacity, int[] amounts) {

            /* Special cases */
            if (capacity == 0) return MEMO_ZERO;
            else if (firstCoins == 0) return MEMO_INF;

            /* Normal cases */
            int index = memo.indexOf(new Memo(firstCoins, capacity, amounts, -1, false));
            if (index == -1) {
                Memo temp = new Memo(firstCoins, capacity, amounts, INF, false);
                memo.add(temp);
                return temp;
            } else return memo.get(index);
        }

    }

    public static int f(int firstCoins, int capacity, int[] amounts) {

        /* Base Case */
        if (Memo.get(firstCoins, capacity, amounts).visited) {
            return Memo.get(firstCoins, capacity, amounts).value;
        }

        /* Recursive Case */
        int value = values[firstCoins - 1];
        for (int k = 0; (k <= capacity / value) && (k <= amounts[firstCoins - 1]); k++) {
            // choice 1
            int do_not_use_current_type_of_coin = Memo.get(firstCoins - 1, capacity, amounts).value;

            // choice 2
            int[] amounts_clone = amounts.clone();
            amounts_clone[firstCoins - 1] -= k;
            int use_current_type_of_coin = f(firstCoins - 1, capacity - (k * value), amounts_clone) + k;

            // optimal choice
            Memo.set(firstCoins, capacity, amounts, Math.min(do_not_use_current_type_of_coin, use_current_type_of_coin), true);
        }

        return Memo.get(firstCoins, capacity, amounts).value;
    }

    public static int solve() {

        // define dp array
        Memo.resetMemo();

        // dp
        int ans = f(values.length, capacity, amounts);
        return ans == INF ? -1 : ans;
    }

    public static void main(String[] args) {
        for (Scanner scanner : judger) {
            n = scanner.nextInt();
            values = new int[n];
            amounts = new int[n];
            for (int i = 0; i < n; i++) {
                int value = scanner.nextInt();
                int amount = scanner.nextInt();
                values[i] = value;
                amounts[i] = amount;
            }
            capacity = scanner.nextInt();
            judger.manuallyStartTimer();
            System.out.println(solve());
            judger.manuallyStopTimer();
        }
    }
```

##### Benchmark

###### Recursive Method with 4-Dimension

```yaml
-----------------------------------------------------
Current Case: COINS7.in & COINS7.out
Expected  Input: [3, 1 1, 2 2, 3 3, 11]
Expected Output: [4]
Your     Output: [4]
Time Cost: 1.000600 ms (1000600 ns)
Accepted
-----------------------------------------------------
Current Case: COINS8.in & COINS8.out
Expected  Input: [3, 2 3, 3 3, 6 1, 12]
Expected Output: [3]
Your     Output: [3]
Time Cost: 0.242400 ms (242400 ns)
Accepted
-----------------------------------------------------
Current Case: COINS9.in & COINS9.out
Expected  Input: [9, 1 1, 2 2, 3 3, 4 4, 5 5, 6 6, 7 7, 8 8, 9 9, 60]
Expected Output: [7]
Your     Output: [7]
Time Cost: 17775.069700 ms (17775069700 ns)
Accepted
-----------------------------------------------------
Result Statistics: √ √ √ 
```

###### Recursive Method with 2-Dimention

```yaml
-----------------------------------------------------
Current Case: COINS7.in & COINS7.out
Expected  Input: [3, 1 1, 2 2, 3 3, 11]
Expected Output: [4]
Your     Output: [4]
Time Cost: 8.181900 ms (8181900 ns)
Accepted
-----------------------------------------------------
Current Case: COINS8.in & COINS8.out
Expected  Input: [3, 2 3, 3 3, 6 1, 12]
Expected Output: [3]
Your     Output: [3]
Time Cost: 3.047300 ms (3047300 ns)
Accepted
-----------------------------------------------------
Current Case: COINS9.in & COINS9.out
Expected  Input: [9, 1 1, 2 2, 3 3, 4 4, 5 5, 6 6, 7 7, 8 8, 9 9, 60]
Expected Output: [7]
Your     Output: [7]
Time Cost: 69.721200 ms (69721200 ns)
Accepted
-----------------------------------------------------
Result Statistics: √ √ √ 
```



## Pebble Merging Problem

### Description

在一個圓形操場的四周擺放著 n 堆石子。現要將石子有次序地合並成一堆。規定每次只
能選相鄰的 2 堆石子合並成新的一堆，並將新的一堆石子數記為該次合並的得分。試設計一
個算法，計算出將 n 堆石子合並成一堆的最小得分和最大得分。

### Input

由文件 input.txt 提供輸入數據。文件的第 1 行是正整數 n，1≤n≤100，表示有 n 堆石子。
第二行有 n 個數，分別表示每堆石子的個數。

### Output

程序運行結束時，將計算結果輸出到文件 output.txt 中。文件的第 1 行中的數是最小得
分；第 2 行中的數是最大得分；。

### Sample

**輸入文件示例**

input.txt

4

4 4 5 9

**輸出文件示例**

output.txt

43

54

### Analysis

我們只考慮`最小得分`，因為 `最小得分` 和 `最大得分` 是`對稱的`。

然後，由於`每次只能合並相鄰的兩堆石子`，所以我們不妨`將所有石子從左到右排成線性的一堆石子`

---

#### Establish the Recursive Equation

我們不妨考慮 `最終 (End)  ` 會發生什麽： `所有的n堆石子` 被合並為 `1堆石子`。

而`最後一步 (The Final Step)`時，我們會將`2堆石子`合並為`1堆石子`。

顯然，我們需要`為此次合並操作`付出的代價為`左邊那一堆石子的重量 + 右邊那一堆石子的重量`

此外，我們還要加上`為了獲得左邊那堆石子的所付出的代價`和`為了獲得右邊那堆石子所付出的代價`

> 註意，這裏面已經隱含了`遞歸`，這相當於，我們在`線性排列的一堆石子裏`：在`第i堆石子`和`第j堆石子`之中，插入了`分隔板`，使之形成`左邊那堆石子（第i堆石子~第k堆石子)` 和`右邊那堆石子 (第k+1堆石子~第j堆石子)`。

因而，我們可以寫出`遞推方程`
$$
\bt{Just take the final step into considetaion} \\
dp[i][j] = \lb {
& \r{dp[i][k]+dp[k+1][j]} \g{+ (sum[j] - sum[i])},&(\t{we find a better plan !}) \\
& dp[i][j],&(\t{not better than current plan})
}
$$

> 其中$sum$表示 `前綴和`

---

#### Determine the order of computation (Iterative Method)

為了 `保證`在  `求解原問題`時，`該原問題所需的所有子問題` 均 `已經求解完畢`，則我們需要 `確定合適的運算順序`。

首先，我們考慮下`合並過程剛開始的時候`：i=1,j=n 即表示考慮 從`第1堆石子`到`第n堆石子`的最少合並代價，

假設`最終這個最優解在第k堆石子處分隔開`：

即可得到`2個子問題`，`從第1堆石子到第k堆石子的最少合並代價`和`從第k+1堆石子到第n堆石子的最少合並代價`。

不妨繼續考慮`從第1堆石子到第k堆石子的最少合並代價`，我們會發現這裏仍然需要 `遞歸` ，直到`基本情況`。

而`基本情況`就是`只有1堆石子的情況`。

所以，通過`分析遞歸過程`得出的`基本情況`，我們`反過來`從`基本情況`逐步建立`叠代形式的運算順序`：即我們從`只有1堆石子的最少合並代價`開始計算，然後計算`只有2堆石子的最少合並代價`，...，計算`只有n堆石子的最少合並代價`。

於是，我們確定了`第一個運算順序：考慮只有[1, n]堆石子的最少合並代價`

接下來，我們需要` 枚舉` `只有len堆石子`到底是 `哪len堆石子` ，由於已經確定了`石子的堆數（即區間長度 len，因為所有石子堆是線性排列的）`。

則我們只需要確定`起始點`即可，於是，我們確定了`第二個運算順序：只有指定堆的石子的起始點為[0,n - len]`

而接下來，我們僅需要對`指定長度的石子堆`進行`確定分割點k`即可。

> 而且由於我們前面的運算順序中，`第一個運算順序`為計算`石子堆的長度`從1~n
>
> 因而，我們在`第三個運算順序`時`確立分割點`時，可以`保證 更小區間長度的石子堆的最小合並代價`是`已經計算好的`

---

綜上，我們確立好了運算順序：

1. 第一個運算順序：區間長度（連續的len個石子堆）
2. 第二個運算順序：區間的起始點（從第i個石子堆開始的連續len個石子堆）
3. 第三個運算順序：分割點（在這個選定的 `石子堆序列` 中，選定 `分割點`，將這個 `石子堆序列` 分為 `左右兩個部分`）

#### Simply use memo (Recursive Method)

在已經得出了 `遞推方程`的情況下，如果不希望 `確定運算順序`，則可以直接使用 `遞歸方法`。

`遞歸方法`可以非常自然地 `描述`  `遞推關系`。

在已知 `最優子結構`的情況下，`動態規劃 (Dynamic Programming)`   和 `暴力法 (Brute-Force)`最大的區別是：

`動態規劃`利用了 `重疊子問題 (Overlapping Subproblem)`性質。

即 `遞歸形式的動態規劃 = 遞歸形式的暴力法 + 備忘錄機製`

> 如果一開始就打算使用`遞歸形式`，那麽`運算順序`就沒有那麽重要了，因為我們總可以`在需要的時候臨時計算`，然後`利用備忘錄機製（這很重要，否則會導致重復地求解相同的子問題）`來保存`某個子問題的計算結果`即可。

> 但相比於 `叠代形式的動態規劃`會 `產生整顆子問題空間樹 (無論某些子問題是否真的被用到)`， `遞歸形式的動態規劃`則只會 `生成那些確實需要用到的子問題`。
>
> 但是，一般來說，`叠代形式的動態規劃`卻會更加快速。
>
> > `編譯器`對於 `叠代算法`可以有更多的信息來進行 `指令級優化`。
> >
> > 同時，`叠代形式`也可以避免過多的 `過程調用的幀棧創建和銷毀的代價`，以及獲得 `更優的高速緩存命中率`
>
> 但通過 `遞歸形式`產生的 `子問題空間樹`是 `「殘缺的」`，在只有 `少量子問題`重復出現的情況下，用 `遞歸形式的動態規劃`會更加高效。

### Solution

#### Iterative Method

##### Diagram

```yaml
Expected  Input: [4, 1 2 3333 2]
Expected Output: [6676, 10010]
```

| i\j  |     0      |     1      |     2      |  3   |
| :--: | :--------: | :--------: | :--------: | :--: |
|  0   |     0      |     3      |    3339    | 6676 |
|  1   | 1061109567 |     0      |    3335    | 6672 |
|  2   | 1061109567 | 1061109567 |     0      | 3335 |
|  3   | 1061109567 | 1061109567 | 1061109567 |  0   |

| i\j  |  0   |  1   |  2   |   3   |
| :--: | :--: | :--: | :--: | :---: |
|  0   |  0   |  3   | 6671 | 10010 |
|  1   |  0   |  0   | 3335 | 6672  |
|  2   |  0   |  0   |  0   | 3335  |
|  3   |  0   |  0   |  0   |   0   |

##### Source

```java
     public static Judger.Pair<Integer, Integer> solve(int n, int[] sum) {

        int[][] dp = new int[n][n];
        int min, max;

        // Min cost
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i == j) dp[i][j] = 0;
                else dp[i][j] = 0x3f3f3f3f;
            }
        }

        for (int len = 1; len < n; len++) {
            for (int i = 0; i < (n - len); i++) {
                int j = i + len;
                for (int k = i; k < j; k++) {
                    dp[i][j] = Math.min(dp[i][j], dp[i][k] + dp[k + 1][j] + (sum[j + 1] - sum[i]));
                }

            }
        }
        min = dp[0][n - 1];

        // Max Cost
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (i == j) dp[i][j] = 0;
                else dp[i][j] = 0;
            }
        }

        for (int len = 1; len < n; len++) {
            for (int i = 0; i < (n - len); i++) {
                int j = i + len;
                for (int k = i; k < j; k++) {
                    dp[i][j] = Math.max(dp[i][j], dp[i][k] + (dp[k + 1][j] + sum[j + 1] - sum[i]));
                }

            }
        }
        max = dp[0][n - 1];

        return new Judger.Pair<>(min, max);
    }

    public static void main(String[] args) {

        for (Scanner scanner : judger) {
            int n = scanner.nextInt();
            int[] a = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = scanner.nextInt();
            }

            // Pre-solve: partial sum
            int[] sum = new int[n + 1];
            sum[0] = 0;
            for (int i = 1; i < sum.length; i++) {
                sum[i] = sum[i - 1] + a[i - 1];
            }

            Judger.Pair<Integer, Integer> answer = solve(n, sum);
            System.out.printf("%d\n%d", answer.getKey(), answer.getValue());
        }
    }
```

##### Benchmark

```yaml
-----------------------------------------------------
Current Case: MERGE0.in & MERGE0.out
Expected  Input: [37, 53 49 2 9 9 30 2 35 1 46 39 46 42 33 13 41 35 57 38 59 15 40 18 6 46 30 53 31 34 57 41 20 1 42 59 46 45 ]
Expected Output: [6186, 25130]
Your     Output: [6186, 25130]
Time Cost: 4.828800 ms (4828800 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE1.in & MERGE1.out
Expected  Input: [4, 1 2 3333 2]
Expected Output: [6676, 10010]
Your     Output: [6676, 10010]
Time Cost: 0.929800 ms (929800 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE2.in & MERGE2.out
Expected  Input: [7, 30 35 15 5 10 20 25]
Expected Output: [370, 580]
Your     Output: [370, 580]
Time Cost: 1.354100 ms (1354100 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE3.in & MERGE3.out
Expected  Input: [7, 3 4 5 6 7 8 9]
Expected Output: [116, 187]
Your     Output: [116, 187]
Time Cost: 1.063500 ms (1063500 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE4.in & MERGE4.out
Expected  Input: [30, 3 4 7 11 13 15 18 21 17 14 7 5 8 10 19 16 13 10 7 5 4 3 4 5 6 3 15 3 10 8 ]
Expected Output: [1342, 5318]
Your     Output: [1342, 5318]
Time Cost: 1.857000 ms (1857000 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE5.in & MERGE5.out
Expected  Input: [4, 1 3 15 2 ]
Expected Output: [42, 59]
Your     Output: [42, 59]
Time Cost: 0.901300 ms (901300 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE6.in & MERGE6.out
Expected  Input: [7, 1 7 6 12 3 15 2 ]
Expected Output: [129, 218]
Your     Output: [129, 218]
Time Cost: 1.066700 ms (1066700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE7.in & MERGE7.out
Expected  Input: [5, 1 1 2 3333 2]
Expected Output: [6680, 13349]
Your     Output: [6680, 13349]
Time Cost: 0.969700 ms (969700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE8.in & MERGE8.out
Expected  Input: [87, 14 27 48 9 8 14 9 29 25 14 8 30 37 37 4 4 3 6 39 40 19 30 22 37 25 17 41 41 7 5 4 3 10 33 12 28 13 18 42 16 16 33 34 45 16 24 15 38 37 28 36 21 27 30 44 33 6 24 20 6 3 27 33 4 46 42 34 46 14 35 36 25 33 8 12 47 18 7 49 16 3 5 43 28 35 5 33 ]
Expected Output: [12799, 96955]
Your     Output: [12799, 96955]
Time Cost: 6.057900 ms (6057900 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE9.in & MERGE9.out
Expected  Input: [20, 1 2 3 4 5 6 7 8 9 10 20 19 18 17 16 15 14 13 12 11 ]
Expected Output: [864, 2850]
Your     Output: [864, 2850]
Time Cost: 1.526400 ms (1526400 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ 
```

#### Recursive Method

##### Diagram

```yaml\
Expected  Input: [4, 1 2 3333 2]
Expected Output: [6676, 10010]
```



```mermaid
graph TD;
style db2871da fill: gray,stroke: #333,stroke-width: 4px
style 984401db fill: lightgreen,stroke: #333,stroke-width: 4px
style 108f3e6e fill: gray,stroke: #333,stroke-width: 4px
style d053e213 fill: lightgreen,stroke: #333,stroke-width: 4px
style 3a08e73b fill: gray,stroke: #333,stroke-width: 4px
style 905d2093 fill: gray,stroke: #333,stroke-width: 4px
d053e213 --#1L, 3333--> 3a08e73b((2..2</br>0))
d053e213 --#1R, 2--> 905d2093((3..3</br>0))
984401db --#2L, 2--> 108f3e6e((1..1</br>0))
984401db --#2R, 3335--> d053e213((2..3</br>3335))
style 9a62f0a0 fill: lightgreen,stroke: #333,stroke-width: 4px
style d33c7169 fill: gray,stroke: #333,stroke-width: 4px
style 64212337 fill: gray,stroke: #333,stroke-width: 4px
9a62f0a0 --#3L, 2--> d33c7169((1..1</br>0))
9a62f0a0 --#3R, 3333--> 64212337((2..2</br>0))
style c78fd6db fill: gray,stroke: #333,stroke-width: 4px
984401db --#4L, 3335--> 9a62f0a0((1..2</br>3335))
984401db --#4R, 2--> c78fd6db((3..3</br>0))
root((root)) --#5L, 1--> db2871da((0..0</br>0))
root((root)) --#5R, 3337--> 984401db((1..3</br>6672))
style 4361b325 fill: lightgreen,stroke: #333,stroke-width: 4px
style 1f5338ec fill: gray,stroke: #333,stroke-width: 4px
style c9c46067 fill: gray,stroke: #333,stroke-width: 4px
4361b325 --#6L, 1--> 1f5338ec((0..0</br>0))
4361b325 --#6R, 2--> c9c46067((1..1</br>0))
style 6b63e09f fill: lightgray,stroke: #333,stroke-width: 4px
root((root)) --#7L, 3--> 4361b325((0..1</br>3))
root((root)) --#7R, 3335--> 6b63e09f((2..3</br>3335))
style 4bd4d793 fill: lightgreen,stroke: #333,stroke-width: 4px
style 2c2b9065 fill: gray,stroke: #333,stroke-width: 4px
style 20a281ee fill: lightgray,stroke: #333,stroke-width: 4px
4bd4d793 --#8L, 1--> 2c2b9065((0..0</br>0))
4bd4d793 --#8R, 3335--> 20a281ee((1..2</br>3335))
style 42941b97 fill: lightgray,stroke: #333,stroke-width: 4px
style 7de997a1 fill: gray,stroke: #333,stroke-width: 4px
4bd4d793 --#9L, 3--> 42941b97((0..1</br>3))
4bd4d793 --#9R, 3333--> 7de997a1((2..2</br>0))
style 5565dbef fill: gray,stroke: #333,stroke-width: 4px
root((root)) --#10L, 3336--> 4bd4d793((0..2</br>3339))
root((root)) --#10R, 2--> 5565dbef((3..3</br>0))
style root fill: lightgreen,stroke: #333,stroke-width: 4px
root((0..3</br>6676))

```

```mermaid
graph TD;
style c39dfc51 fill: gray,stroke: #333,stroke-width: 4px
style 4b5075a2 fill: lightgreen,stroke: #333,stroke-width: 4px
style 9a8edd98 fill: gray,stroke: #333,stroke-width: 4px
style 77669c62 fill: lightgreen,stroke: #333,stroke-width: 4px
style 3525cd7d fill: gray,stroke: #333,stroke-width: 4px
style 27e0a4da fill: gray,stroke: #333,stroke-width: 4px
77669c62 --#11L, 3333--> 3525cd7d((2..2</br>0))
77669c62 --#11R, 2--> 27e0a4da((3..3</br>0))
4b5075a2 --#12L, 2--> 9a8edd98((1..1</br>0))
4b5075a2 --#12R, 3335--> 77669c62((2..3</br>3335))
style cad53082 fill: lightgreen,stroke: #333,stroke-width: 4px
style 5dec4f10 fill: gray,stroke: #333,stroke-width: 4px
style 57160f17 fill: gray,stroke: #333,stroke-width: 4px
cad53082 --#13L, 2--> 5dec4f10((1..1</br>0))
cad53082 --#13R, 3333--> 57160f17((2..2</br>0))
style 43d989e7 fill: gray,stroke: #333,stroke-width: 4px
4b5075a2 --#14L, 3335--> cad53082((1..2</br>3335))
4b5075a2 --#14R, 2--> 43d989e7((3..3</br>0))
root((root)) --#15L, 1--> c39dfc51((0..0</br>0))
root((root)) --#15R, 3337--> 4b5075a2((1..3</br>6672))
style 59f09ba9 fill: lightgreen,stroke: #333,stroke-width: 4px
style ce2df958 fill: gray,stroke: #333,stroke-width: 4px
style 3b1bc123 fill: gray,stroke: #333,stroke-width: 4px
59f09ba9 --#16L, 1--> ce2df958((0..0</br>0))
59f09ba9 --#16R, 2--> 3b1bc123((1..1</br>0))
style 468ac0d5 fill: lightgray,stroke: #333,stroke-width: 4px
root((root)) --#17L, 3--> 59f09ba9((0..1</br>3))
root((root)) --#17R, 3335--> 468ac0d5((2..3</br>3335))
style 41c67309 fill: lightgreen,stroke: #333,stroke-width: 4px
style 62aca470 fill: gray,stroke: #333,stroke-width: 4px
style b51c743b fill: lightgray,stroke: #333,stroke-width: 4px
41c67309 --#18L, 1--> 62aca470((0..0</br>0))
41c67309 --#18R, 3335--> b51c743b((1..2</br>3335))
style 675fda1c fill: lightgray,stroke: #333,stroke-width: 4px
style 7631db1b fill: gray,stroke: #333,stroke-width: 4px
41c67309 --#19L, 3--> 675fda1c((0..1</br>3))
41c67309 --#19R, 3333--> 7631db1b((2..2</br>0))
style c18be7c1 fill: gray,stroke: #333,stroke-width: 4px
root((root)) --#20L, 3336--> 41c67309((0..2</br>6671))
root((root)) --#20R, 2--> c18be7c1((3..3</br>0))
root((0..3</br>10010))
style root fill: lightgreen,stroke: #333,stroke-width: 4px


```

##### Source

```cpp
    static int n;
    static int[] sum;
    static int[][] dp;
    static int INF = 0x3f3f3f3f;

    public static int m(int i, int j) {

        /* Base Case */
        if (dp[i][j] != INF) {
            return dp[i][j];
        }

        /* Recursive Case */
        for (int k = i; k < j; k++) {
            // it's also correct: dp[i][j] = Math.min(m(i, j), m(i, k) + m(k + 1, j) + (sum[j + 1] - sum[i]));
            dp[i][j] = Math.min(dp[i][j], m(i, k) + m(k + 1, j) + (sum[j + 1] - sum[i]));
        }
        return dp[i][j];
    }

    public static int M(int i, int j) {

        /* Base Case */
        if (dp[i][j] != -INF) {
            return dp[i][j];
        }

        /* Recursive Case */
        for (int k = i; k < j; k++) {
            dp[i][j] = Math.max(dp[i][j], M(i, k) + M(k + 1, j) + (sum[j + 1] - sum[i]));
        }
        return dp[i][j];
    }

    public static Judger.Pair<Integer, Integer> solve() {

        dp = new int[n][n];
        int min, max;

        /* Min */
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dp[i][j] = INF;
            }
        }
        for (int i = 0; i < n; i++) {
            dp[i][i] = 0;
        }
        min = m(0, n - 1);

        /* Max */
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                dp[i][j] = -INF;
            }
        }
        for (int i = 0; i < n; i++) {
            dp[i][i] = 0;
        }
        max = M(0, n - 1);

        return new Judger.Pair<>(min, max);
    }

    public static void main(String[] args) {

        for (Scanner scanner : judger) {
            n = scanner.nextInt();
            int[] a = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = scanner.nextInt();
            }

            // Pre-solve: partial sum
            sum = new int[n + 1];
            sum[0] = 0;
            for (int i = 1; i < sum.length; i++) {
                sum[i] = sum[i - 1] + a[i - 1];
            }

            Judger.Pair<Integer, Integer> answer = solve();
            System.out.printf("%d\n%d", answer.getKey(), answer.getValue());
        }
    }
```

##### Benchmark

```yaml
-----------------------------------------------------
Current Case: MERGE0.in & MERGE0.out
Expected  Input: [37, 53 49 2 9 9 30 2 35 1 46 39 46 42 33 13 41 35 57 38 59 15 40 18 6 46 30 53 31 34 57 41 20 1 42 59 46 45 ]
Expected Output: [6186, 25130]
Your     Output: [6186, 25130]
Time Cost: 4.601200 ms (4601200 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE1.in & MERGE1.out
Expected  Input: [4, 1 2 3333 2]
Expected Output: [6676, 10010]
Your     Output: [6676, 10010]
Time Cost: 0.888000 ms (888000 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE2.in & MERGE2.out
Expected  Input: [7, 30 35 15 5 10 20 25]
Expected Output: [370, 580]
Your     Output: [370, 580]
Time Cost: 1.097400 ms (1097400 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE3.in & MERGE3.out
Expected  Input: [7, 3 4 5 6 7 8 9]
Expected Output: [116, 187]
Your     Output: [116, 187]
Time Cost: 1.463500 ms (1463500 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE4.in & MERGE4.out
Expected  Input: [30, 3 4 7 11 13 15 18 21 17 14 7 5 8 10 19 16 13 10 7 5 4 3 4 5 6 3 15 3 10 8 ]
Expected Output: [1342, 5318]
Your     Output: [1342, 5318]
Time Cost: 1.491700 ms (1491700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE5.in & MERGE5.out
Expected  Input: [4, 1 3 15 2 ]
Expected Output: [42, 59]
Your     Output: [42, 59]
Time Cost: 0.847000 ms (847000 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE6.in & MERGE6.out
Expected  Input: [7, 1 7 6 12 3 15 2 ]
Expected Output: [129, 218]
Your     Output: [129, 218]
Time Cost: 0.783500 ms (783500 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE7.in & MERGE7.out
Expected  Input: [5, 1 1 2 3333 2]
Expected Output: [6680, 13349]
Your     Output: [6680, 13349]
Time Cost: 0.795700 ms (795700 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE8.in & MERGE8.out
Expected  Input: [87, 14 27 48 9 8 14 9 29 25 14 8 30 37 37 4 4 3 6 39 40 19 30 22 37 25 17 41 41 7 5 4 3 10 33 12 28 13 18 42 16 16 33 34 45 16 24 15 38 37 28 36 21 27 30 44 33 6 24 20 6 3 27 33 4 46 42 34 46 14 35 36 25 33 8 12 47 18 7 49 16 3 5 43 28 35 5 33 ]
Expected Output: [12799, 96955]
Your     Output: [12799, 96955]
Time Cost: 3.839300 ms (3839300 ns)
Accepted.
-----------------------------------------------------
Current Case: MERGE9.in & MERGE9.out
Expected  Input: [20, 1 2 3 4 5 6 7 8 9 10 20 19 18 17 16 15 14 13 12 11 ]
Expected Output: [864, 2850]
Your     Output: [864, 2850]
Time Cost: 1.105300 ms (1105300 ns)
Accepted.
-----------------------------------------------------
Result Statistics: √ √ √ √ √ √ √ √ √ √ 
```

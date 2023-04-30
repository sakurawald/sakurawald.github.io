# Arrangement and Combination

$$
\newcommand\r[1]{\textcolor{red}{#1}} 
\newcommand\b[1]{\textcolor{blue}{#1}}
$$

## Basic Counting Principles

### The Principle of Addiction

若`集合 S`被`划分`成`两两不相交的部分`$S_1, S_2, \cdots ,S_m$，则`S的对象数目` 可以通过确定`它的每一个部分的对象数目`并如此相加而得到：

$|S| = |S_1| + |S_2| + \cdots +|S_m|$

> `基本的加法原理`仅仅适用于`两两不相交的部分`！

> `加法原理`适合运用的场景是：`所划分出的部分足够少`且`所划分出的部分我们能够进行计数`

### The Principle of Multiplication

令`集合S`是`对象的有序对(a, b)`的集合，其中`第一个对象a`来自`大小为p的一个集合`，而对于`对象a的每一种选择`，`对象b`有`q种选择`。

于是：$|S| = p \times q$

> `乘法原理`是`加法原理`的一个推论：$|S| = |S_1| + |S_2| + \cdots +|S_p| = q + q + \cdots + q = p \times q$

### The Principle of Subtration

若存在`集合A`，`集合U`是`包含集合A的更大集合`。

设$\overline{A} = U \backslash A = \{x \in U: x \notin A\}$是`集合A在集合U中的补 (Complement)`。

那么有：$|A| = |U| - |\overline{A}|$

### The Principle of Division

令`集合S`是一个`有限集合`，把它`划分`成`k个部分`使得`使得每一部分包含的对象数目` `相同`

则，`此划分中的部分的数目`：$k = \frac{|S|}{在一个部分中的对象数目}$



## Set

### Arrangement

#### Definition

若`正整数 r`，则一个`n元素集合的r排列`，我们理解为`n个元素中的r个元素`的`有序放置`。

#### Theory

##### Theory 1

$$
\boxed{\text{The number of r-arrangement of the set of n elements}} \\
\begin{cases}
n, r \in Z^+ \\
r \le n
\end{cases} \implies P(n,r) = n \times (n-1) \times (n-2) \times \cdots \times (n - r + 1)
$$

##### Theory 2

$$
\boxed{\text{The number of cyclic r-arrangement of the set of n elements}} \\
\begin{aligned}
\frac{P(n, r)}{r} = \frac{n!}{(n-r)! \cdot r}
\end{aligned}
$$

### Combination

#### Definition

若`集合S`是`n元素集合`，则`集合S的一个组合`通常表示`集合S的元素的`一个`无序选择`。

这样的一个`选择`的结果是`S的元素构成的一个子集`$A \subseteq S$

> `集合的子集`和`集合的组合`本质上是可以互换的。

$$
\boxed{\text{The number of r-combination of the set of n elements}} \\
\begin{aligned}
0 \le r \le n, P(n, r) = r!\binom{n}{r} \\
\implies \textcolor{blue}{\binom{n}{r} = \frac{n!}{\textcolor{red}{(r!)}(n-r)!}}
\end{aligned}
$$

#### Theory

##### Theory 1

$$
\textcolor{blue}{\binom{n}{r} = 0, r \gt n} \\
\binom{0}{r} = 0, r \gt 0 \\
\textcolor{blue}{\binom{n}{0} = 1, n \ge 0} \\
\binom{n}{1} = n, n \ge 0 \\
\binom{n}{n} = 1, n \ge 0 \\
$$

##### Theory 2

$$
0 \le r \le n, \binom{n}{r} = \binom{n}{n-r}
$$

##### Theory 3

$$
\boxed{\text{Pascal's Theorem}} \\
\begin{aligned}
\begin{cases}
n ,k \in Z^+ \\
1 \le k \le n-1,
\end{cases}
\implies \binom{n}{k} = \binom{n-1}{k} + \binom{n-1}{k-1}
\end{aligned}
$$

---

一种基于`组合学`的证明：

设`集合S`是`n元素集合`，从集合S中任意地选取一个`元素x`。

设`集合X`为`集合S的所有子集的集合`，然后将`集合X`划分为`A`和`B`两部分（即$|X| = |A| + |B|$）：

- A部分：`不包含元素x的k子集`
- B部分：`包含元素x的k子集`

则，$|A| = \binom{n-1}{k}$

> 也就是我们将`元素x`从`集合S`中移除了

且可得$|B| = \binom{n-1}{k-1}$

> `集合B`相当于在`集合A`的基础上，加入了`x元素`。
>
> > 或者理解为：先将`元素x`从`集合S`中拿出，然后在` S\x` 中选取  `k-1子集`，然后再把`集合x`加入到`k-1子集`中，这样即可得到`集合S的包含元素x的k子集`
> >
> > > $S \backslash x = S - \{x\}$

综上，$\binom{n}{k} = |X| = |A| + |B|$

Q.E.D

##### Theory 4

$$
\boxed{\text{The number of subsets of the set of n elements}} \\
\begin{aligned}

|S| = n \implies
\binom{n}{0} + \binom{n}{1} + \binom{n}{2} + \cdots + \binom{n}{n} = 2^n = \mathcal{P}(S)
\end{aligned}
$$

---

使用`双计数技术`可证明该结论：

1. `集合S的r子集个数的求和`
2. `乘法原理`对`集合S的r子集`的`生成过程`

## Multi-Set

### Arrangement

#### Definition

`多重集合S`的一个`r排列`是`S中的r个对象`的一个`有序放置`。

> `r个对象`也包含计数了`重复对象`



#### Theory

##### Theory 1

$$
\boxed{\text{The number of r-arrangement of the multi-set with \textcolor{blue}{infinite} number of objects}} \\
\begin{aligned}
S = \{\infty \cdot a_1, \infty \cdot a_2, \cdots , \infty \cdot a_k\} \implies k^r
\end{aligned}
$$

> 该定理不仅仅适用于`所有元素的重复数均为无限`的情况，只要`没有任何一种元素能被用尽`即可使用该定理。

##### Theory 2

$$
\boxed{\text{The number of \b{(n-)}arrangement of the multi-set with \textcolor{blue}{specific} number of objects}} \\
\begin{aligned}
\begin{cases}
S = \{n_1 \cdot a_1, n_2 \cdot a_2, \cdots , n_k \cdot a_k\} \\
|S| = n = n_1 + n_2 + \cdots + n_k
\end{cases} \implies
\frac{n!}{n_1!n_2!\cdots n_k!}
\end{aligned}
$$

---

- Proof 1

我们知道`拥有n种类型的对象，且每种类型的对象都只有1个的集合S`的`r排列`数量为$n!$

现在，假如`对象`$a_1$有`3个`，则`对象`$a_1$会在`任何一个特定的排列`中`出现3次`，我们`隐含地给对象`$a_1$`加上编号`：$a_1^1, a_1^2, a_1^3$。

则可以知道，`对象`$a_1$`在该特定排列中出现的方式有`$3!$`种`。

但是，实际上，我们知道`对象`$a_1$`是不可区分的`！故我们实际上要`将`$a_1$`所有可能的出现方式`都`视为1种`，即`除以`$a_1$。

同理，对`其余的元素`也这样处理。

Q.E.D

- Proof 2

确定`多重集合的n排列`等价于`在n个位置中的每一个位置放入S中的一个对象`。

我们可以首先考虑`所有的对象`$a_1$，则它有`放置方案`：$\binom{n}{n_1}$

然后，考虑`所有的对象`$a_2$，则它有`放置方案`：$\binom{n-n_1}{n_2}$

如此对`剩下的所有类型对象`进行考虑。得出
$$
\newcommand{\c}[1]{\textcolor{red}{\cancel{#1}}}

\begin{aligned}
&\binom{n}{n_1}\binom{n-n_1}{n_2}\binom{n-n_1-n_2}{n_3}\cdots\binom{n-n_1-n_2-\cdots-n_{k-1}}{n_k} \\ 
&= \frac{n!}{(n_1)!\c{(n-n_1)!}}\frac{\c{(n-n_1)!}}{(n_2)!\c{(n-n_1-n_2)!}}\frac{\c{(n-n_1-n_2)!}}{(n_3)!\c{(n-n_1-n_2-n_3)!}}\cdots\frac{\c{(n-n_1-\cdots-n_{k-1})!}}{(n_k)!(n-n_1-n_2-\cdots-n_k)!} \\
&= \frac{n!}{n_1!n_2!\cdots n_k!}

\end{aligned}
$$

#####  Theory 3

若有`正整数n`使得$n = n_1 + n_2 + \cdots +n_k$。

把`n对象集合` `划分`成`k个标有标签的盒子`，满足约束：`第1个盒子`含有$n_1$`个对象`，`第2个盒子`含有$n_2$`个对象`，...，`第k个盒子`含有$n_k$`个对象`。

则这样的`划分数`为：$\frac{n!}{n_1!n_2!\cdots n_k!}$

如果`这k个盒子不带有标签`且$n_1 = n_2 = \cdots + n_k$，则`划分数`= $\frac{n!}{\r{k!}n_1!n_2!\cdots n_k!}$

> 我们并没有说`第1个盒子`里一定`全部都是对象`$a_1$，这里我们的`n`指代的是`n个对象`，而不是`n个位置`

---

根据$\binom{n}{n-1}\binom{n-n_1}{n_2}\cdots \binom{n-n_1-n_2-\cdots-n_{k-1}}{n_k}$的`组合含义`即可得证。

如果`k个盒子不带有标签`，则意味着`这k个盒子是不区分的` ，所以`划分数`需要再除以`k!`

> 注意：我们说的是`盒子本身 (the box itself)`是`不可区分的 (Indistinguishable)` ，
>
> 但是，`盒子的内容 (the content of the box)`是`可区分的 (Distinguishable)`

##### Theory 4

有`k种颜色共n个车`：`第1种颜色的车`有$n_1$个，`第2种颜色的车`有$n_2$个，...，`第k种颜色的车`有$n_k$个

把这些`车` `放置`到一个`n × n的棋盘`上，使得任何车之间不能`互相攻击`的`方案数`：$\r{n!} \frac{n!}{n_1!n_2!\cdots n_k!} = \frac{\r{(n!)^2}}{n_1!n_2!\cdots n_k!}$

---

我们可以`从上到下逐行地进行放置车`，这样，我们可以`保证没有任何车会被同一行的其他车攻击`（因为我们只会在每一行放置1只车）。

问题则转化为，如何使得`任何车不被同列的其他车攻击到`。

我们分两步：

1. `在棋盘上逐行地放置n个没有颜色的车`：$n!$

   > 这里的`没有颜色的车`说明`车`是`不可区分的`。我们仅仅需要考虑`逐行放置车时不能存在攻击型车`即可，而`不需要考虑颜色`。
   >
   > 
   >
   > 同理，如果`两个车的颜色相同，则它们也是不可区分的`

2. `给棋盘上的n个车进行涂色` = `给含有n个对象，且每个对象有特定重复数的多重集合 求 排列数`：$\frac{n!}{n_1!n_2!\cdots n_k!}$

   > 此时，$\frac{n!}{n_1!n_2!\cdots n_k!}$中的`n`的含义为`n排列中的总共n个位置`，同时也对应着`n个即将要被上色的车`

综上，Q.E.D

> Q: 为什么`不直接求含n元素的多重集合的r排列数`？
>
> A: 因为`求含n元素的多重集合的n排列数`是简单的，但是`求含n元素的多重集合的r排列数`通常比较困难。
>
> 所以我们需要分为`两步`，先`排列无色车的位置`然后再`给所有的无色车进行上色`，这样就只需要求`含n元素的多重集合的n排列数`了。



### Combination

#### Definition

`多重集合S`的`r组合`是`S中的r个对象`的`无序选择`。

> `多重集合S的r组合`本质上也是一个`多重集合`，我们一般称为`多重子集 (Sub Multi-Set)`



#### Theory

##### Theory 1

$$
\boxed{\text{The number of r-combination of the multi-set with \b{infinite} number of \b{each of k kinds of objects} }} \\
\begin{aligned}
S = \{\infty \cdot a_1, \infty \cdot a_2, \cdots, \infty \cdot a_k  \} \implies \r{\binom{r+k-1}{r} = \binom{r+k-1}{k-1}}
\end{aligned}
$$

---

$$
\boxed{\text{Proof}} \\
\begin{aligned}

& S = \{\infty \cdot a_1, \infty \cdot a_2, \cdots, \infty \cdot a_k \} \implies \begin{cases} 
S_r \dot{=} \{x_1 \cdot a_1, x_2 \cdot a_2, \cdots, x_k \cdot a_k\} \subset S \\
x_1, x_2, \cdots, x_n \ge 0
\end{cases} \\

& \mathcal{S}_r \dot{=} \{\text{all } S_r\} \implies \b{|\mathcal{S}_r|} = \text{the number of non-negative integer solutions of equation } \b{x_1 + x_2 + \cdots + x_k = r} \\

& T \dot{=} \{r \cdot \r{1} , (k-1) \cdot \r{separator}\} \implies \begin{aligned}
|\mathcal{S}_r| &= \text{the number of n-arrangement of the multi-set } T \\
&= \frac{(r+k-1)!}{(r!)(k-1!)} = \binom{r+k-1}{r}
\end{aligned}




\end{aligned}
$$

## Finite Probability

### Definition

若一个`实验`$\epsilon$所产生的`结果`属于`有限结果`，则我们称该实验为`有限实验`。



若每一个`结果`都是`等可能的 (Equally Likely)`：则该实验是`随机的 (Randomly)`。

我们称`样本空间 (Sample Space)`$S = \{s_1, s_2, \cdots, s_n\}$ 且$Prob(s_i) = \frac{1}{n} \quad(i = 1,2,\cdots,n)$

我们称`事件 (Event)`就是$E \subseteq S$

我们称`概率 (Probability)`为$Prob(E) = \frac{|E|}{|S|}, \quad 0 \le Prob(E) \le 1$

> `空事件`： $Prob(E) = 0 \implies E = \varnothing$
>
> `样本空间`： $Prob(E) = 1 \implies E = S$

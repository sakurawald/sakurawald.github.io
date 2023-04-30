# Representation and Computation - Integer

## Representation 

### The Representation of Integer

#### Unsigned Integer

$$
\overrightarrow{x} = [x_{w-1},x_{w-2}, \cdots, x_0]:\\
B2U_w(\overrightarrow{x}) \dot{=} \sum_{i=0}^{w-1}{x_i 2^i}
$$

> 这是我们最常见的`整数表示法`，在`进制转换`中经常使用该等式作为`中介`
>
> 由于是`无符号数`，我们并不需要考虑`负整数`的问题，该表示方式建立了一个`二进制位模式`和`十进制非负整数`之间的一个简单的双射：
>
> 因而，我们说`无符号数编码`具有`唯一性`



#### Signed Integer 

##### Tow's Complement Method

$$
\overrightarrow{x} = [x_{w-1},x_{w-1},\cdots,x_0] \\
BTC_w(\overrightarrow{x}) \dot{=}\textcolor{red}{-}x_{w-1}2^{w-1} + \sum_{i=0}^{\textcolor{red}{w-2}}{x_i}2^i
$$

> 大部分的机器采用`补码编码`, 补码的含义为：对于非负整数x，我们使用$2^{w} - x$` 来计算-x的w位表示`

> `补码编码`在`无符号数编码`的基础上，将`二进制位模式的最高位`作为`符号位`，权重为$-2^{w-1}$
>
> > 也可以把`补码编码`看成：将`无符号数编码`的`求和式最后一项 取相反数`从而得到。
>
> 注意到，除了`最高位拥有一个非常大的负权重`之外，`二进制位模式中的其他位的权重均为 正权重`！
>
> > 进而我们可以表示的$最小负数 = UMin_w \dot{=} [10\cdots0] = (1)\times (-2^{w-1})$，$最大正数 = UMax_w \dot{=} [01\cdots111] = \sum_{i=0}^{w-2}{(1)\times2^i}$
> >
> > > 注意这个表示范围，因为$2^{n} - \sum_{i=0}^{n-1}{2^i} = 1 \implies |TMin| = |TMax| + 1$
> > >
> > > 准确地说，`补码编码`是将`整数`划分为`负数`和`非负数`。
> >
> > 同理，`补码编码`也具有`唯一性`
>
> > 此外，我们还发现$UMax_w = 2TMax_w + 1$
> >
> > > 证明：思路是让`等式两边的值相等`。
> > > $$
> > > \begin{aligned}
> > > TMax_w = [01\cdots1] \\
> > > \implies TMax_w + 1 = [10\cdots0] \\
> > > \implies (TMax_w + 1) + TMax_w &= [11\cdots1] \\
> > > &= UMax_w
> > > \end{aligned}
> > > $$
> > > Q.E.D



#####  Ones' Complement

$$
B2O_{w}(\overrightarrow{x}) \dot{=} -x_{w-1}(2^{w-1}\textcolor{red}{- 1}) + \sum_{i=0}^{w-2}{x_i2^i}
$$

> `反码编码`与`补码编码`的区别在于，`反码编码最高位的权重`比`补码编码的最高位权重` `小1`

> 反码表示的含义为：使用`[111...1] - 1`来表示`-x`的反码表示

##### Sign-Magnitude

$$
B2S_w(\overrightarrow{x}) \dot{=} (-1)^{x_{w-1}} \times {\sum_{i=0}^{w-2}{x_i2^i}}
$$

> `原码编码`与`补码编码`虽然都是`由最高位来决定符号`，但`原码编码的最高位`仅仅用于`表示正负`。
>
> 而且，我们注意到后面的$\sum_{i=0}^{w-1}{x_i2^i}$部分`相等`，但由于`对负数的表示方法不同`。
>
> `原码编码的 正整数个数 = 负整数个数`，并且，`我们还发现表示0的位模式有两个： +0 和 -0`
>
> > `多出来的一个0`是由`补码编码中的最小的负整数 的位模式`所得来的。
> >
> > $2^w = \sum_{i=0}^{w-1}{x_i2^i} + 1$



### Coding Conversion

#### T2U

$$
\boxed{T2U}\\
TMin_w \le x\le TMax_w:\\
T2U_w(x) = 
\begin{cases}
x + \textcolor{red}{2^w},& x \lt 0\\
x,& x \ge 0
\end{cases}
$$

---

`补码编码`和`无符号数编码`的区别在于`位模式的最高位的权重`。

因此，需要分情况考虑`x的补码编码表示下的位模式的最高位`：

1. 最高位 = 0：即`x在补码编码下为非负整数，则可以直接转化为 无符号数编码的x`

   >  因为`无符号数编码的非负整数的范围 > 补码编码的非负整数的范围`，所以`当前的非负数必定可以被装下`

2. 最高位 = 1：即`x的补码编码下为负数`，则`在补码编码的表示下，最高位权重为`$-2^{w-1}$，`在无符号数的编码表示下，最高位的权重为`$2^{w-1}$。

   因此，$\Delta weight = 2^{w-1} - (-2^{w-1} = 2 * 2^{w-1} = 2^w)$ 

综上，我们得出结论：$B2U_w(T2B_w(x)) = \textcolor{red}{T2U_w(x) = x + x_{w-1} * 2^{w}}$

> 该结论表明，当`有符号数`(即用`补码编码`)被映射到`无符号数`（即用`无符号正数编码`）时，`负数`会被转化为`大的正数`，而`非负数`保持不变。



#### U2T

$$
\boxed{U2T} \\
0 \le u \le UMax_w:\\
U2T_w(x) = 
\begin{cases}
u,& u \le TMax_w\\
u - \textcolor{red}{2^w},& u > TMax_w
\end{cases}
$$

---

`Unsigned Integer`和`Two's Complement `的区别就在于`位模式的最高位`，而`除了最高的其他w-1位所表示的权重是一样的`

因此，我们仍然需要从`位模式的最高位 的取值情况 来考虑`：

1. $x_{w-1} = 0 \implies u \le TMax_w$：在这种情况下，`无符号数编码`和`补码编码`所表示的含义就是一样的了。

2. $x_{w-1} = 1 \implies u \gt TMax_w$：对于`位模式的最高位为1`的情况。

   > $$
   > \begin{aligned}
   > \Delta{weight} &= 转换后位模式的最高位的权重 - 转换前位模式的最高位的权重 \\
   > &= (-2^{w-1}) - (2^{w-1}) \\
   > &= -2^w
   > \end{aligned}
   > $$

我们可以得出结论：$\textcolor{red}{U2T_w(u) = u -u_{w-1} \times 2^{w}}$

> 与`有符号数`和`无符号数`转换相关的结论：
>
> $UMax_w = 2TMax_w+ 1$
> $$
> \left\{
> \begin{aligned}
> &T2U_w(-1) = T2U_w([11\cdots1]) = -1 + 2^w = UMax_w \\
> &T2U_w(TMin_w) = T2U_w([10\cdots0]) = -2^{w-1} + 2^w = 2^{w-1} = TMax_w + 1
> \end{aligned}
> \right.
> $$

综上，Q.E.D



###  Extend Bit Mode

当在`不同字长的证整数`之间进行`转换`，同时又想`保持数值不变`时。

显然，我们只可能`从较小的数据类型 -> 较大的数据类型`



#### Methods

##### Zero Extension

$$
\boxed{无符号数的零拓展}\\
\left\{
\begin{aligned}
&w \lt w'\\
&\vec{u}=[u_{w-1},u_{w-2},\cdots,u_0]\\
&\vec{u}'=[\textcolor{green}{0,\cdots,0},u_{w-1},u_{w-2},\cdots,u_0]\\
\end{aligned}
\right.
\implies
B2U_w(\vec{u}) = B2U_{w'}{(\vec{u'})}
$$





##### Sign Extension

在需要将`补码数字`转化为`一个更大的数据类型`且`保持数值不变`时，可使用`符号拓展`。

> 也就是说：我们可以将`较小的补码数字表示` `拓展到较大的补码数字表示`并且`保持数值不变`

$$
\boxed{补码数的符号拓展}\\
\left\{
\begin{aligned}
&w \lt w'\\
&\vec{x}=[x_{w-1},x_{w-2},\cdots,x_0]\\
&\vec{x}'=[\textcolor{green}{x_{w-1},\cdots,x_{w-1}},x_{w-1},x_{w-2},\cdots,x_0]
\end{aligned}
\right.
\implies
B2T_w(\vec{x}) = B2T_{w'}(\vec{x}')
$$

---

由于$x_0,\cdots,x_{w-2},x_{w-1}$`的部分在补码编码下的拓展前后的前后的权重 相等`。

故接下来我们只需要证明，我们`为`$\vec{x}'$`拓展的位的权重的累加 = 0`。

但为了证明的简单，我们使用`归纳法`：仅证明`符号拓展了1位的补码编码的数值 不会发生改变`，进而`得出对补码编码符号拓展任意多位，数值也不会改变`



分类讨论$x_{w-1}$的取值

1. $x_{w-1} = 0$：显然成立
2. $x_{w-1} \ne 0$：

$$
\begin{aligned}
\Delta{weight} &= \Delta{weight(x_{w-1})} + \Delta{weight(x_{w-2})}\\
&=  \textcolor{blue}{((2^{w-1}) - (-2^{w-1})) } \textcolor{red}{+(- 2^{w})} \\
&= (2^w) - (2^w)\\
&= 0
\end{aligned}
$$

Q.E.D

> 蓝色部分：先考虑从$\vec{x}$和$\vec{x}'$的$x_{w-1}$，当`位数拓展1位后，拓展前后的第w-1位的含义就不同了`
>
> 红色部分：这部分是多出来的，可以直接相加即可。`第w位的值`为$ x_{w-1}$，权重为$-2^{w}$

> 另一种观点是：$2^w - 2^{w-1} = 2^{w-1}$
>
> 即`加上一个权为-2^w的位` = `将一个权为-2^{w-1}的位 转换为 权为2^{w-1}`
>
> > ​	PROOF
> >
> > 1. 如果权重前的系数=0，则显然成立
> > 2. 如果权重前的系数≠0，则 $((2^{w-1}) - (-2^{w-1})) + (-2^w) = 0$



### Truncate Integer

`截断`发生在`较大的数据类型 -> 较小的数据类型 `

#### Methods

##### Truncate Unsigned Integer

$$
\boxed{截断无符号数}\\
\left\{
\begin{aligned}
&k-1 \lt w-1\\
&\vec{x}=[x_{w-1}, x_{w-2}, \cdots, x_0]\\
&\vec{x}'=[x_{k-1},x_{k-2},\cdots, x_0]\\
\end{aligned}
\right.
\implies
B2U_k(\vec{x}') = B2U_w(\vec{x}) \mod 2^k
$$

---

对于`无符号数编码` ：$i \in N, weight(x_i) = 2^i$

分别计算`等式左侧`和`等式右侧`

$B2U_w(\vec{x}) = \sum_{i=0}^w x_i 2^i$

$B2U_k(\vec{x}') = \sum_{i=0}^{k}{x_i2^i}$  

> `所有被截去的位的重数都是`$2^i, i \ge k$ 因此`这些权在 取模操作 下都变为0`
>
> 也就是说：`取模操作`$\mod 2^k$可以使得$weight(x_i) = 0, i \ge k$

$$

\begin{aligned}
B2U_w([x_{w-1},x_{w-2},\cdots,x_0]) \mod 2^k &= \Bigg(\sum_{i=0}^{w-1}{x_i 2^i}\Bigg) \mod 2^k\\
&= \sum_{i=0}^{k-1}{x_i2^i}\\
&= B2U_k([x_{k-1},x_{k-2}, \cdots, x_0])\\
&= B2U_k(\vec{x}')
\end{aligned}
$$

Q.E.D

##### Truncate Two's Complement Integer

$$
\boxed{截断补码数}\\
\left\{
\begin{aligned}
&k - 1 \lt w - 1 \\
&\vec{x} = [x_{w-1}, x_{w-1}, \cdots, x_0] \\
&\vec{x}' = [x_{k-1}, x_{k-2}, \cdots, x_0]
\end{aligned}
\implies
B2T_k({\vec{x}'}) = U2T_k(B2U_w(\vec{x}) \mod 2^k)
\right.
$$

---

$$
\begin{aligned}
U2T_k(B2U_w(\vec{x}) \textcolor{blue}{\mod 2^k}) &= U2T_k( \sum_{i=0}^{w-1}{x_i2^i} \mod 2^k   ) \\
&=U2T_k(\sum_{i=0}^{k - 1}{x_i2^i})\\
&=U2T_k(B2U_k([x_{k-1},x_{k-2},\cdots,x_0]))\\
&\textcolor{blue}{=U2T_k([x_{k-1},x_{k-2},\cdots,x_0])}\\
&=U2T_k(\vec{x}')
\end{aligned}
$$

> $0 \le x \mod 2^k \le 2^k - 1$ 等效于`将最高有效位`$x_{k-1}$`的权重 从`$2^{k-1}$`转换到`$-2^{k-1}$
>
> > 注：`在对最高位k进行`$\mod 2^k$`操作之前，如果`$x_k = 1$`则我们当然可以 加权`$2^{k-1}$，`但是，在进行 取模操作后，即使`$x_k = 1$`，则在取模运算后，我们加权+0`
> >
> > - 如果$x_k = 0$，那么`权重转换的等效性 显然成立`。
> >
> > - 如果$x_k = 1$，则`在取模运算后，相当于 最高位是废的，本应当加权`$2^{k-1}$`实际却只加权`$+0$。这`等价于我们损失了`$2^{k-1}$`数量的权`（即实际加权为$-2^{k-1}$）

Q.E.D



## Computation



### Unsigned Addition	

$$
\boxed{无符号数加法}\\
0 \le x, y \lt 2^w \\
x \textcolor{blue}{+_w^u} y = 
\begin{cases}
\textcolor{green}{x + y},& x + y \lt 2^w \\
\textcolor{red}{x + y - 2^w},& 2^w \le x + y \lt 2^{w+1}
\end{cases}
$$



如果$sum = x+y \lt 2^w$，则$sum_{w+1} = 0$`该位被丢弃不会影响数值`

如果$sum = x + y \ge 2^w$，则$sum_{w+1} = 1$`该位被丢弃会影响数值`，`丢弃该位最高位`=`数值减少`$2^w$

---

#### Overflow Detection

$$
\boxed{溢出检测}\\
\left\{
\begin{aligned}
&0 \le x, y \le UMax_w \\
&s = x + _w^uy\\
&s \lt x \or s \lt y
\end{aligned}
\iff
overflow
\right.
$$

#### Unsigned for Non

$$
\boxed{无符号数求反}\\
\left\{
\begin{aligned}
&0 \le x \lt 2^w\\
&_w^ux
\end{aligned}
\right.
\implies
\textcolor{blue}{-_w^u}x = 
\begin{cases}
x,& x = 0 \\
2^w - x,& x \gt 0 
\end{cases}
$$

> 注：上面的`-号`并不是`减号`，而是表示`求逆元`

> 根据`模数加法（阿贝尔群 Abelian Group）`：对于$_w^ux \implies \exists -_w^ux, -_w^ux + _w^ux = 0$

---

1. 当x = 0时，`加法逆元`即为`0`
2. 当x > 0时，`考虑`$2^w - x$，有$0 \lt 2^w - x \lt 2^w $且$(x + \textcolor{hotpink}{(2^w - x)}) \mod 2^w = 2^w \mod 2^w = 0$。故$2^w-x$是$_w^u+$下的`加法逆元`

### Tow's Complement Addition

$$
\boxed{\text{补码加法}} \\
\begin{aligned}
&-2^{w-1} \le x, y \le 2^{w-1}-1 \\
&x \textcolor{blue}{+_w^t} y = 
\begin{cases}
\textcolor{red}{x + y -  2^w}, & 2^{w-1} \le x + y &\text{Positive Overflow} \\
\textcolor{green}{x + y} ,& -2^{w-1} \le x + y \lt 2^{w-1} &\text{Normal}\\
\textcolor{red}{x + y + 2^w},& x + y \lt -2^{w-1} &\text{Negative Overflow}
\end{cases}
\end{aligned}
$$

> 上述式子告诉我们，`补码加法`和`无符号加法`之间有`完全相同的位级表示`。
>
> 所以，对于$+_w^t$运算：可以先将参数转化为`无符号数`，执行`无符号加法`，然后再将结果转化为`补码`：
> $$
> \begin{aligned}
> x \textcolor{blue}{+_w^t} y &= U2T_w(T2U_w(x) +_w^u T2U_w(y)) \\
> &= U2T_w[((x + x_{w-1}2^w) + (y + y_{w-1}2^w)) \mod 2^w] \\
> &= U2T_w[(x+y) \mod 2^w]
> \end{aligned}
> $$

---

$$
\begin{aligned}
& z \dot{=} x + y \\
& z' \dot{=} z \mod 2^w \\
& z'' \dot{=} U2T_w(z') = x \textcolor{blue}{+_w^t} y\\

&\left\{
\begin{aligned}
& -2^w \le z \lt -2^{w-1} \implies z' = z + 2^w \implies 0 \le z' \lt -2^{w-1} + 2^w = 2^{w-1} \implies z'' = x + y + 2^w\\
& -2^{w-1} \le z \lt 0 \implies z' = z + 2 \implies -2^{w-1} + 2^w = 2^{w-1} \le z' \lt 2^w \implies z'' = z' - 2^w = z + 2^w-2^w = z \\
& 0 \le z \lt 2^{w-1} \implies z' = z \implies 0 \le z' \lt 2^{w-1} \implies = z'' = z' = z = x + y \\
& 2^{w-1} \le z \lt 2^w \implies z' = z \implies 2^{w-1} \le z' \lt 2^w \implies z'' = z' - 2^w \implies z'' = x+y-2^w
\end{aligned}
\right.
\end{aligned}
$$

![image-20220402193536399](https://s2.loli.net/2022/04/02/x6RhgBImwsWEuLl.png)

​	

#### Overflow Detection for Two's Complement Addition

$$
\boxed{\text{补法加法的溢出检测}} \\
\left\{
\begin{aligned}
&TMin_w \le x, y \le TMax_w \\
&s \dot{=} x +_w^t y \\
&x \lt 0 \and y \lt 0 \\
&s \ge 0
\end{aligned}
\right.
\iff
\text{Negative Overflow}
$$

### Two's Complement for Non

$$
\boxed{\text{补法求非}} \\
\left\{
\begin{aligned}
&TMin_w \le x \le TMax_W \\
&_w^tx
\end{aligned}
\right.
\implies
\textcolor{blue}{-_w^t}x = 
\begin{cases}
TMin_w,& x = TMin_w \\
-x,& x \gt TMin_w
\end{cases}
$$

---

$TMin_w + TMin_w = -2^{w-1} + (-2^{w-1}) = -2^w \implies \text{Negative Overflow}$

$\therefore TMin_w + _w^tTMin_w = -2^w \textcolor{red}{\underbrace{+ 2^w}_{\text{Negative Overflow}}}= 0$

$\because\forall x \gt TMin_w,  -x + x = 0$

Q.E.D

### Unsigned Multiplication

$$
\boxed{\text{无符号数乘法}} \\
\left\{
\begin{aligned}
&0 \le x,y \le UMax_w \\
& _w^ux \\
& _w^uy
\end{aligned}
\right.
\implies
&x * _w^uy = \textcolor{blue}{(x \cdot y) \mod 2^w}
$$

###  Two's Multiplication

对于$-2^{w-1} \le x,y \le 2^{w-1} -1$内的整数x和y可以被表示为`w位的补码数字`。

但$-2^{w-1} \cdot （2^{w-1} - 1) = -2^{w-1} \cdot -2^{w-1} = -2^{2w-2} \implies -2^{2w-2} \le x \cdot _w^ty \le -2^{2w-2}$

对于C语言的有符号数乘法，是`通过将2w位的乘积 截断为 w位`来实现的。
$$
\boxed{\text{补码乘法}} \\
\left\{
\begin{aligned}
& TMin_w \le x, y \le TMax_w \\
& _w^tx \\
& _w^ty
\end{aligned}
\right.
\implies
x * _w^ty = U2T_w(\textcolor{blue}{(x \cdot y) \mod 2^w})
$$

---

`无符号数乘法`和`补法乘法`在`位级表示`具有`等价性`
$$
T2B_w(B2T_w(\vec{x}) * B2T_w(\vec{y})) = U2B_w(B2U_w(\vec{x}) * B2U_w(\vec{y})) \\
$$

> $$
> \boxed{\text{补码乘法和无符号数乘法的等价性}} \\
> \left\{
> \begin{aligned}
> & x \dot{=} B2T_w(\vec{x}) \\
> & y \dot{=} B2T_w(\vec{y}) \\
> & x'\dot{=} B2U_w(\vec{x}') \\
> & y'\dot{=} B2U_w(\vec{y}') \\
> &\begin{aligned}
> \textcolor{blue}{(x' \cdot y')} \mod 2^w &= [\textcolor{blue}{(x + x_{w-1}2^w) \cdot (y + y_{w-1}2^w)}] \mod 2^w \\
> &= [x \cdot y + \textcolor{red}{(x_{w-1}y + y_{w-1}x)2^w + x_{w-1}y_{w-1}2^{2w}}] \mod 2^w\\
> &= (x \cdot y) \mod 2^w
> \end{aligned}
> \end{aligned}
> \right.
> $$
>



### Multiply by  a Constant

$$
\boxed{\text{无符号数乘以2的幂}}\\
\left\{
\begin{aligned}
&_w^ux=[x_{w-1}, x_{w-2}, \cdots, x_0] \\
&k \ge 0
\end{aligned}
\right.
\implies
x2^k = [x_{w-1}, x_{w-2}, x_0,\underbrace{ 0 ,\cdots,0}_{\text{k items}}]
$$

$$
\boxed{\text{与2的幂相乘的无符号乘法: 逻辑左移}}\\
\left\{
\begin{aligned}
&_w^ux \\
&_w^uk \\
&0 \le k \lt w
\end{aligned}
\right.
\implies
x << \textcolor{blue}{k} = x *_w^u \textcolor{blue}{2^k}
$$

$$
\boxed{\text{与2的幂相乘的补码乘法: 逻辑左移}} \\
\left\{
\begin{aligned}
&_w^tx \\
&_w^uk \\
&0 \le k \lt w
\end{aligned}
\right.
\implies
x << \textcolor{blue}{k} = x *_w^t \textcolor{blue}{2^k}
$$

> 无论x是`无符号编码`还是`补码编码`，`移位运算`所产生的结果`与乘法运算`相同。



### Divided by a Constant

$$
\boxed{\text{除以2的幂相除的无符号除法: 逻辑右移}} \\
\left\{
\begin{aligned}
&_w^ux \\
&_w^uk \\
&0 \le k \lt w
\end{aligned}
\right.
\implies
x >> k = \lfloor x / 2^k\rfloor
$$

$$
\boxed{\text{除以2的幂相除的补码除法: 算术右移 (向下舍入)}} \\
\left\{
\begin{aligned}
&_w^tx \\
&_w^uk \\
& 0 \le k \lt w
\end{aligned}
\right.
\implies
x >> k = \lfloor x / 2^k \rfloor
$$

> 上式告诉我们，当`除法运算不需要舍入时`，它的效果和`算术右移`是一样的。
>
> 但若`存在舍入`时将会`向下舍入`，导致`算术右移的结果`与`除法运算`有`偏差`
>
> > 我们可以通过`在移位前进行偏置 (Biasing)`来修复这种偏差。

$$
\boxed{\text{除以2的幂的补码除法: 算术右移 (向上舍入)}} \\
\left\{
\begin{aligned}
&^tx \\
&^uk \\
&0 \le k \lt w
\end{aligned}
\right.
\implies
(x + \textcolor{red}{(1 << k) - 1}) >> k = \lceil x / 2^k \rceil
$$

> 原理：$\lceil x/y \rceil = \lfloor(x\textcolor{blue}{+y-1})/y \rfloor$
>
> 证明
> $$
> \boxed{\text{采用Biasing修复算术右移默认的向下舍入误差}} \\
> \begin{aligned}
> &x \dot{=} qy + r,\quad 0 \le r \lt y \\
> &\implies (x+y-1)/y = q + (r+y-1)/y \\
> &\implies \lfloor (\textcolor{red}{x}+y-1)/y \rfloor = q + \lfloor (\textcolor{red}{r}+y-1)/y\rfloor \\
> &= q + epsilon(r) =
> \begin{cases}
> 0,& r = 0 \\
> 1 ,& r \gt 0
> \end{cases}
> \end{aligned}
> $$
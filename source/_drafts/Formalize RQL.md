---
typora-copy-images-to: image
---

# Formal RQL

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
\newcommand\tb[1]{\text{\textcolor{blue}{#1}}}
\newcommand\lb[1]{\left\{\begin{aligned} #1 \end{aligned}\right.}
\newcommand\lrb[1]{\lb{\rb{#1}}}
\newcommand\rb[1]{\left.\begin{aligned} #1 \end{aligned}\right\}}
\newcommand\env[2]{\begin{#1}#2\end{#1}}
\newcommand\step[1]{\textbf{ (#1) }}

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
\newcommand\do{\textbf{ do }}
\newcommand\dowhile{\textbf{ do while }}
\newcommand\dountil{\textbf{ do until }}
\newcommand\find{\textbf{ find }}
\newcommand\until{\textbf{ until }}
\newcommand\thereisa{\textbf{ There is a }}
\newcommand\thereisan{\textbf{ There is an }}
\newcommand\hasno{\textbf{ has no }}
\newcommand\has{\textbf{ has }}
\newcommand\but{\textbf{ but }}
\newcommand\however{\textbf{ however }}
\newcommand\AND{\textbf{ AND }}
\newcommand\OR{\textbf{ OR }}
\newcommand\NOT{\textbf{ NOT }}
\newcommand\THEN{\textbf{ THEN }}
\newcommand\IN{\textbf{ in }}
\newcommand\NOTIN{\textbf{ NOT-IN }}
\newcommand\assume{\textbf{ Assuming that: }}
\newcommand\contradictory{\textbf{ Thus lead to contradiction }}
\newcommand\proof{\textbf{Proof: }}
\newcommand\st{\textbf{ such that }}
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

$$
\t{Formal Relational Query Language} \lb{
& \t{Procedural} \to \t{Relational Algebra} \\
& \t{Declarative} \lb {
& \t{Tuple Relational Calculus} \\
& \t{Domain Relational Calculus}
}
}
$$

## Relational Algebra

`关系代数` 是一种 `过程化查询语言`，它以 `关系` 作为输入，同时输出 `关系` 。

`关系` 是定义在一组`域` 上的 `笛卡尔积`

### Basic Relational-Algebra

#### Select Operation

`选择 (Select)` $\sigma$ 选出 `满足给定谓词的元组`。
$$
\bt{Select Operation} \\
\sigma_{dept\_name = 'Physics' \and salary \gt 9000}(instructor)
$$

#### Project Operation

`投影 (Project)` $\Pi$ 选出 `指定的属性`
$$
\bt{Project Operation} \\
\Pi_{ID,name,salary}(instructor)
$$

> 由于 `关系` 不允许 `重复元组`，所以 `投影` 运算之后需要再次 `对元组进行去重`

#### Set-Union Operation

$$
\bt{Set-Union Operation} \\
\Pi_{course\_id}(\sigma_{semester = 'Fall' \and year = 2009}(section)) \cup \Pi_{course\_id}(\sigma_{semester='Spring'\and year =2010}(section))
$$

> 参与 `集合运算` 的 `两个关系` 必须是 `相容的 (Compatible)`：
>
> - $r$ 和 $s$ 是 `同元的`，即 `属性数量` 相同
> - 对所有的 `i`，`r的第i个属性的域` 与 `s的第i个属性的域` 要相同。

#### Set-Difference Operation

$$
\bt{Set-Difference Operation} \\
\Pi_{course\_id}(\sigma_{semester='Fall'\and year=2009}(section)) - \Pi_{course\_id}(\sigma_{semester='Srping'\and year = 2010}(section))
$$



#### Cartesian Product Operation

`笛卡尔积` 用于 `组合/串接` 两个 `关系`。

参与 `笛卡尔积` 的两个 `关系` 的 `属性名` 必须 `不同`，当存在 `同名属性 (Common Attribute)` 时，需要添加 `关系名前缀` 用于 `区分`。
$$
\bt{Cartesian Product Operation} \\
\a{
r &= (id, department) \\
s &= (id, salary) \\
r \times s  &=(r.id, s.id, department, salary)
}
$$

> n.b.  $|r \times s| = |r| * |s|$，即 `笛卡尔积` 保留了 `关系r的元组` 和 `关系s元组` 的 `所有可能的串接方式`。
>
> 所得的 `结果关系` 可能有 `某些元组` 是 `不符合` `关系r` 和 `关系s` 所提供的 `信息` 的。
>
> 可以使用下列的 `选择运算` 来 `过滤掉` `这些不符合事实的元组`
> $$
> \r{\sigma_{instructor.ID = teaches.ID}}(\sigma_{dept\_name = 'Physics'}(\b{instructor \times teaches}))
> $$

#### Renaming Operation

`更名 (Rename)` $\rho$ 用于为 `关系代数表达式` 提供 `可供后续进行引用的标识符`。

---

考虑 `查询最高工资` 的例子。
$$
\bt{Rename Operation} \\
\Pi_{salary}(instructor) - \underbrace{\Pi_{instructor.salary}(\sigma_{instructor.salary < \r{d.salary}}(instructor \times \r{\rho_d(instructor)}))}_{\t{Non-maximum wage}}
$$

---

任何 `更名运算` 都是 `可替代的`。可以使用 `位置标记` 来 `隐含地` `引用 ` `关系的属性`。如 `$1 = 第1个属性`

前面的例子可以 `改写` 为
$$
\Pi_{salary}(instructor) - \Pi_{$4}(\sigma_{$4 \lt $8}(instructor \times instructor))
$$

### Additional Relational-Algebra

所有的 `附加关系代数运算` 都可以用 `基本关系运算` 来 `描述`。

#### Set-Intersection Operation

$$
\bt{Set-Intersection Operation} \\
r \cap s = r - (r - s)
$$

---

$$
\bt{Set-Intersection Operation} \\
\Pi_{course\_id}(\sigma_{semester='Fall'\and year = 2009}(section)) \cap \Pi_{course\_id}(\sigma_{semester='Spring'\and year = 2010}(section))
$$

#### Natural-Join Operation

`自然连接`  $\Join$ 是 `笛卡尔积` 和  `选择` 的一种 `合并`。
$$
\bt{Natural-Join Operation}
\lb{
& R, S \t{ is the attribute-set of } r,s \\
& R\cap S = \s{A_1, A_2, \cdots, A_n} \\
& r \Join s = \Pi_{R \cup S}(\sigma_{r.A_1 = s.A_1 \and r.A_2 = s.A_2 \cdots r.A_n = s.A_n}(r\times s))
}
$$

> 当 `两个关系` 不存在 `相同属性` 时， $r \Join s = r \times s$

> `自然连接` 只不过是 `Theta连接` 的一个 `特例`
> $$
> \bt{Theta-Join Operation} \\
> r \Join_\theta s = \sigma_{\theta}(r \times s)
> $$
> 我们经常需要 `笛卡尔积` 和 `选择`  一起使用，那么可以转而使用 `Theta连接` 来 `简化书写`

---

$$
\bt{Natural-Join Operation} \\
\Pi_{name, title}(\sigma_{dept\_name = 'Comp. Sci'}(instructor \Join teaches \Join course))
$$

> `自然连接` 满足 `结合律`。

#### Assignment Operation

`赋值运算` $\gets$ 用于将 `关系代数表达式` 存储为 `常量`，以便后续的 `引用` 。

> 这非常类似于 `PL的赋值`

$$
\bt{Assignment Operation} \\
\a{
& temp1 \gets R \times S \\
& temp2 \gets \sigma_{r.A_1 = s.A_1, r.A_2 = s.A_2, \cdots, r.A_n = s.A_n}(temp1) \\
& result = \Pi_{R\cup S}(temp2)
}
$$

>  n.b. `赋值运算` 必须 `赋值` 给 `临时变量`，而不能直接 `赋值` 给 `永久关系`，否则将造成对 `数据库的修改`。

#### Outer-Join Operation

`外连接运算` 可以处理 `缺失的信息`。

共有3种类型：

- `左外连接` $\sqsupset \Join$
- `右外连接` $\Join \sqsubset$
- `全外连接` $\sqsupset \Join \sqsubset$

$$
\bt{Left-Outer-Join Operation} \\
\a{
S - R = \s{(null, null, \cdots, null)} \\
(r \Join s) \cup (\r{r} - \r{\Pi_{R}}(r \Join s)) \times \s{(null,null,\cdots,null)}
}
$$

### Extended Relational-Algebra

不同于 `附加关系代数`，`拓展关系代数` 不能用 `基本关系代数` 来 `描述`。

#### Generalized-Project

`广义投影 (Generalized Project)`：可以对 `投影的属性` 进行 `常量运算`
$$
\bt{Generalized-Project Operation} \\
\Pi_{ID,name, dept\_name,\r{salary/12}}(instructor)
$$

#### Aggregate

`聚集运算 (Aggregate Operation)` 的输入是 `值的集合`，输出 `单个值`。
$$
\bt{Aggregate Operation} \\
\b{_{G_1,G_2,\cdots,G_n}}\+G\r{_{F_1(A_1), F_2(A_2),\cdots, F_m(A_n)}}
$$

---

$$
\bt{Aggregate Operation}\\
\+G_{average(salary)} (instructor) \\
\r{_{dept\_name}}\+G_{average(salary)} (instructor)
$$

上面例子给出 `查询所有系的教师的平局工资` 和 `查询每个系的教师的平均工资` 的例子。

> 当 `省略左侧分组` 时，默认为：将 `输入关系的所有元组` `分组` 为 `唯一的一组`

## Tuple Relational Calculus

#### Definition

`元组关系演算` 的 `形式` 如下：$\s{t | P(t)}$

其中 $P$ 为 `公式`。`公式` 中出现的 `变量` 分为 `自由变量` 和 `受限变量`。

`公式` 由 如下的 `原子` `构成`：

- $t \in r$

  > $\notin$ 运算符未定义

- $t_1[x] \Theta t_2[y]$

  > $\Theta$ 为 `5个比较运算符`

- $t[x] \Theta c$



`公式` 可以由 如下的 `规则` 来 `构造`：

- `原子` 是 `公式`
- 如果 $P_1$ 是 `公式`，则 $\neg P_1$ 和 $(P_1) $ 也是 `公式`
- 如果 $P_1$ 和 $P_2$ 是 `公式`，则 $P_1 \or P_2$ ，$P_1 \and P_2$ 以及 $P_1 \implies P_2$ 均是 `公式`
- 如果 $P_1(t)$ 是包含 `自由元组变量` $t$ 的 `公式`，且 $r$ 是 `关系`，则 $\exists t \in r(P_1(t))$ 和 $\forall t \in r (P_1(t))$ 也是 `公式`



#### Example

- 查询 `2009年秋季学期` 或 `2010年春季学期` 这两个学期 `都开设` 的 `所有课程的集合`

$$
\a{
\s{t|\exists s \in section(t[course\_id] = s[course\_id]) \b\and s[semester] = 'Fall' \and s[year] = 2009 \\
\r{\or} \exists u \in section(u[course\_id] = t[course\_id]) \b\and u[semester] = 'Srping' \and u[year] = 2010
}
}
$$

- 查询 `所有选修了生物系的全部课程的学生`

$$
\a{
\s{
&t | \r{\exists r \in students(r[ID] = t[ID])} \\ 
& \b\and \g\forall u \in course(u[dept\_name] = 'Biology') \b\implies \exists s \in takes(t[ID] = s[ID]) \b\and s[course\_id] = u[course\_id]
}
}
$$

> n.b. `红色部分` 可以正确处理 `当生物系没有开设任何课程` 的情况



#### Expression Security

考虑如下的 `元组关系表达式`
$$
\s{t | \r\neg(t \in instructor)}
$$
我们称 `该表达式` 是 `不安全的表达式`。原因在于：`neg`  会产生 `无限的结果`。

进一步地，这是因为我们并没有事先定义 $instructor$ 的 `取值范围`。

---

为了解决上述问题，我们引入 `域 (Domain)` 的概念：

`公式` $P$ 的 `域` $dom(P)$ 用于描述 $P$ `所引用的所有值的集合`：

- $P$ 自身所用到的值
- $P$ 中涉及的关系的元组中所出现的值

> 即：`P的域` = `P中显式出现的值` +`名称出现在P中的那些关系的所有值`

---

如果 `元组关系表达式` $\s{t | P(t)}$ `结果中的所有值` 均来自 $dom(P)$，则称该表达式是 `安全的`。

> `安全的表达式` 必定包含 `有限个结果`

## Domain Relational Calculus

### Definition

 `域关系演算` 的 `形式` 如下：$\s{<x_1,x_2,\cdots,x_n> |  P(x_1,x_2,\cdots,x_n)}$

`域关系演算 ` 由 如下的 `原子` `构成`：

- $<x_1,x_2,\cdots,x_n> \in r$ 
- $x \Theta y$
- $x \Theta c$

> `公式` 的 `构造规则` 类比 `元组关系演算`。

### Example

- 找出 `工资在80000美元以上` 的教师的信息

$$
|<i,n,d,s> | <i,n,d,s> \in instructor \r\and s \gt 80000|
$$

- 查询 `2009年秋季学期` 或 `2010年春季学期` 这两个学期 `都开设` 的 `所有课程的集合`

$$
\a{
& |<c> | \exists a,s,y,b,r,t(<c,a,s,y,b,r,t> \in section \b\and s = 'Fall' \b\and y = '2009')  \\
& \r\and \exists a,s,y,b,r,t(<c,a,s,y,b,r,t> \in section \b\and s = 'Srping' \b\and y='2010')
|
}
$$

- 查询 `所有选修了生物系的全部课程的学生`

$$
\a{|
& <\r{i}> | \exists n,d,tc(<\r{i},n,d,tc> \in student) \\
& \b\and \g\forall ci,ti,dn,cr(<ci,ti,dn,cr> \in course)  \b\and dn = 'Biology' \implies \exists si,se,y,g(<\r{i},ci,si,se,y,g> \in takes)

|}
$$

### Expression Security

我们使用与 `元组关系演算` 同样的策略来解决 `表达式安全性问题`：引入 `域` 的概念

> 下面几种 `语言` 在 `表达能力` 上是 `等价的`：
>
> - `基本关系代数`
> - `安全的元组关系演算`
> - `安全的域关系演算`
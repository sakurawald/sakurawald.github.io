---
title: "database elementary sql"
date: 2022-04-28 19:55:00
tags:
  - database
---

# Elementary SQL

## Primitive Type

| Primitive Type                      | Description                           |
| ----------------------------------- | ------------------------------------- |
| $char(n), character(n)$             | `固定長度的字符串`，`固定長度` 為 n   |
| $varchar(n), character\ varying(n)$ | `可變長度的字符串`，`最大長度` 為 n   |
| $int, integer$                      | `整數類型`                            |
| $smallint$                          | `小整數類型`                          |
| $numeric(p,d)$                      | `定點數類型`：$numeric(3,1) \to 44.5$ |
| $real, double\ precision$           | `浮點數` 和 `雙精度浮點數`            |
| $float(n)$                          | `精度至少為n位的浮點數`               |

> `空值 (null)`：任何 `數據類型` 都可能包含 `空值`。`空值` 表達語義 `缺失的值`。

> 對於使用 `char` 類型存放的 `字符串`，會自動執行 `末尾補空格` 策略。 
>
> 但請註意，當我們使用 `char` 和 `varchar` 進行 `相等性測試`時，`行為` 將是 `未定義的`，某些實現可能會 `自動為varchar在末尾補空格`。
>
> 出於這點考慮，建議 `永遠只使用varchar`

## Define a Database Pattern

### General Form

```sql
CREATE TABLE r
(Attribute1 Domain1,
 Attribute2 Domain2,
 ...,
 Attributen Domainn,
 <Integrity Constraint>,
 ...,
 <Integrity Constraint>);
```

> `域 (Domain)` ：用於指定 `與域相關聯的屬性` 的 `數據類型` 以及 `約束`

### Example

```sql
CREATE TABLE teaches(
id varchar(5),
course_id varchar(8),
section_id varchar(8),
semester varchar(6),
year numeric(4,0),
PRIMARY KEY (id, course_id, section_id, semester, year),
FOREIGN KEY (course_id, section_id, semester, year) REFERENCES section,
FOREIGN KEY (id) REFERENCES instructor    
);
```

## Basic DML

### Insert

```sql
INSERT INTO instructor VALUES (10211, 'Smith', 'Biology', 66000);
```

#### Delete

- Delete a `Relationship`

```sql
DROP TABLE r;
```

- Delete `Tuple`

```sql
DELETE FROM student;
```

> 可以使用 `DELETE FROM r`來刪除 `關系中的所有元組`，但 `保留關系的模式定義` 

#### Alter

```sql
ALTER TABLE r ADD attribute domain;
```

```sql
ALTER TABLE r DROP attribute;
```

> 某些 `數據庫` 僅僅支持 `刪除整個關系` ，而不支持 `刪除關系中的某個屬性`。

## Basic Structure

`SQL` 的 `基本查詢` 由 `SELECT`，`FROM`，`WHERE` 三大 `子句` 所構成。



### Single-Relation query

```sql
SELECT name
FROM instructor;
```

> `數學` 上的 `關系` 本質是 `集合`，不允許 `重復元素`。
>
> 但 `維護元素的唯一性` 的 `代價` 非常大，在 `數據庫` 中則是 `允許關系中的元素發生重復` 
>
> > - `all`  和 `distinct`
> >
> > 對於 `SELECT` 來說，`去重選項` 默認為 `ALL` 即表示 `不去重`。
> >
> > ```sql
> > SELECT ALL dept_name
> > FROM instructor;
> > ```
> >
> > 也可以手動指定為 `distinct` 表示需要進行 `去重`
> >
> > ```sql
> > SELECT DISTINCT dept_name
> > FROM instructor;
> > ```

使用 `WHERE子句` 可以從 `FROM子句的結果關系` 中 `篩選` 出 `使得謂詞為True的元組`

```sql
SELECT name
FROM instructor
WHERE deptname  'Comp.Sci.' AND salary > 70000;
```

###  Multi-Relation query

#### General Form

`多表查詢` 的 `通用格式` 

```sql
SELECT attribute1, attribute2, ..., attributen
FROM r1, r2, ..., rn
WHERE P;
```

其中，每種 `子句` 的作用如下：

- `SELECT子句`：從 `WHERE子句給出的元組` 中 `投影` 指定的 `屬性列表`
- `FROM子句`：給出 `作為數據輸入的` 的 `關系列表`
- `WHERE子句`：`過濾出` 使得 `謂詞` 為 `True` 的 `FROM子句中的元組` 

> `數據庫` 執行 `查詢` 的 `順序` 與 `書寫順序` 不太一樣：$FROM \to WHERE \to SELECT$
>
> 可以將 `SELECT子句` 看作是一種 `語言學方面的結構提前`，這種 `形式提前` 有利於我們 `快速地了解輸出的結構是什麽`

> `WHERE子句` 的 `默認值` 為 `WHERE true`

> `FROM子句` 會為 `關系列表` 中的 `所有關系` 都進行 `笛卡爾積運算`，通常會產生一個 `非常巨大的結果關系`
>
> > 實際上，大部分情況下並不會真的 `生成` `關系列表中所有關系的笛卡爾積`。
> >
> > 因為 `查詢優化器` 會 `事先過濾`掉 `大部分不可能滿足WHERE子句的元組`，使得 `FROM子句` 輸出的 `結果關系` 規模 `大幅度減小` 
>
> 對於 `FROM instructor, department` 來說，就是對 `instructor關系` 和 `department關系` 進行 `笛卡爾積` 作為 `結果關系`



#### Match Condition Specified by Where Clause

通過 `Where子句` 指定 `匹配條件`

```sql
SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches.ID;
```

> 當 `屬性名` 僅出現在 `FROM子句所指定的關系` 的 `一個關系` 中時，可以省略掉 `屬性名的全限定前綴`。
>
> 當然，`總是為屬性名寫上關系名前綴` 是沒有錯的。 

>  n.b. 上述的 `匹配條件` 並不會查詢出 `沒有教授任何課程的教師`。
>
>  如果期望顯示出這些教師，則應當使用 `外連接`



#### Match Condition Specified by Natural Join

##### Natural Join: Compare all the common attributes

`自然連接 (Natural Join)`：將輸入的 `2個關系` 中 `共有屬性 (Common Condition) 的值` `均相等` `的元組` 作為 `輸出結果`

下列 `查詢` 的 `等價形式`

```sql
SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches. ID
```

```sql
SELECT name, course_id
FROM instructor NATURAL JOIN teaches
```

> 實際上，可以將 `NATURAL JOIN語句` 看作是一種形式的 `宏展開 (Macro Expansion)`。
>
> 先查找 `兩個關系的共有屬性`，然後 `改寫` 成 `WHERE子句` 形式的 `謂詞`：
>
> ```sql
> WHERE S.common_attribute_1 = T.common_attribute_1
> AND S.common_attribute_2 = T.common_attribute_2
> ...
> AND S.common_attribute_n = T.common_attribute_n
> ```

##### Natural Join: Specify specific common attributes

首先，考慮下面這個 `查詢`

```sql
-- Query 1
SELECT name, title
FROM instructor NATURAL JOIN teaches, course
WHERE teaches.course_id = course.course_id;
```

> n.b. `teaches.course_id` 追根溯源來自 `teaches`，我們是無法直接 `引用` ` 自然連接的結果關系` 的，但可以 `直接引用` `參與自然連接的屬性`，因為 `自然連接的結果關系` 中的 `屬性` 正來自這些 `單個關系的屬性`。

但是，該查詢  `並不等價於` 下列這個 `查詢`

```sql
-- Query 2
SELECT name, title
FROM instructor NATURAL JOIN teaches NATURAL JOIN course
```

> `instructor關系`，`teaches關系`，`course關系` 均有 `dept_name屬性`。
>
> 對於 `Query 1` ：則只需要考慮 `這兩個關系的` `dept_name屬性` 的 `相等`，而 `course關系的dept_name屬性` 可以與他們不同。也就是說，該查詢會顯示出 `教師所講授的課程` 不是 `教師所在系的課程`
>
> 對於 `Query 2`：該查詢 `只顯示` `教師所教的課程` `就是該教師所在系的課程`

出現該問題的原因在於，在將 `instructor NATURAL JOIN teaches` 和 `course`進行 `自然連接` 時，`course` 中存在 `我們不希望使用的共同屬性` 即 `dept_name`

> `course關系` 共有2個 `共同屬性`：`course_id`，`dept_name`

對此，我們可以通過 `帶指定屬性列表的自然連接 (Natural Join with Specific Arrtibute List)` 來改寫 `Query 2` 

```sql
-- Query 3
SELECT name, title
FROM (instructor NATURAL JOIN teaches) JOIN course USING (course_id)
```

這樣，`Query 3` 等價於 `Query 1`。

> n.b. 同樣的道理，可以再將 `NATURAL JOIN` 視為 `JOIN relation USING attribute_list` 的 `宏展開`。
>
> 默認情況下，`relation_1 NATURAL JOIN relation_2`  可以展開為 `relation_1 JOIN relation_2 USING (common_attribute_list)` 

## Basic Operation

### Rename Operation

`更名運算 (Rename Operation)` 用於為 `實體` 指定 `標識符`。

它主要有以下幾種作用：

- 修改 `輸出關系`中的 `長屬性名` 修改為 `短屬性名`

  ```sql
  SELECT instructor_name AS inst_name
  FROM instructor
  ```

- 為 `運算中間結果` 指定 `標識符`，以便 `後續對它的引用`

- 用於 `區分` `涉及自身關系的笛卡爾積運算`

  ```sql
  SELECT DISTINCT T.name
  FROM instructor AS T, instructor AS S
  WHERE T.salary > S.salary AND S.dept_name = 'Biology'
  ```

  > n.b. 可以將 `T` 和 `S` 看作是 `instructor關系` 的 `2份拷貝`
  >
  > > 實際上，並不會真的拷貝2份關系。`T` 和 `S` 只不過是對 `instructor` 的 `引用` 而已。

  > 像 `T` 和 `S` 這樣 `用於重命名關系的標識符` 被稱為 `相關名稱 (Correlation Name)`，或 `表別名 (Table Alias)` 或 `相關變量 (Correlation Variable)` 或 `元組變量 (Tuple Variable)`

### String Operation

#### Pattern Matching

```sql
SELECT dept_name
FROM department
WHERE building LIKE '%Watson%';
```

通過使用 `LIKE操作符`可以實現 `模式匹配 (Pattern Matching)`，使用如下 `字符` 來 `定義模式`：

- `百分號 (%)`：匹配 `任意子串`
- `下劃線 (_)`：匹配 `任意一個字符`

> n.b. 盡管 `SQL標準` 中要求 `字符串的相等運算` 是 `大小寫敏感的`。
>
> 但 `某些數據庫`，如 `MySQL` 和 `SQL Server` 卻在 `匹配字符串` 時 `不區分大小寫`！
>
> 關於 `字符串相等性測試` 的具體詳情，應當查閱 `Manual` 

#### Escape Character

```sql
LIKE 'ab\%cd%' ESCAPE '\'
```

使用 `ESCAPE關鍵字` 定義 `轉義字符` 為 `\`

### Order Operation

```sql
SELECT *
FROM instructor
WHERE dept_name = 'Physics'
ORDER BY salary DESC, name ASC;
```

> `ORDER BY子句` 的 `默認值` 為 `asc`，而 `desc` 需要手動指定。

#### Between Operation

```sql
-- Query 1
SELECT name
FROM instructor
WHERE salary BETWEEN 9000 AND 10000;
```

```sql
-- Query 2
SELECT name
FROM instructor
WHERE salary >= 9000 AND salary <= 10000;
```

`Query 1` 等價於 `Query 2`

> n.b. 可以將 `Between運算符` 和 `Not Between運算符`  視為 `基於不等式比較運算符寫法` 的 `宏展開`。
>
> 但使用 `Between` 和 `Not Between` 使得 `查詢` 更加 `清晰`，而且更不容易 `錯寫` 

#### Multi-Dimensional Tuple

考慮下列 `包含多個AND的相等性測試語句`

```sql
-- Query 1
SELECT name, course_id
FROM instructor, teaches
WHERE instructor.ID = teaches.ID AND dept_name = 'Biology'
```

以及

```sql
-- Query 2
SELECT name, course_id
FROM instructor, teaches
WHERE (instructor.ID, dept_name) = (teaches.ID, 'Biology')
```

`Query 1` 等價於 `Query 2`

> 作為一種更為 `抽象` 的考慮。我們可以認為 `常規所書寫的相等語句` 本質上就屬於 `1維元組`。
>
> 而如果需要同時測試 `多個屬性的某種比較關系`，可以使用 `向量/元組`。
>
> 上述僅僅是 `測試` `相等關系`。同理，也可以用於 `測試` `偏序關系`。
>
> > ```sql
> > (x1, y1) < (x2, y2) 
> > ```

### Set Operation

`SQL標準` 中所定義的 `集合運算` 都是基於 `數學的集合論語義` 的：`所有的集合運算` 會 `自動去重`

> 實際上，`SQL` 的 `集合運算` 有 `兩套版本`
>
> -  `自動去重的默認的distinct版本`：`intersect (distinct) `，` union (distinct) ` ，` except (distinct)`
> - `不帶去重的all版本` ： `intersect all`，`union all`，`except all`

#### Intersect Operation

```sql
(SELECT course_id
 FROM section
 WHERE semester='Fall' AND year = 2009
) INTERSECT
(SELECT course_id
FROM section
WHERE semester='Spring' AND year = 2010
)
```

#### Union Operation

```sql
(SELECT course_id
 FROM section
 WHERE semester = 'Fall' AND year = 2009
) UNION
(SELECT course_id
FROM section
WHERE semester = 'Spring' AND year = 2010
)
```

#### Except Operation

```sql
(SELECT course_id
 FROM section
WHERE semester = 'Fall' AND year = 2009
) EXCEPT
(SELECT course_id
FROM section
WHERE semester = 'Spring' AND year = 2010   
)
```

## Null

### The type of operation involved

| The type of operation involved | Rule                                                         |
| ------------------------------ | ------------------------------------------------------------ |
| `算術表達式`                   | 任何 `算術表達式` 的 `輸入為空`，則 `輸出為空`               |
| `邏輯表達式`                   | 任何 `涉及空值的邏輯表達式` 的 `輸出為未知 (unknown)`<br />n.b. `unknown` 並不是 `null`或 `not null`，也不是 `true` 和 `false`。<br />`unknown` 是 `區別於true和false的第三種邏輯值`<br /><br />`基本邏輯運算` 對於 `unknown` 定義了 `特殊規則`<br />`fasle AND unknown = false`，`true OR unknown = true `，`NOT unkown = unknown` |

> n.b. `SQL標準` 定義的 `邏輯值` 有3種：`true`，`false`，`unknown`。
>
> 註意 `while子句` 的 `語義` 為：`過濾出` `使得謂詞為true的哪些元組` 

> n.b. `未知 (unknown)` 也不是 `空 (null)`。
>
> `unknown`不可以用 `is null` 或 `is not null` 來測試。
>
> 某些 `具體實現` 提供了 `is unknown` 來進行測試。

### Equality Test

| Equality Test      | Rule                                                         |
| ------------------ | ------------------------------------------------------------ |
| `元組的相等性測試` | 在測試 `兩個元組的屬性值` 是否相等時，如果 `屬性值` 均為 `null`，則 `屬性值視為相同`<br />n.b. 如果 `只想保留這樣的相同元組的一份拷貝`，可以使用 `SELECT DISTINCT` |
| `謂詞的相等性測試` | 在測試 `謂詞 null = null` 時，將返回 `unknown`，而不是 `true` |

> n.b. 可以認為，`元組的相等性測試` 實際上執行的是 `另一套特殊規則`：它為 `null = null ` 返回 `true`
>
> 而 `謂詞的相等性測試` 則：為 `null = null` 返回 `unknown`

## Aggregate Function

`聚集函數 (Aggregate Function)`：以 `值的集合` 作為輸入，返回 `單個值` 。

| Intrinsic Aggregate Function | Node               |
| ---------------------------- | ------------------ |
| $avg()$                      |                    |
| $min()$                      |                    |
| $max()$                      |                    |
| $sum()$                      | 忽略 `null`        |
| $count()$                    | 為 `null` 返回 `0` |

###  Basic Aggregate

```sql
SELECT avg(salary)
FROM instructor
WHERE dept_name = 'Comp.Sci.';
```

---

計算 `某個關系中的元組個數`

```sql
SELECT count(*)
FROM course;
```

---

若需要在 `聚集操作` `之前` 進行 `去重`，則可以使用 `distinct關鍵字`

```sql
SELECT count(DISTINCT ID) 
FROM teaches
WHERE semester = 'Spring' AND year = '2010';
```

> n.b. 可以認為，對於 `內置的5個聚集函數` 而言，默認的 `去重選項` 是 `all`
>
> n.b. `SQL標準` 並不允許為 `count(*)` 使用 `distinct`。但卻可以為 `min` 和 `max` 使用 `distinct`。盡管這些 `distinct` 並不會改變 `運算結果` ！

### Grouped Aggregate

`分組聚集 (Grouped Aggregate)` ：可以先對 `某個關系中的元組` 進行 `分組`，然後再 `分別地` 對 `每個分組` 進行 `聚集操作`。

```sql
SELECT dept_name, avg(salary) AS avg_salary
FROM instructor
GROUP BY dept_name;
```

> 可以認為，默認情況下 `省略` `GROUP BY子句` 意味著：將 `整個關系的所有元組` 分為 `唯一的一組`。

---

考慮一個 `錯誤的查詢例子`

```sql
-- This is a wrong query example
SELECT dept_name, ID, avg(salary)
FROM instructor
GROUP BY dept_name;
```

該 `查詢` 的問題在於，我們使用 `dept_name屬性` 將 `instructor關系的元組` 按 `系` 進行 `分組`，之後的 `avg(salary)` 計算的是 `某個系的所有教師的平均工資`。

而 `ID屬性` 的問題在於，對於 `某個系` 來說， `該系中有許多的教師`，如果確實需要 `輸出ID`，那麽究竟要輸出 `該系的所有教師中的哪一個教師的ID`？

綜上，我們對於 `GROUP BY` 有一個規則：出現在 `SELECT子句` 中，但沒有被 `聚集` 的 `屬性`。必須出現在 `GROUP BY` 中。

### Grouped Aggregate with Having Clause

```sql
SELECT dept_name, avg(salary) as avg_salary
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > 42000;
```

`HAVING 子句` 在 `Grouped Aggregate輸出結果` `之後` 才進行 `過濾`。

> 換句話說，`HAVING` 必須在 `GROUP BY` 的 `分組形成後` 才能 `執行`

同理，對 `HAVING` 也有類似 `GROUP BY` 的規則 ：出現在 `HAVING子句`中，但沒有被 `聚集` 的 `屬性`。必須出現在 `GROUP BY`中。

> 可以將 `HAVING子句` 和 `WHERE子句` 作類比。
>
> - `WHERE` ：針對 `元組`
>
> - `HAVING`：針對 `分組`

> 現在，我們可以這樣看待 `標準的SELECT-FROM-WHERE查詢`為：將 `某個關系的分組` 分為 `唯一的一組`，且 `分組過濾條件` 為 `HAVING true`

## Nested Subquery

我們知道 `SELECT-FROM-WHERE` 返回類型為 `關系`，而 `FROM子句` 的輸入類型也為 `關系`，那麽 `嵌套子查詢 (Nested Subquery)` 應當是合理的。

- `in` 和 `not in`

```sql
SELECT DISTINCT course_id
FROM section
WHERE semester = 'Fall' AND year = 2009 
AND course_id IN (SELECT course_id
                  FROM section
                  WHERE semester = 'Spring' AND year = 2010;
);
```

- `all` 和 `any/some`

```sql
-- Query 1
SELECT DISTINCT T.name
FROM instructor AS T, instructor AS S
WHERE T.salary > S.salary AND S.dept_name = 'Biology';
```

> n.b. 這種實現方式中，必須要加 `DISTINCT`：因為 `FROM子句` 輸出的 `結果關系` 為 `2個關系的笛卡爾積`，此時 `結果關系` 中 `滿足WHERE條件的元組` 會 `重復`

等價於

```sql
-- Query 2
SELECT name
FROM instructor
WHERE salary > some(SELECT salary
                   FROM instructor
                   WHERE dept_name = 'Biology'
                   );
```

> n.b. 兩條關於 `全稱量詞和特稱量詞` 的 `等價性規則`：
>
> - `= some` 等價於 `in`，但 `<> some` 不等價於 `not in`
> - `<>all` 等價於 ` not in`，但 `= all` 不等價於 `in`

- `exists`

 `exists`：若 `作為exists參數的子查詢` 產生的 `結果關系` 是 `非空的`時，則返回 `true`

 ```sql
 SELECT course_id
 FROM section AS S
 WHERE semester = 'Fall' AND year = 2009
 AND EXISTS(SELECT *
            FROM section AS T
            WHERE semester = 'Spring' AND year = 2010
            AND S.course_id = T.course_id;
 );
 ```

> n.b. 該例子中，還有一個需要註意的地方：我們在 `子查詢` 中 `引用` 了 `子查詢外部的標識符` `S.course_id`。
>
> 我們稱 `這樣的子查詢` 為 `相關子查詢 (Correlated Subquery)`：使用了 `來自外層查詢的相關名稱` 的 `子查詢`
>
> > 關於 `子查詢` 中對 `標識符` 的 `引用規則`，可以類比於 `PL中的變量作用域規則`

---

`not exists` 可以用於 `測試` `子查詢的結果集` 中 `是否不存在元組`。

我們可以利用這個 `特性` 來模擬 `集合的包含關系`

```sql
-- use not exists to represent subset relationship
SELECT S.ID, S.name
FROM student AS S
WHERE NOT EXISTS(
    (SELECT course_id
     FROM course
     WHERE dept_name = 'Biology'
    ) 
    EXCEPT
    (SELECT T.course_id
     FROM takes AS T
     WHERE S.ID = T.ID
    )
);
```

- `unique`

`unique`：若 `作為unique參數的子查詢` 產生的 `結果關系` 中 `不存在重復元組`，則返回 `true`。它為 `空集` 返回 `true`。

```sql
SELECT T.course_id
FROM course AS T
WHERE UNIQUE(SELECT R.course_id
            FROM section AS R
             WHERE T.course_id = R.course_id
             AND R.year = 2009
            )
```

> 實際上，可以利用 `count()` 將 `exists` ，`not exists` ，`unique` 和 `not unique` 進行 `宏展開`
>
> ```sql
> SELECT T.course_id
> FROM course AS T
> WHERE 1 >= (SELECT count(R.course_id)
>          FROM section AS R
>          WHERE T.course_id = R.course_id
>          AND R.year = 2009
>         )
> ```
>
> 解釋：`WHERE子句` 將對 `T關系中的每個元組` 進行 `測試`，判斷 `嵌套子查詢` 中 `與該元組相等的元組的個數` 是否 `小於等於1`
>
> > 該例子中，通過 `course_id` 作為 `主鍵` 來判斷 `兩個元組是否相等`。
> >
> > 而 `AND R.year = 2009` 僅僅是 `附加的過濾條件`

> n.b. `unique` 判斷 `元組是否重復` 是基於 `元組的相等性測試` 的。故如果 `兩個元組中的某個元組的某個屬性` 為 `null`，則 `這兩個元組` `不相等`。
>
> 換句話說，使用 `unique` 判斷 `某些屬性為空的元組` 是否 `重復` 是錯誤的：
>
> 在這種情況下，盡管 `某個元組確確實實有多個副本`，但 `該元組有一個屬性為空`，則 `元組的相等性測試` 將永遠為 `false`，進而使得 `unique` 永遠返回 `true`

- `FROM子查詢`

可以利用 `FROM子查詢` 來 `去除`  `HAVING子句`

```sql
-- Query 1
SELECT dept_name, avg(salary) as avg_salary
FROM instructor
GROUP BY dept_name
HAVING avg(salary) > 42000;
```

等價於

```sql
-- Query 2
SELECT dept_name, avg_salary
FROM (SELECT dept_name, avg(salary)
     FROM instructor
     GROUP BY dept_name) AS dept_avg(dept_name, avg_salary)
WHERE avg_salary > 42000; 
```

該 `轉化` 的思想在於：`HAVING子句` 實際上的 `執行時機` 是在 `GROUP BY產生結果關系之後`，再對 `結果關系(也就是一些分組)` 進行 `過濾`。

因此，我們可以 `先獲得作為結果關系的這些分組`，然後再 `對這些分組進行過濾`。

- `WITH子句`

`WITH子句`：用於定義 `僅對包含with子句的查詢可見` 的 `臨時關系`

```sql
WITH dept_total(dept_name, value) AS (SELECT dept_name, sum(salary)
                                     FROM instructor
                                     GROUP BY dept_name),
	dept_total_avg(value) AS (SELECT avg(salary)
                             FROM dept_total)
SELECT dept_name
FROM dept_total, dept_total_avg
WHERE dept_total.value >= dept_total_avg.value;
```

> n.b. 使用 `WITH子句` 可以 `非常有效地` 去除 `嵌套子查詢`。
>
> 如果可能，`應當盡量使用WITH子句來消除嵌套子查詢`

- `標量子查詢 (Scalar Subquery)`

`SQL` 會 `自動地` 將 `僅含有單屬性單元組的關系`  `解包`為 `單個值`。

```sql
SELECT name
FROM instructor
WHERE salary < (SELECT avg(salary)
               FROM instructor)
```

>  n.b. 從 `本質` 上來說， `標量子查詢` 返回的 `數據類型` 是確確實實的 `關系`。
>
>  只不過，在 `SQL` 實現中可以自動地 `對這種類型的關系` 進行 `拆包`。這類似於 `Java` 中的 `Auto Boxed/Unboxed`
>
>  `SQL編譯器` 並無法 `檢測` `標量子查詢` 是否真的符合要求。
>
>  如果在 `運行時` 發現 `需要輸入單個值的地方` 所使用的 `標量子查詢` 包含 `多個值`，則會導致 `運行時錯誤`

### Modifying Operation

### Delete

考慮該例子的 `語句執行順序`

```sql
-- This is a wrong example
DELETE FROM instructor
WHERE salary < (SELECT avg(salary)
               FROM instructor)
```

請註意，`我們所編寫的SQL語句` 應當 `滿足` ：在該語句進行 `修改性操作` 之前，必須先 `測試所有的元組`，將 `符合測試條件的元組` 加入到 `待刪除列表`，之後再 `一次性地` 執行 `修改性操作`。

註意：這裏所說的 `修改性操作` 不僅僅是指 `Delete`，包括 `Insert` 和 `Alter` 都有 `類似的問題`

> 該問題類似於 `ArrayList的並發修改問題`，當我們對 `正在遍歷中的列表` 進行 `修改性操作` 時，必須保證 `最終的效果` 不依賴於 `修改性操作所執行的順序`

> 給出 `MySQL 8.0` 以上版本將 `拒絕執行該語句` 並且 `返回錯誤`
>
> 1093 - You can't specify target table 'instructor' for update in FROM clause

### Insert

常用的插入操作

```sql
INSERT INTO course(course_id, title, dept_name, credits)
VALUES ('CS-437', 'Database Systems', 'Comp. SCi.', 4);
```

```sql
INSERT INTO instructor
SELECT ID, name, dept_name, 18000
FROM student
WHERE dept_name = 'Music' AND total_cred > 144;
```

---

```sql
-- This is a wrong example
INSERT INTO student
SELECT *
FROM student
```

該語句 `可能會導致無限遞歸插入`，這取決於 `數據庫的具體實現`。

>經過實際測試，`MySQL 8.0` 以上可以 `正常地執行該語句`，並且 `查詢會終止`。
>
>它的 `語義` 為：將 `表中的所有元組` 按照 `順序` `克隆一份插入到表的末尾`
>
>
>

### Alter

當 `update語句` 之間 `受語句執行順序` 所 `影響` 時，可以使用 `case結構`

```sql
-- SQL 1
UPDATE instructor
SET salary = salary * 1.03
WHERE salary > 100000
```

```sql
-- SQL 2
UPDATE instructor
SET salary = salary * 1.05
WHERE salary <= 100000
```

為了 `正確地表達語義`，我們可以使用 `case` 結構來 `正確表述執行順序之間相互影響的語句`

```sql
UPDATE instructor
SET salary = CASE
             WHEN salary <= 100000 THEN salary * 1.05
             ELSE salary * 1.03
             END
```

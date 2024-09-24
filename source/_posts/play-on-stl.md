---
title: play on stl
date: 2022-04-18 22:44:00
tags:
  - stl
  - cpp
---
# Code Snippet

```cpp
/* Template Begin */
#include <algorithm>
#include <iostream>
#include <stdio.h>
#include <time.h>
#include <cmath>
#include <string>
#include <vector>
#include <stack>
#include <queue>
#include <deque>
#include <list>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <bitset>
#include <numeric>
#include <functional>
#include <iterator>
#include <tuple>
#include <complex>
#include <limits.h>
#include <stack>
#include <sstream>
using namespace std;
/* Template End */
```

### ctype.h

| Function | Note |
| ---- | ---- |
| isalpha() |  |
| isdigit() |  |
| islower() |  |
| isupper() |  |
| ispunct() |  |
| isblank() | C標準庫只為\t和space返回非0值 |
| tolower() |  |
| toupper() |  |

### limits.h
| Macro Constant |
| ---- |
| INT_MIN |
| LONG_MIN |
| LLONG_MIN |
| UINT_MIN |
| ULLONG_MIN |
### math.h
#### Trigonometric Functions

| Function | Note |
| ---- | ---- |
| sin(), cos(), tan(), asin(), acos(), atan() |  |
| atan2() | 返回給定坐標的角度 |
註：這些 `三角函數` 輸入均為 `浮點數`，默認使用 `弧度`作為單位。
#### Hyperbolic Functions

| Function |
| ---- |
| sinh(), cosh(), tanh(), asinh(), acosh(), atanh() |
#### Exponential and Logarithmic Functions

| Function | Note |
| ---- | ---- |
| exp() | 返回自然常數的指定指數值 |
| log() | 返回以自然常數為底的對數 |
| log10() | 返回以10為底的對數 |
| log2() | 返回以2為底的對數 |
#### Power Functions

| Function | Note |
| ---- | ---- |
| pow() | 該函數底層通過浮點數進行計算, 存在精度損失問題. 若確實需要使用, 請配合round() |
| sqrt() | 返回平方根 |
| bqrt() | 返回立方根 |
| hypot() | 返回直角三角形的斜邊 |

#### Rounding and Remainder Functions

| Function |
| ---- |
| floow() |
| ceil() |

#### Other Functions

| Function | Note |
| ---- | ---- |
| abs() | 用於求整數的絕對值 (用於浮點數時存在精度問題) |
| fabs() | 用於求浮點數的絕對值 |
#### Classification Macro/Functions

| Macro/Function | Note |
| ---- | ---- |
| isinf() | 判斷浮點數是否無窮大 |
| isnan() | 判斷浮點數是否為實數 |

#### Comparison Macro/Functions
| Function |
| ---- |
| isgreater() |
| isgreaterequal() |

### stdio.h
#### Formatted Input/Output

| Function | Note |
| ---- | ---- |
| scanf() | 格式化輸入 |
| printf() | 格式化輸出 |
| sscanf() | 格式化輸入到字符串 |
| sprintf() | 格式化輸出到字符串 |
| getchar() | 該方法不會跳過空白字符(回車, 換行, 空格) |
| gets() | 輸入1行 (以`\n`作為分隔符) 字符串 |
| puts() | 輸出1行字符串 (該方法會在末尾自動添加`\n`) |

#### Macros

| Macro | Note |
| ---- | ---- |
| EOF | 值為-1的整數, 作為 `文件流的末尾標識字符` .<br>註: EOF並不屬於 `文件內容` 的一部分, 它只是一個 流狀態標識符 |
| NULL | 整數值為0的字符, 作為 字符串的末尾標識字符.<br>註: NULL字符 確實屬於 C語言風格字符串 的內容的一部分 |
| size_t | 無符號類型整數<br>註: 當其作為循環變量並與int類型的增量相運算時, 將存在類型轉化不兼容 |

### stdlib.h
#### String Conversion

| Function | Note |
| ---- | ---- |
| atoi(), atof(), atol(), atoll() | 轉換string到int, double, long, long long |
| strtod(), strtoll(), strtoul(), strtoull() | 轉換string(解釋為以base為基數)到long, long long, unsigned long, unsigned long long |

#### Pseudo-Random Sequence Generation
| Function | Note |
| ---- | ---- |
| srand() | 初始化隨機數種子 |
| rand() | 生成下一個隨機數 |
#### Dynamic Memory Management

| Function | Note |
| ---- | ---- |
| malloc() |  |
| calloc() | 該方法會自動進行填0初始化 |
| reallocI() |  |
| free() | 釋放動態申請的內存 |

#### Searching and Sorting

| Function | Note |
| ---- | ---- |
| qsort() | 快速排序 |
| bsearch() | 二分查找 |

### string.h
#### Copying

| Function |
| ---- |
| memcpy() |
| memmove() |
| strcpy() |
#### Concatenation
| Function |
| ---- |
| strcat() |
#### Comparison

| Function |
| ---- |
| memcmp() |
| strcmp() |

#### Searching

| Function |
| ---- |
| memchr() |
| strchr() |
| strrchr() |
| strpbrk() |
| strcspn() |
| strspn() |
| strstr() |
| strtok() |

#### Other

| Function | Note |
| ---- | ---- |
| memset() | 該方法本質是 字符串. 若需要填充整數, 則只有下列整數的可行的: 0, -1 |
| strlen() | 該方法不計入字符串末尾的結束字符 |

### time.h
#### Time Manipulation

| Function |
| ---- |
| clock() |
| difftime() |
| mktime() |
| time() |

#### Conversion
| Function |
| ---- |
| asctime() |
| ctime() |
| gmtime() |
| localtime() |
| strftime() |
## Containers
### vector
### queue
### deque
### stack
### list
### set
### map
### unordered_map
### unordered_set
## Other Libraries

| Library |
| ---- |
| algorithm |
| bitset |
| chrono |
| codecvt |
| complex |
| exception |
| functional |
| initializer_list |
| iterator |
| limits |
| locale |
| memory |
| new |
| numeric |
| random |
| ratio |
| regex |
| stdexcept |
| string |
| system_error |
| tuple |
| typeindex |
| typeinfo |
| type_traits |
| utility |
| valarray |

## Code Snippets

### Initialize the Array with Fixed-Element

- `定義時` 使用 `列表初始化`

```cpp
  int arr[10] = {1,2,3};
```

```cpp
1 2 3 0 0 0 0 0 0 0
```

> `列表初始化` 會 `列表的元素`填充到 `數組的前幾個元素`，`數組的剩余元素`一律 `填0`

- 使用 `memset`進行 `內存字符填充`

```cpp
  int arr[10];
  memset(arr, 0, sizeof(array));
```

```cpp
0 0 0 0 0 0 0 0 0 0
```

> 註意：該種方法只能用於填充 `0`和 `-1`

- 利用 `全局變量`自動 `初始化填0`的特性

```cpp
int arr[10];
int main() {
  for (int i = 0; i < 10; ++i) {
    printf("%d ", arr[i]);
  }
  return 0;
}
```

```cpp
0 0 0 0 0 0 0 0 0 0
```

- 使用 `fill()` 填充函數

```cpp
  int arr[10];
  fill(arr, arr + 10, 2022);
```

```cpp
2022 2022 2022 2022 2022 2022 2022 2022 2022 2022
```

> `fill_n()` 只用 `指定值` 填充 `前n個元素`
> 
> ```cpp
> int arr[10];
> fill_n(arr, 3, 2020);
> ```
> 
> ```cpp
> 2020 2020 2020 0 8 0 75 0 16875376 0
> ```

### Initialize the Array with Generated-Element

- 使用 `generate()` 生成函數

```cpp
  int arr[10];
  generate(arr, arr + 10, []() { return rand() % 5; });
```

```cpp
1 2 4 0 4 4 3 3 2 4
```

> 如果需要讓 `generate()` 保存 `狀態`，則可以利用 `靜態局部變量`來實現。
> 
> > 用 `全局變量`也可以，但 `靜態局部變量`使得 `代碼結構`更加 `緊湊`
> 
> ```cpp
>   int arr[10];
>   generate(arr, arr + 10, []() {
>       static int i = 1;
>       return i *= 2;
>   });
> ```
> 
> ```
> 2 4 8 16 32 64 128 256 512 1024
> ```

### Generate Lexicographical-Permutation

- 使用 `next_permutation()`

```cpp
  string words = "abc";
  do {
    cout << words << endl;
  } while (next_permutation(words.begin(), words.end()));
```

```cpp
abc
acb
bac
bca
cab
cba
```

> 同理，`prev_permutation()`則是 `生成上一個排列`

相關輔助函數：`is_permutation()`

### Hash Function

- 使用 `hash結構體模板`

```cpp
  hash<string> string_hash;
  string first_words = "abc";
  string second_words = "cba";

  printf("hash(first_words) = %lld", string_hash(first_words));
  printf("\n");
  printf("hash(second_words) = %lld", string_hash(second_words));
```

```cpp
hash(first_words) = 3663726644998027833
hash(second_words) = -4830583261295167161
```

### Find the Index of A Specific Element

- 使用 `find()`

```cpp
  int arr[] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int index = find(arr, arr + 10, 70) - arr;
  printf("index = %d", index);
```

```cpp
index = 7
```

- 使用 `find_if()`

```cpp
  int arr[] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int index = find_if(arr, arr + 10, [](const auto &obj) {
      return obj != 0 && obj % 15 == 0;
  }) - arr;
  printf("index = %d", index);
```

```cpp
index = 3
```

### Find the Index of A Subsequence

- 使用 `find_first()`

```cpp
  int arr[] = {0, 30, 40, 50, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int needle[] = {30, 40, 50};
  int index = find_first_of(arr, arr + 13, needle, needle + 3) - arr;
  printf("index = %d", index);
```

```cpp
index = 1
```

> `find_first_of()` ：返回 `第一個相等的子序列`的 `首元素下標`
> 
> `find_end()`：返回 `最後一個相等的子序列`的 `首元素下標`

- 使用 `search()`

```cpp
  int arr[] = {0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  int needle[] = {30, 40, 50};
  int index = search(arr, arr + 10, needle, needle + 3) - arr;
  printf("index = %d", index);
```

```cpp
index = 3
```

> `search`返回的是 `第一個滿足條件的元素`

> 默認的 `search()`使用的是 `相等謂詞`，我們也可以自定義 `二元相等謂詞`
> 
> ```cpp
> int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
> int needle[] = {9, 16, 25};
> int index = search(arr, arr + 10, needle, needle + 3, [](const auto &o1, const auto &o2) {
>  return o1  * o1 == o2;
> }) - arr;
> printf("index = %d", index);
> ```
> 
> ```cpp
> index = 3
> ```

> 此外，如果我們的 `子序列`是 `相同元素組成的指定長度的子序列`，則可以直接使用 `search_n()`
> 
> ```cpp
> int arr[] = {0, 1, 2, 9, 9, 5, 6, 7, 8, 9, 10};
> int index = search_n(arr, arr + 10, 2, 9) - arr;
> printf("index = %d", index);
> ```
> 
> ```cpp
> index = 3
> ```

### Find in Two-Consecutive Elements

- 使用 `find_adjacent()`

```cpp
  int arr[] = {0, 10, 20, 20, 40, 50, 60, 70, 80, 90};
  int index = adjacent_find(arr, arr + 10, [](const auto &o1, const auto &o2){
    return o1 == o2;
  }) - arr;
  printf("index = %d", index);
```

```cpp
index = 2
```

### Count the number of elements for which predicate is true

- 使用 `count_if()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int cnt = count_if(arr, arr + 10, [](const auto &o1) {
      return o1 % 2 == 0;
  });
  printf("cnt = %d", cnt);
```

```cpp
cnt = 5
```

### Return the First Position where Two Ranges differs

```cpp
  int arr[] = {0, 1, 2, 30, 4, 5, 6, 7, 8, 9};
  int needle[] = {0, 1, 2};
  pair<int *, int *> ret = mismatch(arr, arr + 10, needle);
  printf("ret->first = %d", ret.first - arr);
  printf("\n");
  printf("ret->second = %d", ret.second - needle);
```

```cpp
ret->first = 3
ret->second = 3
```

> `mismatch()` 默認使用的 `二元相等謂詞` 就是 `operator=`。
> 
> 如果需要，可以自定義 `二元相等謂詞`

> `equal()` 與 `mismatch()`類似，但它只返回 `是否相等`

### Test For-All and Exist

- 使用 `all_of()`

```cpp
  int arr[] = {0, 2, 4, 6, 8, 10};
  bool flag = all_of(arr, arr + 6, [](const auto&o1){
    return o1 % 2 == 0;
  });
  cout << flag;
```

```cpp
1
```

> `any_of()`同理，它可以測試是否有 `任何一個元素`滿足 `條件`。
> 
> `none_of()` 可以用 `all_of()` 取反來實現。

### Apply function to range

- 使用 `for_each()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  for_each(arr, arr + 10, [](const auto & o1){
    cout << o1 * o1 << " ";
  });
```

```cpp
0 1 4 9 16 25 36 49 64 81
```

### Remove Duplicates

- 使用 `sort()` 配合 `unique()`

```cpp
  int arr[] = {10, 10, 20, 30, 40, 50, 10, 60, 70, 80};
  unique(arr, arr + 10);
  for (int i = 0; i < 10; ++i) {
    printf("%d ", arr[i]);
  }
```

```cpp
10 20 30 40 50 10 60 70 80 80
```

> n.b. `unique()` 的 `語義`並不是 `去除序列的重復元素`，而是 `去除序列的連續的重復元素 (只保留一個相同元素)`。
> 
> 上述例子中只有 `連續的10`被去除。
> 
> 如果確實要去除 `序列中所有的重復元素`，則應當先 `sort()`使得 `所有的相同元素`是 `連續排列的`，再使用 `unique()`

> 該函數也有 `可復製到指定輸出流的版本` `unique_copy()`

### Print Range

- 使用 `for_each()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  for_each(arr, arr + 10, [](const auto &item) {
      cout << item << " ";
  });
```

- 使用 `copy()`

```cpp
  copy(arr, arr + 10, ostream_iterator<int>(cout, " "));
```

### Copy range of elements

- 使用 `copy()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int dest[10];
  copy(arr, arr + 10, dest);
```

> 可以使用 `帶謂詞的版本` `copy_if()`
> 
> 如果需要 `反向遍歷`，可以使用 `copy_backward()`

### Move range of elements

- 使用 `move()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  move(arr, arr + 2, arr + 3);
```

```cpp
0 1 2 0 1 5 6 7 8 9
```

> `move()`方法允許 `目標內存區域`和 `來源內存區域`發生 `重疊`。
> 
> 但是，`move()`不保證 `來源內存區域`的 `內容`仍 `保持原樣`

### Transform Range

- 使用 `transform()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  transform(arr, arr + 10, arr, [](const auto & o1){
    return o1 * o1;
  });
  copy(arr, arr + 10, ostream_iterator<int>(cout, " "));
```

```cpp
0 1 4 9 16 25 36 49 64 81
```

> `transform()`可以指定 `輸出目標流`，並且允許 `輸出目標流`和 `輸入流`發生 `重疊`。
> 
> 有點類似 `for_each()`，但 `for_each()`經常用於 `非修改性操作`，而 `transform()` 用於 `修改性操作`

### Replace Values in Range

- 使用 `replace()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  replace(arr, arr + 10, 3, 3000);
```

```cpp
0 1 2 3000 4 5 6 7 8 9
```

> 可以使用 `帶謂詞版本的` `replace_if()`來替代 `replace()`：只有當 `謂詞` `測試通過`時，才會用 `新值` 替換 `當前元素`

- 使用 `replace_copy()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int dest[10];
  replace_copy(arr, arr + 10, dest, 3, 3000);
  copy(arr, arr + 10, ostream_iterator<int>(cout, " "));
  printf("\n");
  copy(dest, dest + 10, ostream_iterator<int>(cout, " "));
```

```cpp
0 1 2 3000 4 5 6 7 8 9
```

> 相比於 `replace()`而言，`replace_copy()`可以指定 `修改結果的輸出流`。
> 
> > 特別地，`replace_copy()`可以重新將 `輸出流`指定為 `輸入流`
> > 
> > 在這個情況下，`replace_copy()`等價於 `replace()`

> 此外，還有一個 `帶謂詞版本的` `repalce_copy_if()`
> 
> 我們稱它是`萬能的替換函數`，因為它可以取代：`repalce()`，`replace_if()`，`replace_copy()`

### Reverse Range

- 使用 `reverse()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  reverse(arr, arr + 10);
```

```cpp
9 8 7 6 5 4 3 2 1 0
```

> `可復製到指定輸出流的版本` `reverse_copy()`

### Rotate left the elements in range

- 使用 `rotate()`

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  rotate(arr, arr + 3, arr + 10);
```

```cpp
3 4 5 6 7 8 9 0 1 2
```

### Rearrange elements in range

- 使用 `random_shuffle()` 隨機生成函數

```cpp
  int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  random_shuffle(arr, arr + 10);
```

```cpp
8 1 9 2 0 5 7 3 4 6
```

> 該方法可用於 `洗牌算法`

### Merge (Operating on Sorted Ranges)

- 使用 `set_intersection()`

```cpp
  vector<int> A = {1, 2, 3};
  vector<int> B = {3, 4, 5, 6};
  sort(A.begin(), A.end());
  sort(B.begin(), B.end());
  vector<int> result(10);
  auto it = set_intersection(A.begin(), A.end(), B.begin(), B.end(), result.begin());
  copy(result.begin(), it, ostream_iterator<int>(cout, " "));
```

```cpp
3
```

- 集合交 -> `set_union()`
- 集合差 -> `set_difference()`
- 集合對稱差 -> `set_symmetric_difference()`
- 歸並 -> `merge()`：`歸並操作`

> 相比於 `set_union()`而言，`merge()`會 `保留多個相同的元素`

- 原址性歸並 -> `inplace_merge()`：`原址性的歸並操作`

```cpp
    vector<int> arr = {1, 1, 2, 3, 4, 2, 3, 4, 5, 6, 7};
    inplace_merge(arr.begin(), arr.begin() + 5, arr.end());
    ```

```cpp
     1 1 2 2 3 3 4 4 5 6 7
    ```

- 測試包含關系 -> `includes()`
- > ```cpp
    > vector<int> A = {0,1,2,3,4,5,6,7,8,9};
    > vector<int> B = {3,4,5,6};
    > cout << includes(A.begin(), A.end(), B.begin(), B.end());
    > printf("\n");
    > cout << includes(B.begin(), B.end(), A.begin(), A.end());
    > ```
    > 
    > ```cpp
    > 1
    > 0
    > ```

> n.b. 上述的 `所有的歸並操作`在使用之前，都需要用 `sort()` 對 `集合A` 和 `集合B` 進行 `預處理`。
> 
> 否則將導致輸出結果的錯誤。

### Min/Max

- 最小元素/最大元素 -> `min_element()` 和 `max_element()`
	 
     ```cpp
     vector<int> v = {3, 5, 2, 7, 1, 9, 4};
     int index = min_element(v.begin(), v.end()) - v.begin();
     printf("%d ", index);
     ```

     ```cpp
     4
     ```
   
     > `minmax_element()`返回一個 `(最小值叠代器，最大值叠代器)`的 `二元組`

### Heap

`堆操作函數`將一個 `數組`維護 `堆結構`，但除此之外，我們還需要一個 `表示堆大小的整數`。

> n.b. `數組的大小` 不一定等於 `堆的大小`，我們有可能 `只使用數組中的一部分連續區域` 來構成 `堆`
> 
> n.b. 使用 `數組`時需要 `額外維護一個表示堆大小的整數`。但如果使用的是 `vector`，則可以 `在每次堆操作後`手動地 `維護vector`，使得 `vector的大小`始終與 `heap的大小` 相等。

> 與 `Java`的是，`C++`的 `Heap`默認是 `最大堆`，同理，`基於Heap的PriorityQueue`也默認是 `最大優先隊列`

- `make_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    ```
    
- `pop_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      pop_heap(v.begin(), v.end());
      v.pop_back();
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    8 7 5 6 4 3 1 2 0
    ```
    
- `push_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      v.push_back(10);
      push_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    10 9 8 6 7 5 1 2 0 3 4
    ```
    

除此之外，還有一些 `輔助操作`。

- `sort_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      sort_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    0 1 2 3 4 5 6 7 8 9
    ```
    
- `is_heap()`
    
    ```cpp
      vector<int> v = {5, 6, 8, 2, 3, 9, 1, 7, 0, 4};
      make_heap(v.begin(), v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\n");
    
      cout << is_heap(v.begin(), v.end());
    ```
    
    ```cpp
    9 7 8 6 4 5 1 2 0 3
    1
    ```
    

大部分情況下，如果需要使用 `優先隊列`可以首先考慮 `priority_queue`。

但如果需要一些更底層的操作，可以使用 `heap functions`

### Binary Search

- 下界函數/上界函數

```cpp
  vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  int ret1 = lower_bound(v.begin(), v.end(), 3) - v.begin();
  int ret2 = upper_bound(v.begin(), v.end(), 3) - v.begin();
  printf("lower_bound = %d ", ret1);
  printf("\n");
  printf("upper_bound = %d ", ret2);
```

```cpp
lower_bound = 3
upper_bound = 4
```

> n.b. `lower_bound()`和 `upper_bound()`的 `語義` 可能直觀上和 `名稱`不同。
> 
> 但實際上， `lower_bound()`指的是 `not less than`
> 
> 而 `upper_bound()` 指的是 `greater than`

- `binary_search()`

```cpp
  vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  bool found = binary_search(v.begin(), v.end(), 3);
  printf("found = %d", found);
```

```cpp
found = 1
```

> 如果 `已知序列是有序的`，則可以用 `binary search`代替 `linear search`來獲得更高的效率。
> 
> 但是，如果需要獲取 `下標`，則需要使用 `lower_bound()`來進行 `二分查找`
> 
> > 盡管C標準庫確實有一個 `bsearch()`函數，但該函數原型對於C++的很多數據結構來說，並不適合。

- `equal_range()`
    
    ```cpp
      vector<int> v = {0, 1, 2, 3, 3, 5, 6, 7, 8, 9};
      auto ret = equal_range(v.begin(), v.end(), 3);
      printf("first = %d\n", ret.first - v.begin());
      printf("second = %d\n", ret.second - v.begin());
    ```
    
    ```cpp
    first = 3
    second = 5
    ```
    
    > 需要在 `有序序列`中查找 `一段連續的相同的元素`的 `下標範圍`，則可以使用 `equal_range()`
    

### Sorting

- `sort()`：`快速排序`，`非穩定性的`
    
- `stable_sort()`：`穩定性的排序`
    
- `partial_sort()`：`劃分排序`，可以按照 `基準元素`將 `序列` 進行 `劃分`為 `兩個部分`
    
- `is_sorted()`：判斷 `序列`是否所有元素滿足 `偏序關系`
    
    > 通常情況下，我們定義的 `偏序關系`也就是 `operator <`。
    > 
    > 在這個意義上，`is_sorted()` 默認是 `判斷序列是否升序`，
    > 
    > 如果希望判斷 `序列是否是降序的`，可以利用 `反向叠代器`來實現。
     ```cpp
     vector<int> increase = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
     vector<int> decrease = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
     cout << is_sorted(increase.begin(), increase.end()) << endl;
     cout << is_sorted(decrease.begin(), decrease.end()) << endl;
     cout << is_sorted(decrease.rbegin(), decrease.rend());
     ```
     
     ```cpp
     1
     0
     1
     ```
    
- `nth_element()`
    
    ```cpp
      vector<int> v = {4, 7, 6, 8, 9, 2, 1, 3, 5};
      nth_element(v.begin(), v.begin() + 1, v.end());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    1 2 4 3 5 6 7 9 8
    ```
    
    > `nth_element()`可以使得 `序列中指定位置的值`為 `排序該序列後該位置放置的元素`。
    > 
    > 但除了讓 `指定位置為排序後的序列應放置的元素`之外， `其他位置的元素`可能會受到 `位置改變的副作用`
    
### Partitions

- `partition()`
    
    ```cpp
      vector<int> v = {5, 3, 7, 4, 2, 9, 0, 8, 1};
      int ret = partition(v.begin(), v.end(), [](const auto&o1){
        return o1 < 4;
      }) - v.begin();
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
      printf("\nthe index of the first element in the second group: %d", ret);
    
    ```
    
    ```cpp
    1 3 0 2 4 9 7 8 5
    the index of the first element in the second group: 4
    ```
    
    > `partition()` 劃分函數 將 `序列`按照 `一元謂詞`劃分為 `2個部分`：
    > 
    > - 第1部分：滿足謂詞的元素
    > - 第2部分：不滿足謂詞的元素
    > 
    > 它的返回值是 `第2部分的第一個元素的下標`
    > 
    > > n.b. 我們可以發現，STL中很多關於 `2劃分` 所返回的下標，均遵循 `the index of the first element in the second group`的原則。
    > > 
    > > 同樣地，類似的規律有 `取頭不取尾的區間表示方法 [begin, end)`
    > 
    > > 變種版本：`partition_copy()`，`stable_partition()`
    
- `is_partitioned()`
    
- `partition_point()`
    
     ```cpp
     vector<int> v = {5, 3, 7, 4, 2, 9, 0, 8, 1};
     int ret = partition(v.begin(), v.end(), [](const auto &o1) {
        return o1 < 4;
     }) - v.begin();
     copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
     printf("\nthe index of the first element in the second group: %d", ret);
     // partition_point()
     auto point = partition_point(v.begin(), v.end(), [](const auto &o1) {
        return o1 < 4;
     });
     printf("\n");
     for (auto iter = v.begin(); iter != point; iter++) {
      printf("%d ", *iter);
     }
     ```
     
     ```cpp
     1 3 0 2 4 9 7 8 5
     the index of the first element in the second group: 4
     1 3 0 2
     ```
     
     可用於 `反求` `劃分的分割點的叠代器`
    

### Bitset

`位圖 (bitset)` 是C++ 容器庫之外的一個數據結構，它用 `1個二進製位`表示 `1個邏輯型變量`。

相比於 `char (8-bit)`而言，更 `節約空間`。

更重要的是，`bitset`提供了一些方便的 `數據操作函數`和 `數據查詢函數`，以及對 `字符串輸出`的支持。

- 數據操作函數
    
    - `置位 (set)`：將 `指定下標的位`設置為 `1`
    - `復位 (reset)`：將 `指定下標的位`設置為 `0`
    - `翻轉 (flip)`：將 `指定下標的位`進行 `翻轉`
- 數據查詢函數
    
    - `測試 (test)`：返回 `指定下標的位`
        
    - `計數 (count)`：返回 `被置位的位數`
        
        - `全部已置位 (all)`：是否 `所有的位`都被 `置位`
        - `任何已置位 (any)`：是否 `任何一個位`被 `置位`
        - `沒有已置位 (none)`：是否 `沒有任何一個位`被 `置位`

```cpp
  bitset<32> bits;
  bits.set(0,true);
  cout << bits;
```

```cpp
00000000000000000000000000000001
```

> 在 `空間緊張`的情況下，`bitset<size>`可能會優於 `vector<bool>`。
> 
> > 事實上，這並不一定。因為 `vector<bool>`和 `普通的泛化vector`不同，
> > 
> > 它是 `vector模板的特例化`，具體庫實現很有可能針對 `vector<bool>`做出特別的優化。
> 
> 但不同於 `vector`的 `動態伸縮`， `bitset`的大小是通過 `模板`固定的，在編譯期確立和內存空間。

### Complex

STL庫提供的 `復數`實現，同時重載了 `運算符`。

```cpp
  complex<int> a = {1,2};
  complex<int> b = {3,4};
  cout << a + b;
```

```cpp
(4,6)
```

### Ratio

由C++提供的 `比例 (Ratio)`庫。可以直接作為 `分數`庫使用。

```cpp
  typedef ratio<1, 2> one_half;
  typedef ratio<2, 3> two_thirds;
  ratio_add<one_half, two_thirds> sum;
  printf("fraction: %d/%d", sum.num, sum.den);
```

```cpp
fraction: 7/6
```

> 他們本質上是 `宏`，只能在 `編譯期`確定數值。

### Tuple

當需要表示 `多種數據類型的有序序列`，則可以使用 `元組 (Tuple)`。

> 比如如果需要返回 `2個返回值`時，比起 `structure`來說，`tuple`會更加方便
> 
> > 實際上，有另一個東西叫 `make_pair()`

- Construct Tuple and Get Elements

```cpp
  tuple<string, int> t1("hello", 100);
  cout << "get<0> = " << get<0>(t1) << endl;
  cout << "get<1> = " << get<1>(t1);
```

```cpp
get<0> = hello
get<1> = 100
```

> 實際上，比起 `構造器`而言， 我們更經常使用 `make_tuple()` 來構造元組。
 
 ```cpp
 auto t2 = make_tuple("hello", "world", 100);
 ```

- Use `tie()` to Unpack Tuple

```cpp
  auto tuple = make_tuple("hello", "world", 100);

  string str1;
  string str2;
  int num;
  tie(str1, str2, num) = tuple;

  cout << str1 << endl;
  cout << str2 << endl;
  cout << num << endl;
```

```cpp
hello
world
100
```

> 如果只需要 `unpack`其中 `某些元素`，則可以使用 `std::ignore`來進行 `占位`
 
 ```cpp
 auto tuple = make_tuple("hello", "world", 100);
 
 string str1;
 int num;
 tie(str1, std::ignore, num) = tuple;
 
 cout << str1 << endl;
 cout << num << endl;
 ```

### Utility

- `swap()`
- `make_pair()`
     如果只需要 `2元組`的情況下，用 `make_pair()`會比 `make_tuple()`方便非常多。後者的 `accessor`用起來比較麻煩。
   

### Accumulate values in range

- 使用 `accumulate()`

```cpp
  vector<int> v = {0,1,2,3,4,5,6,7,8,9};
  int sum = accumulate(v.begin(), v.end(), 0);
  cout << sum;
```

```cpp
45
```

> `accumulate()` 不僅僅是用於 `累加`，它還支持 `帶有二元謂詞的版本`。
> 
> 可以利用 `二元謂詞`來實現 `累減`，`累乘`，`累除`等
 ```cpp
 vector<int> v = {1, 2, 3, 4};
 int sum = accumulate(v.begin(), v.end(), 1, [](const auto &o1, const auto &o2) {
    return o1 * o2;
 });
 cout << sum;
 ```
 
 ```cpp
 24
 ```

### Compute adjacent difference of range

- 使用 `adjacent_difference()`

```cpp
  vector<int> v = {1,4,6,10};
  adjacent_difference(v.begin(), v.end(), v.begin());
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
1 3 2 4
```

> `adjacent_difference()` 不但可以用於 `差分`，還可以進行 `和分`，`積分`，`商分`
 ```cpp
 vector<int> v = {1, 4, 6, 10};
 adjacent_difference(v.begin(), v.end(), v.begin(), [](const auto &o1, const auto &o2) {
 return o1 * o2;
 });
 copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
 ```
 
 ```cpp
 1 4 24 60
 ```

### Compute cumulative inner product of range

- 使用 `inner_product()`

```cpp
  int init = 100;
  vector<int> a = {10, 20, 30};
  vector<int> b = {1, 2, 3};
  int ret = inner_product(a.begin(), a.end(), b.begin(), init);
  cout << ret;
```

```cpp
240
```

> n.b. 使用 `inner_product()` 時需要保證 `矢量a`和 `矢量b`的 `長度相等`。
> 
> > 在 `兩個矢量的長度不等的情況下`，STL仍然會取 `較長的矢量`進行運算， 而`較短的矢量`的 `越界值`將是 `不可預測的`

> 可以使用 `帶謂詞版本的 inner_product()`來模擬 `inner_product()`
> 
 ```cpp
 int init = 100;
 vector<int> a = {10, 20, 30};
 vector<int> b = {1, 2, 3};
 int ret = inner_product(a.begin(), a.end(), b.begin(), init, [](const auto &o1, const auto &o2) {
  return o1 + o2;
 }, [](const auto &o1, const auto &o2) {
    return o1 * o2;
 });
 ```
 
 ```cpp
 240
 ```

### Compute partial sums of range

- 使用 `partial_sum()`

```cpp
  vector<int> a = {1, 2, 3, 4, 5};
  partial_sum(a.begin(), a.end(), a.begin());
  copy(a.begin(), a.end(), ostream_iterator<int>(cout, " "));
```

```cpp
1 3 6 10 15
```

> 同理，使用帶二元謂詞的版本，我們可以實現：`部分差`，`部分乘`，`部分商`

### Store increasing sequence

- 使用 `iota()`

```cpp
  vector<int> v(10);
  iota(v.begin(), v.end(), 3);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
3 4 5 6 7 8 9 10 11 12
```

> `iota()`底層使用 `operator++ 運算符`來實現 `遞增`

### Function Object

#### Base Classes

`函數對象`即利用 `結構體/對象`的 `operator()`運算符重載，完成類似 `普通函數`的 `函數調用`。

- `unary_function()`

```cpp
struct IsOdd {
    bool operator() (int number) {
      return number % 2 != 0;
    }
};

int main() {
  IsOdd function_object;
  cout << function_object(3) << endl;
  cout << function_object(2);
  return 0;
}
```

```cpp
1
0
```

> 本質上來說，`函數對象`就是一個 `結構體`。
 ```cpp
 struct IsOdd {
    bool operator() (int number) {
      return number % 2 != 0;
    }
 } function_object;
 ```

- `binary_function()`

```cpp
int main() {
  struct Add {
      int operator() (int o1, int o2) {
        return o1 + o2;
      }
  } function_object;
  cout << function_object(1, 2) << endl;
  return 0;
}
```

```cpp
3
```

> `函數對象`一般用於 `predicate function`和 `comparison function`。
> 
> 在大部分的場景下，可以用 `lambda表達式` 代替 `函數對象` 作為 `callable`。

#### Operator Classes

##### Arithmetic Operation

- `plus`
    ```cpp
    int main() {
      plus<int> function_object;
      cout << function_object(1,2);
      return 0;
    }
    ```
    
    ```cpp
    3
    ```
- `minus`
- `multiplies`
- `divides`
- `modulus`
- `negate`
    

> 上述 `算術操作函數對象`可以非常方便地用於 `transform()`

##### Comparison Operation

- `equal_to`
- `not_equal_to`
- `greater`
- `less`
- `greater_equal`
- `less_equal`

> `greater`和 `less`經常用於 `UDT`的 `優先隊列`定義。

> `比較器函數`的 `基本用法`可以依據 `傳入參數`來進行 `測試`。
> 
> 但我們也可以 `綁定某個 參數`為 `常數`。
 ```cpp
 vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
 int cnt = count_if(v.begin(), v.end(), bind2nd(greater<int>(), 3));
 cout << cnt;
 ```
 
 ```cpp
 6
 ```

##### Logical Operations

- `logical_and`
- `logical_or`
- `logical_not`

##### Adaptor and Conversion Functions

###### Negators

- `not1`
    
    ```cpp
    struct IsOdd {
        bool operator()(const int &x) const { return x % 2 != 0; }
        typedef int argument_type;
    };
    
    int main() {
      vector<int> v = {0, 2, 4, 6, 5};
      int cnt = count_if(v.begin(), v.end(), not1(IsOdd()));
      cout << cnt;
      return 0;
    }
    ```
    
    ```cpp
    4
    ```
    
- `not2`
    

> `not1` 和 `not2` 可以對 `現有的謂詞`進行 `取反`。
> 
> 但他們僅支持 `函數對象`，並不適用於 `lambda表達式`
> 
> > `not1` 和 `not2` 實質上是 `基於結構體模板的`，而 `lambda`本質上屬於 `函數`而不是 `結構體`

> 在用 `not1`和 `not2`進行 `取反`時還必須要求定義 `typedef int argument_type`，而且對於 `運算符函數`必須用 `const`作修飾。
> 
> 使用並不方便。

###### Parameter Binders

- `bind1st()`
- `bind2nd()`

> `bind1st()` 和 `bind2nd()` 適用於 `操作類的函數對象`。
> 
> 一般與 `Comparison Functions`搭配使用。

###### Conversors

- `ptr_fun()`：
- `mem_fun()`：
 ```cpp
      vector <string*> numbers;
      numbers.push_back ( new string ("one") );
      numbers.push_back ( new string ("two") );
      numbers.push_back ( new string ("three") );
      numbers.push_back ( new string ("four") );
      numbers.push_back ( new string ("five") );
    
      vector <int> lengths ( numbers.size() );
      transform (numbers.begin(), numbers.end(), lengths.begin(), mem_fun(&string::length));
    
      for (int i=0; i<5; i++) {
        cout << *numbers[i] << " has " << lengths[i] << " letters.\n";
      }
    ```
	
 ```cpp
 one has 3 letters.
 two has 3 letters.
 three has 5 letters.
 four has 4 letters.
 five has 4 letters.
 ```
- `mem_fun_ref()`：
 ```cpp
     vector<string> numbers;
     numbers.push_back("one");
     numbers.push_back("two");
     numbers.push_back("three");
     numbers.push_back("four");
     numbers.push_back("five");
   
     vector<int> lengths(numbers.size());
     transform(numbers.begin(), numbers.end(), lengths.begin(), mem_fun_ref(&string::length));
   
     for (int i = 0; i < 5; i++) {
       cout << numbers[i] << " has " << lengths[i] << " letters.\n";
     }
    ```
    
  ```cpp
  one has 3 letters.
  two has 3 letters.
  three has 5 letters.
  four has 4 letters.
  five has 4 letters.
  ```
  

> `mem_fun()` 和 `mem_fun_ref()` 可以在 `流操作`時將 `成員函數` 轉化為 `函數對象`，可以用於 `調用對象的getter函數`。
> `mem_fun()`：適用於 `指針版本`，如 `容器的元素` 是 `指針類型`
> `mem_fun_ref()`：適用於 `引用版本`，如 `容器的元素` 是 `引用類型`

#### Instrumental Types

- `unary_negate()` 和 `binary_negate()`：和 `not1()` 和 `not2()` 一樣 `雞肋`
- `binder1st()`和 `binder2nd()`：有點像 `編譯版的bind1st()`和 `編譯版的bind2nd()`
    
    ```cpp
      binder1st<greater<int>> greater_than_10(greater<int>(), 10);
    ```
    
- `pointer_to_unary_function()` 和 `pointer_to_binary_function()`
- `mem_fun_t()` ， `mem_fun1_t()`，`const_mem_fun_t()`，`const_mem_fun1_t()`，`mem_fun_ref_t()`，`mem_fun1_ref_t()`，`const_mem_fun_ref_t()`，`const_mem_fun1_ref_t()`
    

### Initializer List

`initializer_list` 是一種 `數據類型`，存儲 `某種類型的元素`的 `列表`。

```cpp
  auto a = {10,20,30};
  copy(a.begin(),a.end(),ostream_iterator<int>(cout, " "));
```

```cpp
10 20 30
```

### Vector

數據結構 `矢量`，提供和 `數組`等效的功能。

#### Constructor & Destructor

##### Constructor

- `empty container constructor`
- `initializer list constructor`
- `fill constructor`: k elements with specific value

```cpp
  vector<int> v(10, 3);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
3 3 3 3 3 3 3 3 3 3
```

- `range constructor` copy from `ierator`

```cpp
  vector<int> src = {0,1,2,3};
  vector<int> v(src.begin() + 1, src.end());
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
1 2 3
```

- `copy constructor (and copying with allocator)`: copy from `another vector`

```cpp
  vector<int> src = {0,1,2,3};
  vector<int> v(src);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
0 1 2 3
```

> 以下兩種寫法都是調用 `拷貝構造函數`。
> 
> > `operator=` 賦值運算符 等價於 `copy constructor`
 ```cpp
 vector<int> a;
 vector<int> b(a);
 vector<int> b = a;
 ```

- `move constructor (and moving with allocator)`

```cpp
  vector<int> a = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  vector<int> b(a, a.get_allocator());

  cout << "a: ";
  copy(a.begin(), a.end(), ostream_iterator<int>(cout, " "));
  cout << endl;
  cout << "b: ";
  copy(b.begin(), b.end(), ostream_iterator<int>(cout, " "));
```

```cpp
a: 0 1 2 3 4 5 6 7 8 9
b: 0 1 2 3 4 5 6 7 8 9
```

##### Destructor

`vector`會 `自動地` 釋放 `元素所使用的內存`

#### Iterators

- `begin()` and `end()`
- `rbegin()` and `rend()`
- `cbegin()` and `cend()`
- `crbegin()` and `crend()`

#### Capacity

- `size()`
    
    > `size`信息是作為 `vector的屬性`而存在的。
    > 可在 `常數時間`內獲取到。
    > > 但 `strlen()`不是，對於 `大字符串`，不要頻繁地調用 `strlen()`
    
- `resize()`
    
    ```cpp
      vector<int> v = {0,1,2};
      v.resize(5);
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 1 2 0 0
    ```
    
- `empty()`
    
- `capacity()`：獲取 `vector的底層數組`的 `大小`
    
- `reserve()`
    
    ```cpp
      vector<int> v = {0,1,2};
      printf("before reserve: capacity = %d\n", v.capacity());
      v.reserve(10);
      printf("after reserve: capacity = %d\n", v.capacity());
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    before reserve: 3
    after reserve: 10
    0 1 2
    ```
    
    > 如果 `事先知道`需要添加的 `元素的數量`，則可以先用 `reserve()`來 `一次性`完成 `預分配`。
    > 
    > > `reserve(int n)` 只 `保證` `vector的底層數組`的 `大小`足夠滿足 `n元素`，如果 `vector的底層數組`已經大於n，則該語句會被簡單地忽略。
    > 
    > 如果沒有使用 `reserve()`，則在插入 `大量元素`時，`vector的底層數組`可能會經歷 `多次的動態擴容`，浪費不必要的資源。
    
- `shrink_to_fit()`：`動態縮容`使得 `capacity = size`
    

#### Element Access

- Return `reference`
    
    - `operator []`，`at()`
    - `front()` ，`back()`
    
    > 盡管這些 `access function`返回的確實是 `引用`，
    > 
    > 但還需要註意 `隱含的值拷貝`。
    > 
    > 如果真的希望 `取到vector的元素的引用`，並且讓 `數據修改`反映到 `vector內部的元素`中，需要設置 `refenence LHS`以避免 `值拷貝`
    > 
    > - `value copy`
    > 
     ```cpp
       vector<int> v = {0,1,2};
       int num = v[0];
       num = 43;
       copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
     ```
     
     ```cpp
     0 1 2
     ```
     
     - `reference copy`
     
     ```cpp
       vector<int> v = {0,1,2};
       int & num = v[0];
       num = 43;
       copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
     ```
     
     ```cpp
     43 1 2
     ```
    
- Return `reference`
    
    ```cpp
      vector<int> v = {0, 1, 2};
      int *num = v.data();
      copy(num, num + 3, ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 1 2
    ```
    
    > `data()`返回的是 `vector的底層數組`
    

#### Modifiers

- `assign`：assign n elements with specific values

```cpp
  vector<int> v(10);
  v.assign(3, 5);
  copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
```

```cpp
5 5 5
```

> n.b. `assign` 相當於 `重新初始化`vector，`vector中舊的數據`會被 `刪除`！

- `push_back()` and `pop_back()`
    
- `insert()` and `erase()`
    
    - `insert()`
    
    ```cpp
      vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      v.insert(v.begin() + 1, 3, 9999);
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 9999 9999 9999 1 2 3 4 5 6 7 8 9
    ```
    
    > n.b. `insert`的 `position`的 `語義`是：`欲插入元素` 將插入在 `該position的元素之前`。
    > 
    > 或者等價地說：`欲插入元素`在 `插入後` 應該 `位於position的位置`
    
    - `erase()`
        
        ```cpp
          vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
          v.erase(v.begin() + 1);
          copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
        ```
        
        ```cpp
        0 2 3 4 5 6 7 8 9
        ```
        
- `clear()`
    
- `swap()`
    
    ```cpp
      vector<int> a(3, 100);
      vector<int> b(5, 200);
    
      a.swap(b);
      int & the_value_from_a = a[0];
      the_value_from_a = 9999;
    
      copy(a.begin(), a.end(), ostream_iterator<int>(cout, " "));
      cout << endl;
      copy(b.begin(), b.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    9999 200 200 200 200
    100 100 100
    ```
    
    > `swap()`原理是直接 `交換` 兩個 `vector的底層數組的指針`
    
- `emplace()`
    
    ```cpp
      vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      v.emplace(v.begin() + 1, 9999);
      copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 9999 1 2 3 4 5 6 7 8 9
    ```
    
    > 相比於 `insert()`，`push_front()` 和 `push_back()` 將 `構造好的元素` 傳遞給 `Modifier`。
    > 
    > `emplace()`並不傳遞 `已經構造好的元素`，而是傳遞 `用於構造這個元素的參數列表`：這樣做有利於 `減少不必要的元素值拷貝`，而 `直接在vector的底層數組`上 `構造元素`。
    
    > `emplace_back()` 同理。
    > 
     ```cpp
     vector<int> v = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
     v.emplace_back(9999);
     copy(v.begin(), v.end(), ostream_iterator<int>(cout, " "));
     ```
     
     ```cpp
     0 1 2 3 4 5 6 7 8 9 9999
     ```
    

#### `vector<bool>`

- `vector<bool>` 是 `vector`的 `模板特例化`，它和 `generic vector template`相比，有以下特點：
- `vector<bool>`的 `底層存儲`並不一定是用 `bool[]`的。`library`可能選擇 `其他底層存儲方式`，並且盡可能地保證 `僅使用1位來表示真值`
- 不同於 `常規的vector`使用 `allocator` `分配對象`， `vector<bool>`的 `位數據`可以被 `直接地設置`在 `內部存儲`
- 多出一個 `flip()` 翻轉函數
- `vector<bool>` 的 `accesstor`返回的是 用於指向單個為的 `reference類型` 而不是 `bool類型`

> 也就是說，使用 `vector<bool>` 並不會比 `bitset<>` 占用 `更多空間`或 `更多時間`。
> 在正常情況下，無法創建 `真正的泛化的 vector<bool>`，而取而代之的是 `特例化的 vector<bool>`

### list

STL中的 `list` 是 `doubly_linked_list`

如果需要 `singly_linked_list` 則需要使用 `forward_list`。

> n.b. `forward_list`的 `性能` 幾乎和 `Handwritten C-style singly-linked-list`沒有差別！
> 
> > `forward_list`為了 `性能`甚至沒有 `size()`。

#### Operations

- `splice()`
    
    ```cpp
      list<int> list1 = {0, 1, 2};
      list<int> list2 = {100, 200, 300};
      list1.splice(list1.begin(), list2);
    
      cout << "list1: ";
      copy(list1.begin(), list1.end(), ostream_iterator<int>(cout, " "));
      cout << endl << "list2: ";
      copy(list2.begin(), list2.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    list1: 100 200 300 0 1 2
    list2:
    ```
    
    > `splice()` 可以 `非常方便`地對 `2個鏈表`進行 `銜接操作`。
    
- `remove()`
    
    ```cpp
      list<int> list1 = {0, 1, 2, 3, 4, 2, 2, 2};
      list1.remove(2);
      copy(list1.begin(), list1.end(), ostream_iterator<int>(cout, " "));
    ```
    
    ```cpp
    0 1 3 4
    ```
    
    > n.b. `remove()`的 `語義`是 `移除所有的符合條件的相等元素`，而不是 `移除第一個符合條件的相等元素`
    > 
    > > 帶謂詞的版本 `remove_if()`
    
- `unique()` and `merge()`
    
    > n.b. `unique()`的 `語義` 和之前所提到的 `std::unique()`是相同的，都是指 `remove consecutive equivalent elements`，如果需要確保 `移除整個容器中的相等元素`，需要進行預處理 `sort()`
    

### Array

STL的`array`數據結構僅僅是 `ordinary array` 的 `包裝類`。

```cpp
  array<int, 10> num = {0,1,2,3};
  copy(num.begin(), num.end(), ostream_iterator<int>(cout, " "));
```

```cpp
0 1 2 3 0 0 0 0 0 0
```

> `array`提供了比 `ordinal array`更加方便的 `輔助函數`，但又沒有 `vector`的 `復雜性`。
> 
> 如果你期望保持 `ordinal array`的眾多 `特性`，同時不期望使用 `auto extendend/extracted`
> 
 ```cpp
 array<int, 10> num = {0, 1, 2, 3};
 num.fill(100);
 printf("size = %d\n", num.size());
 copy(num.begin(), num.end(), ostream_iterator<int>(cout, " "));
 ```
 
 ```cpp
 size = 10
 100 100 100 100 100 100 100 100 100 100
 ```
 
 - `size()`
 
 傳統的`C-Style數組`在 `參數傳遞`時比較麻煩，但使用 `array`可以避免這個問題。
 
 - `iterator`
 
 `array`可以使用 `iterator對象`，與其他STL函數的配合編碼更加方便。
 
 > 另外，`array`繼承了 `ordinary`的 `傳統特性`：允許 `下標越界`。
  ```cpp
  array<int, 10> arr;
  
  for (int i = -10; i < 20; ++i) {
   cout << arr[i] << " ";
  }
  ```
  
  ```cpp
  4199804 0 6422000 0 -6 -1 0 0 0 0 8 0 4199705 0 8 0 75 0 8224624 0 16 11 8224592 0 4199367 0 0 0 75 0
  ```
 
 - `fill()`
 
 `array`在 `完全兼容` `ordinal array`的所有 `初始化方法`之外，
 
 還提供了一個非常有用的函數：`fill()`
 
 > 對於 `ordinal array`，我們可以使用 `memset()`。
 > 
 > 但遺憾的是，該函數只適用於填充 `0`和 `-1`
 
 ```cpp
   array<array<int, 10>, 3> num;
   num.fill(array<int, 10>{100,200,300});
   for (int i = 0; i < num.size(); ++i) {
     for (int j = 0; j < num[i].size(); ++j) {
       cout << num[i][j] << " ";
     }
     cout << endl;
   }
 ```
 
 ```cpp[
 100 200 300 0 0 0 0 0 0 0
 100 200 300 0 0 0 0 0 0 0
 100 200 300 0 0 0 0 0 0 0
 ```

### deque

STL的 `deque` 即 `doubly linked list`。

此外，STL的 `stack`和 `queue` 均是基於 `deque`實現的

### priority_queue

不同於Java的 `PriorityQueue`，C++的STL的 `priority_queue`默認是 `大頂堆`。

```cpp
template <class T, class Container = vector<T>,
  class Compare = less<typename Container::value_type> > class priority_queue;
```

> `priority_queue` 底層使用的是 `heap functions`。
> 
> `data source`可以來自 `多種類型的容器`，只需要通過 `range constructor`來構造 `priority_queue`即可。

- `max-imum heap`
    
    ```cpp
      vector<int> a = {1, 5, 2, 8, 3, 6, 4};
      priority_queue<int> PQ(a.begin(), a.end());
    
      while (!PQ.empty()) {
        cout << PQ.top() << " ";
        PQ.pop();
      }
    ```
    
    ```cpp
    8 6 5 4 3 2 1
    ```
    
- `min-imum heap`
    
    ```cpp
      vector<int> a = {1, 5, 2, 8, 3, 6, 4};
      priority_queue<int, vector<int>, greater<int>> PQ(a.begin(), a.end());
    
      while (!PQ.empty()) {
        cout << PQ.top() << " ";
        PQ.pop();
      }
    ```
    
    ```cpp
    1 2 3 4 5 6 8
    ```
    
    > 同理，也可以使用 `custom comparison function`
    ```cpp
    vector<int> a = {1, 5, 2, 8, 3, 6, 4};
    struct comp {
       bool operator()(const int &o1, const int &o2) {
         return o1 > o2;
       }
    };
    priority_queue<int, vector<int>, comp> PQ(a.begin(), a.end());
    
    while (!PQ.empty()) {
     cout << PQ.top() << " ";
     PQ.pop();
    }
    ```
    
    ```cpp
    1 2 3 4 5 6 8
    ```
   

### Map

`map`中的 `條目 (entry)`類型為

```cpp
typedef pair<const Key, T> value_type;
```

#### map

STL中的 `map`底層數據結構是基於 `Red-Black Tree` 的，通過 `operator <`來完成 `比較`。

而且，可以直接對 `map`進行 `叠代`來得出 `已排序的key序列`

- `operator[]`
    - 如果key已存在，則返回 map[key]
    - 如果key不存在，則等價於：(*((this->insert(make_pair(k,mapped_type()))).first)).second
    > 如果使用 `at()`，則會在 `key不存在時`，拋出 `異常`
    
    ```cpp
    map<int, string> m;
    m[1] = "first";
    m[2] = "second";
    m[3] = "third";
    m[4] = "four";
    printf("size = %d\n", m.size());
    m[5];
    printf("size = %d, value = %s\n", m.size(), m[5].c_str());
    m[100000000];
    printf("size = %d, value = %s\n", m.size(), m[100000000].c_str());
    ```
    
    ```cpp
    size = 4
    size = 5, value =
    size = 6, value =
    ```
    
    n.b. 無論何時，對 `map`使用 `operator[]` 至多只會使得 `size` `增1`
    
    n.b. 當 `訪問map中不存在的key時`，會自動 `創建並插入pair (按默認值創建value)`
    
    如果 `value的類型`是 `UDT`，則需要提供 `no parameter constructor`，否則無法通過編譯。
    如下面的例子，將 `編譯失敗`：
    
    ```cpp
    class Person {
    public:
     string name;
    
    public:
     Person(const string &name) : name(name) {}
    };
    
    
    int main() {
    
    map<int, Person> m;
    m[0];
    printf("size = %d, value = %s\n", m.size(), m[0].name.c_str());
    
    return 0;
    }
    ```
    
    ```cpp
    main.cpp:42:7: note: candidate: 'Person::Person(Person&&)'
    main.cpp:42:7: note:   candidate expects 1 argument, 0 provided
    ```
   

- iterator

```cpp
  map<int, string> m;
  m[2] = "second";
  m[1] = "first";
  m[3] = "third";
  m[4] = "four";

  for (auto iter = m.begin(); iter != m.end(); iter++) {
    cout << iter->first << ", " << iter->second << endl;
  }
  return 0;
```

```cpp
1, first
2, second
3, third
4, four
```

> 由於 `map`底層使用的是 `red black tree`，所以可以利用 `map`來進行 `排序`

- `insert()`：通常來說可以使用 `operator[]` 代替
- `erase()`

```cpp
  map<int, string> m;
  m[2] = "second";
  m[1] = "first";
  m[3] = "third";
  m[4] = "four";

  m.erase(2);
  m.erase(5);

  for (auto iter = m.begin(); iter != m.end(); iter++) {
    cout << iter->first << ", " << iter->second << endl;
  }
```

```cpp
1, first
3, third
4, four
```

> n.b. 如果 `欲刪除的key`不存在，則 `無事發生`

- `find()`：get `iterator` to element

```cpp
  map<int, string> m;
  m[2] = "second";
  m[1] = "first";
  m[3] = "third";
  m[4] = "four";

  auto iter = m.find(5);
  printf(iter == m.end() ? "not found" : "found");
  printf("\nsize = %d", m.size());
```

```cpp
not found
size = 4
```

> 相比於 `operator[]`在 `未找到元素時`會 `自動插入默認對`而言，使用 `find()`來 `判斷元素是否存在`可以避免 `浪費空間`。
> 
> 而且更重要的，`find()`是 `冪等的`

- `count()`：count elements with a specific key
    
    > n.b. 如果僅僅是為了判斷 `是否存在某個key`，那麽相比於 `find()`寫法的麻煩，我們可以用 `count() == 0`來代替 `find()`
    

#### miltimap

與 `map` 的區別在於， `miltimap`支持 `不同pair有重復的key`。

- `erase()`
    
    > 對於 `傳值的erase()`，將 `刪除所有符合條件的元素`。
    

### Set

#### set

STL的 `set` 是基於 `red-black tree`的，此外，它的 `元素`必須是 `const`的，只能 `插入元素`或 `刪除元素`，而不能 `修改元素`。

```cpp
  set<int> S;
  S.insert(1);
  S.insert(2);
  S.insert(2);
  S.insert(3);
  S.insert(4);

  printf("size = %d\n", S.size());
  printf("count(2) = %d\n", S.count(2));
```

```cpp
size = 4
count(2) = 1
```

> n.b. 對於 `set`來說，如果 `欲插入的元素`已存在，則會忽略後續的插入（而不是 `覆蓋插入`）。

#### multiset

### unordered_map

#### unordered_map

`unordered_map` 基於 `bucket`而非 `red-black tree`，通過 `hash function`來 `索引` 指定的 `key`。

> 因此，`unordered_map` 中的 `key` 是 `無序的`

> 因此，通常比 `map` 更快

- `Bucket Functions`

| Function | Note |
| ---- | ---- |
| bucket_count() | return number of buckets |
| max_bucket_count() | return maximum number of buckets |
| bucket_size() | return bucket size |
| bucket() | locate element's bucket |

- `Hash Policy Functions`

| Function | Note |
| ---- | ---- |
| load_factor() | return load factor |
| max_load_factor() | get or set maximum load factor |
| rehash() | set number of buckets |
| reserve() | request a capacity change |
#### unordered_multimap

### unordered_set

#### unordered_set

與 `unordered_map`類似，均是基於 `bucket`的。

#### unordered_multiset

### Compute Remainder and Quotient

- `remainder()`

### Branch

- `setjmp()` and `longjmp()`

```cpp
  jmp_buf  env;
  printf("before set jump\n");
  int val = setjmp(env);
  printf("after set jump\n");

  printf("val = %d\n", val);

  printf("before longjmp()\n");
  if (!val) longjmp(env, 1);
  printf("after longjmp()\n");
```

```cpp
before set jump
after set jump
val = 0
before longjmp()
after set jump
val = 1
before longjmp()
after longjmp()
```

> `goto`只支持 `函數內跳轉`，但 `setjmp() and longjmp()`可以支持 `跨函數跳轉`

> 使用 `setjmp()`保存 `過程調用環境`，然後用 `longjmp()`進行 `jump`。

 一個跨函數的例子。
 
 ```cpp
 int foo();
 int bar();
 jmp_buf env;
 int val;
 
 int foo() {
   printf("enter foo()\n");
 
   val = setjmp(env);
 
   printf("before call bar()\n");
   bar();
   printf("after call bar()\n");
 
   printf("leave foo()\n");
   return 100;
 }
 
 int bar() {
   printf("enter bar()\n");
 
 
   printf("before longjmp()\n");
   if (val != 1) longjmp(env, 1);
   printf("before longjmp()\n");
 
   printf("leave bar()\n");
   return 200;
 }
 
 
 int main() {
   foo();
   return 0;
 }
 ```
 
 ```cpp
 enter foo()
 before call bar()
 enter bar()
 before longjmp()
 before call bar()
 enter bar()
 before longjmp()
 before longjmp()
 leave bar()
 after call bar()
 leave foo()
 ```

- `goto`

```cpp
int main() {

  for (int i = 0; i < 100; ++i) {
    for (int j = 0; j < 100; ++j) {

      if (i == 10 && j == 20) {
        goto ok;
      }
    
    }
  }

  ok: 0xdead;

  printf("bye\n");
  return 0;
}
```

```
bye
```

 關於 `跳出外層循環`，更推薦的寫法是給 `外層循環`加 `控製標記`
 
 ```cpp
 int main() {
 
   bool flag = true;
   for (int i = 0; flag && i < 100; ++i) {
     for (int j = 0; j < 100; ++j) {
 
       // break the outer loop
       if (i == 10 && j == 20) {
         flag = false;
         break;
       }
     
     }
   }
 
   printf("bye\n");
   return 0;
 }
 ```

### The incremental of size_t and size_type

```cpp
  char c_str[] = "china";
  string cpp_str = "china";

  printf("strlen(c_str) = %d\n", strlen(c_str));
  printf("cpp_str.size() = %d\n", cpp_str.size());

  //
  int c_str_size = strlen(c_str) + 1;
  printf("c_str_size = %d\n", c_str_size);

  int cpp_str_size = cpp_str.size() + 1;
  printf("cpp_str_size = %d\n", cpp_str_size);
```

```cpp
strlen(c_str) = 5
cpp_str.size() = 5
c_str_size = 6
cpp_str_size = 6
```

> `size_t`和 `size_type` 本質上是 `unsigned long long`
> 
> 在 `強製轉化` 為 `int` 時屬於 `narrowing conversion`。
> 
> 對他們執行 `遞增操作`時應使用 `遞增操作符` 而不是直接 `+1`。
> 
> > 直接 `+1`的含義為 `將unsigned long long 窄化為int，然後加上int型的1`。該操作是 `未定義的`，取決於具體實現。

 ```cpp
 Clang-Tidy: Narrowing conversion from 'unsigned long long' to signed type 'int' is implementation-defined
 ```

### Exit the program

- Terminate
    - `abort()`：abnormal termination, raises the `SIGABRT signal`, do not cleanup
    - `exit()`：normal termination, do cleanup
    - `quick_exit()`：normal termination, do not cleanup
    - `_Exit()`
- Terminate
    
    - `atexit()`
        
        ```cpp
          auto post = [](){
            printf("bye\n");
          };
          atexit(post);
        
          printf("before return\n");
        ```
        
        ```cpp
        before return
        bye
        ```
        
    
    - `at_quick_exit()`
- Get system environment
    
    - `getenv()`
        
        ```cpp
          char * java_home = getenv("JAVA_HOME");
          printf("%s", java_home);
        ```
        
        ```cpp
        D:\Program Files (x86)\Java\jdk1.8.0_291
        ```
        
- Execute commands
    
    - `system()`

### Time

#### Time Manipulation

- `clock()`

```cpp
int main() {

  for (int i = 0; i < 1000000; ++i) {}

  clock_t t = clock();
  printf("clock ticks since the program launched = %d", t);

  return 0;
}
```

```cpp
clock ticks since the program launched = 10
```

> `clock()` 計數的是 `從程序啟動以來所經歷的時間刻`。

 ```cpp
   typedef long clock_t;
 ```

> 如果需要獲取 `秒數`則要除以 `CLOCKS_PER_SECOND`

- `time()`

```cpp
int main() {

  time_t timer;
  time(&timer);

  printf("timer = %d\n", timer);
  return 0;
}
```

```cpp
timer = 1650518640
```

 ```cpp
 __MINGW_EXTENSION typedef __int64 __time64_t;
 typedef __time64_t time_t;
 ```
 
> `time_t`本質上是 `__int64`。
> 
> 直接使用 `__int64` 或者 `long long`也可以被接受。

- `mktime()`

```cpp
int main() {

  /* Get current timestamp & use localtime() to get related struct tm */
  time_t raw_time;
  time(&raw_time);
  struct tm * timeinfo = localtime(&raw_time);

  /* Modify the struct tm & use mktime() to get related timestamp */
  timeinfo->tm_year = 2022 - 1900;
  timeinfo->tm_mon = 4 - 1;
  timeinfo->tm_mday = 21;

  time_t timestamp = mktime(timeinfo);
  printf("timestamp = %d\n", timestamp);
  return 0;
}
```

```cpp
timestamp = 1650519507
```

`localtime()`：timestamp -> tm
`mktime()` ：tm -> timestamp

> 對於 `struct tm`實例，我們不是直接構造，而是通過獲取 `當前時間戳`，然後轉化得到 `當前時間戳所對應的tm`，再修改 `tm的屬性字段`，最後通過 `mktime()`來獲得 `修改後的tm對應的時間戳`

> `tm_wday` 和 `tm_yday`字段被 `忽略`

> `year`從 `1900`開始，`month`從 `0`開始

- `difftime()`

#### Conversion

- `asctime()`：tm -> string
- `ctime()`：timestamp -> string
- `gmtime()`：timestamp -> tm(UTC)
- `localtime()`：timestamp tm(local)
- `strftime()`：format tm -> string

> `strftime()`雖然提供了 `格式化tm結構`的功能，但 `struct tm`本身已經包含了足夠的信息，可以非常方便地 `自定義格式化函數`

### Code Pointer

除了常規的類型指針外，傳統C語言還有一種指針稱作 `代碼指針`。

通過對 `代碼片段`運用 `地址運算符`可以得到 `該代碼片段的地址`。

```cpp
int main() {

  s1:
  printf("hi\n");

  printf("address of s1 = %d\n", && s1);

  void (*foo) (void) = reinterpret_cast<void (*)(void)>(4199857);
  foo();

  return 0;
}
```

```cpp
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
address of s1 = 4199857
hi
......
```

### Remove Const-Qualified

#### `const_cast<>()`

```cpp
  string str = "abc";
  char *str_data = const_cast<char *>(str.data());
  str_data[0] = 'A';
  cout << str;
```

```cpp
Abc
```

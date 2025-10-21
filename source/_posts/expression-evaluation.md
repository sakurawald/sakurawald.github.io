---
title: "expression evulation"
date: 2021-09-13 08:53:00
tags:
  - algorithm
---
# Expression Evaluation

## Problem

1. Given a string, including: + - * / ^ () and numbers.
2. Evaluate this string.

eg: `2*((11+3)*(2+3)^2)+2` = `702`

## Analysis
Expression evaluation problem: Operand stack and operator stack need to be handled properly. Operand stack only needs to be scanned and stacked one by one according to the high-order priority of the string, while operator stack needs to correctly handle the priority of operators. Operators scanned in the future may affect previous operators. (Therefore, the idea of ​​recursive solution is clear.)

Recursive solution of reverse Polish notation: Use the implicit function call stack to handle operator priority, and treat each part of the expression as a token of different sizes, such as (3+6/2) and 100 can be regarded as 1 token.

Regarding the priority of operators, when processing 4*3^2, we still scan according to the high-order priority rule of the string.

Each token_value() function call stack contains 1 operator or operand

When the recursive top-down process is completed, we scan and read the entire expression

Next, in the recursive bottom-up process, we will calculate each part of the expression one by one, and replace the calculation results of the expression part into the expression

According to the operator priority corresponding to the implicit function call stack during recursion, we successfully make operand 3 correctly perform ^ operation with operand 2,

Instead of incorrectly performing * operation with operand 4 (although we scanned operand 4 and operator * first)

Next, we only need to complete the recursive bottom-up process step by step to complete the calculation of the entire expression

Finally complete the calculation of the entire expression

## Solution: Recursive

```
#include <iostream>
#include <math.h>
using namespace std;

typedef int number;
number token_value(int priority) {
    number res;
    if (priority == 0) {
        res = 0;
        char c = cin.peek();
        if (c == '(') {
            cin.get(); // get (
            res = token_value(3); // as a new expression
            cin.get();  // get )
        } 
        while (isdigit(c)) { // read a num
            res = (10 * res) + (c % 48); // Nice Try.
            cin.get(); // get digit
            c = cin.peek();
        }
    } else {
        res = token_value(priority - 1);
        while (true) {
            char op = cin.peek();
            if (priority == 1 && op == '^') {
                cin.get(); // get ^
                number val = token_value(priority - 1);
                res = round(pow(res, val));
            } else if (priority == 2 && (op == '*' || op == '/')) {
                cin.get(); // get * or /
                number val = token_value(priority - 1);
                op == '*' ? res *= val : res /= val;
            } else if (priority == 3 && (op == '+' || op == '-')) {
                cin.get(); // get + or -
                number val = token_value(priority - 1);
                op == '+' ? res += val : res -= val;
            } else break;
       }
   }
    return res;
}

int main() {
    cout << token_value(3);
    return 0;
}
```

## Solution: Iterative

```
#include <stack>
#include <map>
#include <iostream>
#include <cmath>

using namespace std;

map<char, int> priority_map{{'+', 1},
                            {'-', 1},
                            {'*', 2},
                            {'/', 2},
                            {'^', 3}};
typedef int number;
stack<number> nums;
stack<char> ops;

void eval() {
  number num2 = nums.top(); nums.pop();
  number num1 = nums.top(); nums.pop();
  char op = ops.top(); ops.pop();

  if (op == '+') nums.push(num1 + num2);
  if (op == '-') nums.push(num1 - num2);
  if (op == '*') nums.push(num1 * num2);
  if (op == '/') nums.push(num1 / num2);
  if (op == '^') nums.push(round(pow(num1, num2)));
}

int main() {
  /* Trans InOrderExpr to PostOrderExpr */
  while (cin.peek() != '\n') {
    // get digit.
    if (isdigit(cin.peek())) {
      number num = 0;
      while (isdigit(cin.peek())) {
        num = (num * 10) + cin.peek() % 48;
        cin.get();
      }
      nums.push(num);
    } else {
      // get operators.
      if (cin.peek() == '(') {
        ops.push(cin.peek()); // push (
        cin.get(); // get (
      } else if (cin.peek() == ')') {
        while (ops.top() != '(') eval();
        ops.pop(); // pop (
        cin.get(); // get )
      } else {
        while (!ops.empty() && priority_map[ops.top()] >= priority_map[cin.peek()]) eval();
        ops.push(cin.peek());
        cin.get(); // get operator
      }
    }
  }

  /* Calc PostorderExpr */
  while (!ops.empty()) eval();

  /* Output */
  cout << nums.top();
}
```

#!/bin/bash
# DemoStar - Shell 函数包装

# 取消可能存在的别名
unalias cat 2>/dev/null
unalias less 2>/dev/null
unalias grep 2>/dev/null

# 检查演示模式是否开启
is_demo_mode() {
  [ -f "$HOME/.demostar/.demo-state" ]
}

cat() {
  if is_demo_mode && command -v scat &>/dev/null; then
    scat "$@"
  else
    command cat "$@"
  fi
}

less() {
  if is_demo_mode && command -v sless &>/dev/null; then
    sless "$@"
  else
    command less "$@"
  fi
}

grep() {
  if is_demo_mode && command -v sgrep &>/dev/null; then
    sgrep "$@"
  else
    command grep "$@"
  fi
}

#!/bin/bash
# DND Helper - 现代 macOS Focus/DND 管理

DND_DB="$HOME/Library/DoNotDisturb/DB/Assertions.json"

# 检测当前 DND 状态 (返回 0=关闭, 1=开启)
get_dnd_status() {
  python3 -c "
import json
with open('$DND_DB') as f:
    data = json.load(f)
for item in data.get('data', []):
    active = {r['assertionUUID'] for r in item.get('storeAssertionRecords', [])}
    invalid = {r['invalidationAssertion']['assertionUUID'] for r in item.get('storeInvalidationRecords', [])}
    print('1' if (active - invalid) else '0')
    break
" 2>/dev/null || echo "0"
}

# 切换 DND 状态
toggle_dnd() {
  osascript << 'EOF' 2>/dev/null
tell application "System Events"
    tell process "ControlCenter"
        click menu bar item 2 of menu bar 1
        delay 1.5
        click checkbox 1 of group 1 of window 1
        delay 0.5
        key code 53
    end tell
end tell
EOF
}

# 设置 DND 状态 (参数: 0=关闭, 1=开启)
set_dnd() {
  local target="$1"
  local current=$(get_dnd_status)
  if [ "$current" != "$target" ]; then
    toggle_dnd
    sleep 0.5
  fi
}

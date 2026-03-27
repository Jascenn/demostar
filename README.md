# ⭐ DemoStar

> 演示模式一键配置 - 让你的技术演示更专业、更安全

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey.svg)](https://github.com/Jascenn/demostar)

## ✨ 功能特性

- 🔒 **自动数据脱敏** - 隐藏 API Keys、Tokens、密码等敏感信息
- ⌨️ **键盘按键显示** - 实时显示按键操作（macOS）
- 🚀 **零依赖** - 纯 Shell 实现，开箱即用
- 🎯 **透明集成** - 自动包装 cat/less/grep 命令
- 📦 **一键安装** - 30 秒完成配置

## 🎬 使用场景

- 技术演示和直播
- 录制教学视频
- 截图分享到社交媒体
- 团队内部培训
- 开源项目文档

## 🚀 快速开始

### 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/Jascenn/demostar/main/install.sh | bash
source ~/.zshrc  # 或 source ~/.bashrc
```

### 使用示例

**数据脱敏（自动生效）：**

```bash
# 查看配置文件 - 自动脱敏
cat .env
# ANTHROPIC_API_KEY=sk-a****ABCD

# 查看真实内容
command cat .env
# ANTHROPIC_API_KEY=sk-ant1234567890...
```

**启动键盘指示（macOS）：**

```bash
open -a KeyCastr
```

## 📋 支持的格式

### ENV 文件
```bash
ANTHROPIC_API_KEY=sk-ant1234567890abcdefghijklmnopqrstuvwxyz1234567890ABCD
# 脱敏后：sk-a************************************************ABCD
```

### JSON 文件
```json
{
  "apiKey": "sk-proj1234567890abcdefghijklmnopqrstuvwxyz123456WXYZ"
  // 脱敏后："sk-p*********************************************WXYZ"
}
```

### DATABASE_URL
```bash
DATABASE_URL=postgresql://user:pass1234567890@localhost:5432/db
# 脱敏后：postgresql://user:pass******7890@localhost:5432/db
```

## 🎨 自定义配置

编辑 `~/.demostar/config/custom-fields.conf` 添加自定义敏感字段：

```bash
# 自定义敏感字段（一行一个）
MY_CUSTOM_KEY
INTERNAL_TOKEN
```

## 📚 文档

- [使用指南](docs/USAGE.md)
- [常见问题](docs/FAQ.md)
- [自定义字段](docs/CUSTOM-FIELDS.md)

## 💎 赞助商

本项目由 [LionCC API](https://lioncc.ai) 提供支持

LionCC API 提供稳定、高性价比的 AI 模型 API 服务，支持 Claude、GPT-4、Gemini 等主流模型。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE)

## 🙏 致谢

- 数据脱敏引擎基于行业最佳实践
- KeyCastr 键盘指示工具

---

⭐ 如果这个项目对你有帮助，请给个 Star！


# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0] - 2026-03-27

### Added
- `demostar status` 命令查看当前演示模式状态
- 直接执行 `demostar` 显示完整用法

### Fixed
- 数据脱敏现在绑定演示模式，stop 后自动恢复正常显示
- 修复安装脚本 Shell 环境检测（优先 zsh）
- stop 时只恢复被改变的设置，不影响原本状态

---

## [1.0.0] - 2026-03-27

### Added
- 初始版本发布
- 支持自动脱敏 50+ 种敏感字段
- 支持 JSON、ENV、YAML 格式
- 支持自定义字段配置
- 纯 Shell 实现，零依赖
- 完整文档和使用指南

### Features
- `cat/less/grep` 命令自动脱敏
- 保留前后 4 个字符便于识别
- 原文件不被修改
- 一键安装/卸载

---

## [Unreleased]

### Planned
- 命令行工具（status/add-field/test）
- 更多文件格式支持
- 性能优化

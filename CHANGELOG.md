# Changelog

All notable changes to this project will be documented in this file.

## [1.3.0] - 2026-03-29

### Added
- 跨平台支持：自动检测操作系统，非 macOS 系统也能使用
- 响应式网站设计：支持手机、平板等多端访问

### Changed
- 优化功能检测：只在支持的平台上启用特定功能
- 改进移动端布局：安装命令自动换行，避免溢出

---

## [1.2.0] - 2026-03-29

### Fixed
- 修复现代 macOS (12+) 勿扰模式检测失效问题
- 使用 Focus Assertions.json 替代废弃的 notificationcenterui
- 通过 AppleScript 控制 Control Center 实现 DND 切换
- 正确保存和恢复演示前的 DND 状态

### Added
- 新增 `lib/dnd-helper.sh` 支持现代 macOS Focus 模式

---

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

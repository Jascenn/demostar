#!/bin/bash
# DemoStar 安装脚本 - 演示模式一键配置

set -e

INSTALL_DIR="$HOME/.demostar"

echo "⭐ DemoStar 安装程序"
echo ""

# 检测操作系统
detect_os() {
  case "$(uname -s)" in
    Darwin*) echo "macos" ;;
    Linux*)  echo "linux" ;;
    *)       echo "unknown" ;;
  esac
}

OS=$(detect_os)
echo "📍 检测到系统: $OS"

# 检查依赖
check_dependencies() {
  echo "🔍 检查系统依赖..."
  local missing=()

  if ! command -v sed &> /dev/null; then
    missing+=("sed")
  else
    echo "  ✓ sed"
  fi

  if ! command -v grep &> /dev/null; then
    missing+=("grep")
  else
    echo "  ✓ grep"
  fi

  if [ ${#missing[@]} -gt 0 ]; then
    echo "❌ 缺少依赖: ${missing[*]}"
    exit 1
  fi

  echo "✅ 所有依赖已满足"
}

check_dependencies

echo ""
echo "📦 开始安装..."
echo ""

# 创建安装目录
echo "1️⃣ 创建目录结构..."
mkdir -p "$INSTALL_DIR"/{bin,lib,config}
echo "  ✓ ~/.demostar/bin"
echo "  ✓ ~/.demostar/lib"
echo "  ✓ ~/.demostar/config"

# 复制文件
echo ""
echo "2️⃣ 安装核心文件..."
cp -r bin/* "$INSTALL_DIR/bin/"
echo "  ✓ demostar (主命令)"
echo "  ✓ scat (安全 cat 命令)"
echo "  ✓ sless (安全 less 命令)"
echo "  ✓ sgrep (安全 grep 命令)"

cp -r lib/* "$INSTALL_DIR/lib/"
echo "  ✓ core.sh (脱敏引擎)"

cp -r config/* "$INSTALL_DIR/config/"
echo "  ✓ shell-functions.sh (命令包装)"
echo "  ✓ custom-fields.conf (自定义字段)"

# macOS 特定：配置 KeyCastr
if [ "$OS" = "macos" ]; then
  echo ""
  echo "3️⃣ 配置键盘指示工具 (KeyCastr)..."

  if command -v brew &> /dev/null; then
    if ! brew list keycastr &> /dev/null; then
      echo "  📥 安装 KeyCastr..."
      brew install --cask keycastr
    else
      echo "  ✓ KeyCastr 已安装"
    fi

    # 配置 KeyCastr
    defaults write io.github.keycastr fontSize 48
    defaults write io.github.keycastr displayInCorner 1
    defaults write io.github.keycastr keystrokeDelay 0.5
    echo "  ✓ KeyCastr 配置完成"
  else
    echo "  ⚠️  未检测到 Homebrew，跳过 KeyCastr 安装"
    echo "  💡 手动安装：brew install --cask keycastr"
  fi
fi

# 配置 Shell 环境
echo ""
echo "4️⃣ 配置 Shell 环境..."
SHELL_RC="$HOME/.zshrc"
if [ -f "$HOME/.bashrc" ]; then
  SHELL_RC="$HOME/.bashrc"
fi

if ! grep -q "demostar" "$SHELL_RC"; then
  echo "" >> "$SHELL_RC"
  echo "# DemoStar" >> "$SHELL_RC"
  echo 'export PATH="$HOME/.demostar/bin:$PATH"' >> "$SHELL_RC"
  echo 'source "$HOME/.demostar/config/shell-functions.sh"' >> "$SHELL_RC"
  echo "  ✓ 已添加到 $SHELL_RC"
fi

echo ""
echo "✅ 安装完成！"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📖 使用方法"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1️⃣ 重新加载 Shell："
echo "   source $SHELL_RC"
echo ""
echo "2️⃣ 启动演示模式："
echo "   demostar start"
echo ""
echo "3️⃣ 关闭演示模式："
echo "   demostar stop"
echo ""
echo "💡 演示模式包含："
echo "   • 数据脱敏（cat/less/grep 自动生效）"
echo "   • 键盘指示（KeyCastr）"
echo "   • 勿扰模式"
echo "   • 隐藏桌面图标"
echo "   • 终端字体放大"
echo ""

# NG 键盘皮肤

作者：`NG`

基于 Hamster v3（元书输入法）Jsonnet 自定义键盘方案，面向日常中文输入、符号输入和手势效率。

## 版本定位

- 当前分支用于正式版发布
- 名称：`NG`
- 重点：更高效的 26 键手势、九宫格数字键盘、工具栏常用入口

## 主要功能

- 中英切换联动前景显示：
- 中文状态下 26 键显示大写前景
- 英文状态下 26 键显示小写前景
- `123` 键上滑进入自定义九宫格数字键盘
- 工具栏固定 6 图标位（可继续扩展）
- 空格键显示方案相关标识（右上角徽标）
- 发送键粉色风格
- 深色 / 浅色双主题

## 手势能力（核心）

- 删除键上滑：`#deleteText`
- `A` 上滑：行首，`L` 上滑：行尾
- `Z` 下滑：撤销，`X/C/V` 下滑：剪切/复制/粘贴
- `B` 下滑：输入 `U`，前景提示为“编”
- `N` 下滑：输入 `R`，前景提示为“￥”
- `M` 下滑：通过 `sendKeys('/sx')` 输入触发串（不走直接上屏）
- `D` 上滑 `-`、下滑 `_`
- `G` 上滑 `/`
- `B/N/M`、`Z/X/C/V` 上下滑前景提示已补齐

## 九宫格数字键盘（自定义）

- 左侧列：`+`、`-`、`*`、`/`（含对应手势）
- 右侧含删除、回车等系统键
- 返回键位置按当前定稿布局保留
- `V` 键使用计算器图标（按下仍发送 `V`）

## 关键文件

- `jsonnet/main.jsonnet`
- `jsonnet/Constants/Keyboard.libsonnet`
- `jsonnet/Components/iPhonePinyin.libsonnet`
- `jsonnet/Components/iPhoneNumericNineGrid.libsonnet`
- `jsonnet/Components/Toolbar.libsonnet`
- `jsonnet/Components/BasicStyle.libsonnet`

## 说明

- Hamster 的 `character` 仅支持单字符；多字符触发串需使用 `sendKeys`。
- 如需新增手势命令，建议优先走 `shortcut` / `sendKeys`，避免直接上屏冲突。

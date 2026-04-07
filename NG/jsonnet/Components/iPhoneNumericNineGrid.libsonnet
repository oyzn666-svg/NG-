local params = import '../Constants/Keyboard.libsonnet';
local basicStyle = import 'BasicStyle.libsonnet';
local preedit = import 'Preedit.libsonnet';
local toolbar = import 'Toolbar.libsonnet';
local utils = import 'Utils.libsonnet';

local fifthButtonSize = {
  size: { width: '225/1125' },
};

local hintStyle = {
  hintStyle: {
    size: { width: 50, height: 50 },
  },
};

local keyboardLayout = {
  keyboardLayout: [
    {
      HStack: {
        subviews: [
          { Cell: 'nineGridLeftTopButton' },      // +
          { Cell: params.keyboard.oneButton.name },
          { Cell: params.keyboard.twoButton.name },
          { Cell: params.keyboard.threeButton.name },
          { Cell: params.keyboard.backspaceButton.name },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          { Cell: 'nineGridLeftMiddleButton' },   // -
          { Cell: params.keyboard.fourButton.name },
          { Cell: params.keyboard.fiveButton.name },
          { Cell: params.keyboard.sixButton.name },
          { Cell: 'nineGridSpaceButton' },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          { Cell: 'nineGridLeftBottomButton' },   // *
          { Cell: params.keyboard.sevenButton.name },
          { Cell: params.keyboard.eightButton.name },
          { Cell: params.keyboard.nineButton.name },
          { Cell: 'nineGridVButton' },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          { Cell: 'nineGridReturnButton' },       // 返回
          { Cell: 'nineGridLeftSlashButton' },    // /
          { Cell: params.keyboard.zeroButton.name },
          { Cell: 'nineGridEqualButton' },        // 0 右边 =
          { Cell: params.keyboard.enterButton.name },
        ],
      },
    },
  ],
};

local newKeyLayout(isDark=false, isPortrait=true) =
  local keyboardHeight = if isPortrait then params.keyboard.height.iPhone.portrait else params.keyboard.height.iPhone.landscape;
  {
    keyboardHeight: keyboardHeight,
    keyboardStyle: utils.newBackgroundStyle(style=basicStyle.keyboardBackgroundStyleName),
  }
  + keyboardLayout
  + basicStyle.newAlphabeticButton(
    'nineGridLeftTopButton',
    isDark,
    fifthButtonSize
    + hintStyle
    + {
      action: { character: '+' },
      swipeUpAction: { character: '-' },
      swipeDownAction: { character: '*' },
    }
  )
  + basicStyle.newAlphabeticButton(params.keyboard.oneButton.name, isDark, fifthButtonSize + params.keyboard.oneButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.twoButton.name, isDark, fifthButtonSize + params.keyboard.twoButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.threeButton.name, isDark, fifthButtonSize + params.keyboard.threeButton.params + hintStyle)
  + basicStyle.newSystemButton(params.keyboard.backspaceButton.name, isDark, fifthButtonSize + params.keyboard.backspaceButton.params)

  + basicStyle.newAlphabeticButton(
    'nineGridLeftMiddleButton',
    isDark,
    fifthButtonSize
    + hintStyle
    + {
      action: { character: '-' },
      swipeUpAction: { character: '*' },
      swipeDownAction: { character: '/' },
    }
  )
  + basicStyle.newAlphabeticButton(params.keyboard.fourButton.name, isDark, fifthButtonSize + params.keyboard.fourButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.fiveButton.name, isDark, fifthButtonSize + params.keyboard.fiveButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.sixButton.name, isDark, fifthButtonSize + params.keyboard.sixButton.params + hintStyle)
  + basicStyle.newSystemButton(
    'nineGridSpaceButton',
    isDark,
    fifthButtonSize
    + {
      action: 'space',
      systemImageName: 'space',
    }
  )

  + basicStyle.newAlphabeticButton(
    'nineGridLeftBottomButton',
    isDark,
    fifthButtonSize
    + hintStyle
    + {
      action: { character: '*' },
      swipeUpAction: { character: '/' },
      swipeDownAction: { character: '+' },
    }
  )
  + basicStyle.newAlphabeticButton(params.keyboard.sevenButton.name, isDark, fifthButtonSize + params.keyboard.sevenButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.eightButton.name, isDark, fifthButtonSize + params.keyboard.eightButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.nineButton.name, isDark, fifthButtonSize + params.keyboard.nineButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(
    'nineGridVButton',
    isDark,
    fifthButtonSize
    + hintStyle
    + {
      action: { character: 'V' },
      systemImageName: 'plus.forwardslash.minus',
      fontSize: 18,
    }
  )

  + basicStyle.newSystemButton(
    'nineGridReturnButton',
    isDark,
    fifthButtonSize
    + {
      action: { keyboardType: 'pinyin' },
      systemImageName: 'arrowshape.turn.up.left',
      fontSize: 17,
    }
  )
  + basicStyle.newAlphabeticButton(
    'nineGridDotButton',
    isDark,
    fifthButtonSize + hintStyle + { action: { character: '.' } }
  )
  + basicStyle.newAlphabeticButton(params.keyboard.zeroButton.name, isDark, fifthButtonSize + params.keyboard.zeroButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(
    'nineGridEqualButton',
    isDark,
    fifthButtonSize + hintStyle + { action: { character: '=' } }
  )
  + basicStyle.newAlphabeticButton(
    'nineGridLeftSlashButton',
    isDark,
    fifthButtonSize
    + hintStyle
    + {
      action: { character: '/' },
    }
  )
  + basicStyle.newSystemButton(
    params.keyboard.enterButton.name,
    isDark,
    fifthButtonSize
    + {
      backgroundStyle: basicStyle.enterButtonBackgroundStyle,
      foregroundStyle: basicStyle.enterButtonForegroundStyle,
    }
    + params.keyboard.enterButton.params
  )
  ;

{
  new(isDark, isPortrait):
    local insets = if isPortrait then params.keyboard.button.backgroundInsets.iPhone.portrait else params.keyboard.button.backgroundInsets.iPhone.landscape;
    local extraParams = { insets: insets };

    preedit.new(isDark)
    + toolbar.new(isDark)
    + basicStyle.newKeyboardBackgroundStyle(isDark)
    + basicStyle.newAlphabeticButtonBackgroundStyle(isDark, extraParams)
    + basicStyle.newAlphabeticButtonHintStyle(isDark)
    + basicStyle.newSystemButtonBackgroundStyle(isDark, extraParams)
    + basicStyle.newBlueButtonBackgroundStyle(isDark, extraParams)
    + basicStyle.newBlueButtonForegroundStyle(isDark, params.keyboard.enterButton.params)
    + basicStyle.newAlphabeticHintBackgroundStyle(isDark, { cornerRadius: 10 })
    + newKeyLayout(isDark, isPortrait)
    + basicStyle.newEnterButtonForegroundStyle(isDark, params.keyboard.enterButton.params)
    + basicStyle.returnKeyboardTypeChangedNotification
    + basicStyle.preeditChangedForEnterButtonNotification,
}

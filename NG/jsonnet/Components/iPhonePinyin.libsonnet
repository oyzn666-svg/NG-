local params = import '../Constants/Keyboard.libsonnet';
local basicStyle = import 'BasicStyle.libsonnet';
local preedit = import 'Preedit.libsonnet';
local toolbar = import 'Toolbar.libsonnet';
local utils = import 'Utils.libsonnet';

local portraitNormalButtonSize = {
  size: { width: '112.5/1125' },
};

local hintStyle = {
  hintStyle: {
    size: { width: 50, height: 50 },
  },
};

// 鏍囧噯26閿竷灞€
local commaPeriodUpLabelParams = {
  text: '。',
  center: { y: 0.32 },
  fontSize: 13,
};

local commaPeriodDownLabelParams = {
  text: '，',
  center: { y: 0.63 },
  fontSize: 21,
};

local swipeHintStyleParams = {
  center: { y: 0.78 },
  fontSize: 10,
};

local swipeUpHintStyleParams = {
  center: { y: 0.22 },
  fontSize: 10,
};

local aUpHintParams = swipeUpHintStyleParams + { text: '⇤' };
local aDownHintParams = swipeHintStyleParams + { text: '反' };
local dUpHintParams = swipeUpHintStyleParams + { text: '-' };
local dDownHintParams = swipeHintStyleParams + { text: '_' };
local lUpHintParams = swipeUpHintStyleParams + { text: '⇥' };
local bUpHintParams = swipeUpHintStyleParams + { text: '?' };
local nUpHintParams = swipeUpHintStyleParams + { text: '!' };
local mUpHintParams = swipeUpHintStyleParams + { text: '.' };
local bDownHintParams = swipeHintStyleParams + { text: '编' };
local nDownHintParams = swipeHintStyleParams + { text: '￥' };
local mDownHintParams = swipeHintStyleParams + { text: '符' };
local zUpHintParams = swipeUpHintStyleParams + { text: '@' };
local xUpHintParams = swipeUpHintStyleParams + { text: '~' };
local cUpHintParams = swipeUpHintStyleParams + { text: '#' };
local vUpHintParams = swipeUpHintStyleParams + { text: '、' };
local gUpHintParams = swipeUpHintStyleParams + { text: '/' };
local zDownHintParams = swipeHintStyleParams + { text: '撤' };
local xDownHintParams = swipeHintStyleParams + { text: '剪' };
local cDownHintParams = swipeHintStyleParams + { text: '复' };
local vDownHintParams = swipeHintStyleParams + { text: '贴' };

local asciiModeTopLabelChineseParams = {
  text: '中',
  center: { y: 0.35 },
  fontSize: 15,
};

local asciiModeTopLabelEnglishParams = {
  text: '英',
  center: { y: 0.35 },
  fontSize: 15,
};

local asciiModeBottomSwitchParams = {
  text: '<>',
  center: { y: 0.78 },
  fontSize: 10,
};

local spaceBadgeLabelParams = {
  text: '\u5185\u9b3c',
  center: { x: 0.82, y: 0.22 },
  fontSize: 10,
};

local topNumberHintStyleParams = {
  center: { y: 0.22 },
  fontSize: 10,
};

local qTopNumberHintParams = topNumberHintStyleParams + { text: '1' };
local wTopNumberHintParams = topNumberHintStyleParams + { text: '2' };
local eTopNumberHintParams = topNumberHintStyleParams + { text: '3' };
local rTopNumberHintParams = topNumberHintStyleParams + { text: '4' };
local tTopNumberHintParams = topNumberHintStyleParams + { text: '5' };
local yTopNumberHintParams = topNumberHintStyleParams + { text: '6' };
local uTopNumberHintParams = topNumberHintStyleParams + { text: '7' };
local iTopNumberHintParams = topNumberHintStyleParams + { text: '8' };
local oTopNumberHintParams = topNumberHintStyleParams + { text: '9' };
local pTopNumberHintParams = topNumberHintStyleParams + { text: '0' };

local asciiModeLetterForeground(buttonName, extraStyleNames=[]) = [
  {
    styleName: [buttonName + 'ForegroundStyle'] + extraStyleNames,
    conditionKey: '$isAsciiMode',
    conditionValue: true,
  },
  {
    styleName: [buttonName + 'UppercaseForegroundStyle'] + extraStyleNames,
    conditionKey: '$isAsciiMode',
    conditionValue: false,
  },
  {
    styleName: [buttonName + 'ForegroundStyle'] + extraStyleNames,
    conditionKey: 'rime$ascii_mode',
    conditionValue: true,
  },
  {
    styleName: [buttonName + 'UppercaseForegroundStyle'] + extraStyleNames,
    conditionKey: 'rime$ascii_mode',
    conditionValue: false,
  },
];

local alphabeticKeyboardLayout = {
  keyboardLayout: [
    {
      HStack: {
        subviews: [
          {
            Cell: params.keyboard.qButton.name,
          },
          {
            Cell: params.keyboard.wButton.name,
          },
          {
            Cell: params.keyboard.eButton.name,
          },
          {
            Cell: params.keyboard.rButton.name,
          },
          {
            Cell: params.keyboard.tButton.name,
          },
          {
            Cell: params.keyboard.yButton.name,
          },
          {
            Cell: params.keyboard.uButton.name,
          },
          {
            Cell: params.keyboard.iButton.name,
          },
          {
            Cell: params.keyboard.oButton.name,
          },
          {
            Cell: params.keyboard.pButton.name,
          },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          {
            Cell: params.keyboard.aButton.name,
          },
          {
            Cell: params.keyboard.sButton.name,
          },
          {
            Cell: params.keyboard.dButton.name,
          },
          {
            Cell: params.keyboard.fButton.name,
          },
          {
            Cell: params.keyboard.gButton.name,
          },
          {
            Cell: params.keyboard.hButton.name,
          },
          {
            Cell: params.keyboard.jButton.name,
          },
          {
            Cell: params.keyboard.kButton.name,
          },
          {
            Cell: params.keyboard.lButton.name,
          },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          {
            Cell: params.keyboard.shiftButton.name,
          },
          {
            Cell: params.keyboard.zButton.name,
          },
          {
            Cell: params.keyboard.xButton.name,
          },
          {
            Cell: params.keyboard.cButton.name,
          },
          {
            Cell: params.keyboard.vButton.name,
          },
          {
            Cell: params.keyboard.bButton.name,
          },
          {
            Cell: params.keyboard.nButton.name,
          },
          {
            Cell: params.keyboard.mButton.name,
          },
          {
            Cell: params.keyboard.backspaceButton.name,
          },
        ],
      },
    },
    {
      HStack: {
        subviews: [
          {
            Cell: params.keyboard.numericButton.name,
          },
          {
            Cell: params.keyboard.commaPeriodButton.name,
          },
          {
            Cell: params.keyboard.spaceButton.name,
          },
          {
            Cell: params.keyboard.asciiModeButton.name,
          },
          {
            Cell: params.keyboard.enterButton.name,
          },
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
  + alphabeticKeyboardLayout
  // First Row
  + basicStyle.newAlphabeticButton(
    params.keyboard.qButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.qButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.qButton.name + 'ForegroundStyle',
        params.keyboard.qButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.qButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.qButton.params),
        [params.keyboard.qButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, qTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.wButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.wButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.wButton.name + 'ForegroundStyle',
        params.keyboard.wButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.wButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.wButton.params),
        [params.keyboard.wButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, wTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.eButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.eButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.eButton.name + 'ForegroundStyle',
        params.keyboard.eButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.eButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.eButton.params),
        [params.keyboard.eButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, eTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.rButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.rButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.rButton.name + 'ForegroundStyle',
        params.keyboard.rButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.rButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.rButton.params),
        [params.keyboard.rButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, rTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.tButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.tButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.tButton.name + 'ForegroundStyle',
        params.keyboard.tButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.tButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.tButton.params),
        [params.keyboard.tButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, tTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.yButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.yButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.yButton.name + 'ForegroundStyle',
        params.keyboard.yButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.yButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.yButton.params),
        [params.keyboard.yButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, yTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.uButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.uButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.uButton.name + 'ForegroundStyle',
        params.keyboard.uButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.uButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.uButton.params),
        [params.keyboard.uButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, uTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.iButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.iButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.iButton.name + 'ForegroundStyle',
        params.keyboard.iButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.iButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.iButton.params),
        [params.keyboard.iButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, iTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.oButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.oButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.oButton.name + 'ForegroundStyle',
        params.keyboard.oButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.oButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.oButton.params),
        [params.keyboard.oButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, oTopNumberHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.pButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.pButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.pButton.name + 'ForegroundStyle',
        params.keyboard.pButton.name + 'TopHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.pButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.pButton.params),
        [params.keyboard.pButton.name + 'TopHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, pTopNumberHintParams),
      },
    }
  )
  + {
    [params.keyboard.qButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.qButton.name, [params.keyboard.qButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.wButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.wButton.name, [params.keyboard.wButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.eButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.eButton.name, [params.keyboard.eButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.rButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.rButton.name, [params.keyboard.rButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.tButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.tButton.name, [params.keyboard.tButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.yButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.yButton.name, [params.keyboard.yButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.uButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.uButton.name, [params.keyboard.uButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.iButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.iButton.name, [params.keyboard.iButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.oButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.oButton.name, [params.keyboard.oButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.pButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.pButton.name, [params.keyboard.pButton.name + 'TopHintForegroundStyle']),
    },
    [params.keyboard.aButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.aButton.name, [params.keyboard.aButton.name + 'UpHintForegroundStyle', params.keyboard.aButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.sButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.sButton.name),
    },
    [params.keyboard.dButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.dButton.name, [params.keyboard.dButton.name + 'UpHintForegroundStyle', params.keyboard.dButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.fButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.fButton.name),
    },
    [params.keyboard.gButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.gButton.name, [params.keyboard.gButton.name + 'UpHintForegroundStyle']),
    },
    [params.keyboard.hButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.hButton.name),
    },
    [params.keyboard.jButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.jButton.name),
    },
    [params.keyboard.kButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.kButton.name),
    },
    [params.keyboard.lButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.lButton.name, [params.keyboard.lButton.name + 'UpHintForegroundStyle']),
    },
    [params.keyboard.zButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.zButton.name, [params.keyboard.zButton.name + 'UpHintForegroundStyle', params.keyboard.zButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.xButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.xButton.name, [params.keyboard.xButton.name + 'UpHintForegroundStyle', params.keyboard.xButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.cButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.cButton.name, [params.keyboard.cButton.name + 'UpHintForegroundStyle', params.keyboard.cButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.vButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.vButton.name, [params.keyboard.vButton.name + 'UpHintForegroundStyle', params.keyboard.vButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.bButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.bButton.name, [params.keyboard.bButton.name + 'UpHintForegroundStyle', params.keyboard.bButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.nButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.nButton.name, [params.keyboard.nButton.name + 'UpHintForegroundStyle', params.keyboard.nButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.mButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.mButton.name, [params.keyboard.mButton.name + 'UpHintForegroundStyle', params.keyboard.mButton.name + 'DownHintForegroundStyle']),
    },
  }
  // Second Row
  + basicStyle.newAlphabeticButton(
    params.keyboard.aButton.name,
    isDark,
    {
      size:
        { width: '168.75/1125' },
      bounds:
        { width: '111/168.75', alignment: 'right' },
    }
    + params.keyboard.aButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.aButton.name + 'ForegroundStyle',
        params.keyboard.aButton.name + 'UpHintForegroundStyle',
        params.keyboard.aButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.aButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.aButton.params),
        [params.keyboard.aButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, aUpHintParams),
        [params.keyboard.aButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, aDownHintParams),
      },
    },
  )
  + basicStyle.newAlphabeticButton(params.keyboard.sButton.name, isDark, portraitNormalButtonSize + params.keyboard.sButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(
    params.keyboard.dButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.dButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.dButton.name + 'ForegroundStyle',
        params.keyboard.dButton.name + 'UpHintForegroundStyle',
        params.keyboard.dButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.dButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.dButton.params),
        [params.keyboard.dButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, dUpHintParams),
        [params.keyboard.dButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, dDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(params.keyboard.fButton.name, isDark, portraitNormalButtonSize + params.keyboard.fButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(
    params.keyboard.gButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.gButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.gButton.name + 'ForegroundStyle',
        params.keyboard.gButton.name + 'UpHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.gButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.gButton.params),
        [params.keyboard.gButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, gUpHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(params.keyboard.hButton.name, isDark, portraitNormalButtonSize + params.keyboard.hButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.jButton.name, isDark, portraitNormalButtonSize + params.keyboard.jButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(params.keyboard.kButton.name, isDark, portraitNormalButtonSize + params.keyboard.kButton.params + hintStyle)
  + basicStyle.newAlphabeticButton(
    params.keyboard.lButton.name,
    isDark,
    {
      size:
        { width: '168.75/1125' },
      bounds:
        { width: '111/168.75', alignment: 'left' },
    }
    + params.keyboard.lButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.lButton.name + 'ForegroundStyle',
        params.keyboard.lButton.name + 'UpHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.lButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.lButton.params),
        [params.keyboard.lButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, lUpHintParams),
      },
    }
  )

  // Third Row
  + basicStyle.newSystemButton(
    params.keyboard.shiftButton.name,
    isDark,
    {
      size:
        { width: '168.75/1125' },
      bounds:
        { width: '151/168.75', alignment: 'left' },
    }
    + params.keyboard.shiftButton.params
    + {
      uppercasedStateForegroundStyle: params.keyboard.shiftButton.name + 'UppercasedForegroundStyle',
    }
    + {
      capsLockedStateForegroundStyle: params.keyboard.shiftButton.name + 'CapsLockedForegroundStyle',
    }
  )
  + {
    [params.keyboard.shiftButton.name + 'UppercasedForegroundStyle']:
      basicStyle.newImageSystemButtonForegroundStyle(isDark, params.keyboard.shiftButton.uppercasedParams),
    [params.keyboard.shiftButton.name + 'CapsLockedForegroundStyle']:
      basicStyle.newImageSystemButtonForegroundStyle(isDark, params.keyboard.shiftButton.capsLockedParams),
  }

  + basicStyle.newAlphabeticButton(
    params.keyboard.zButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.zButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.zButton.name + 'ForegroundStyle',
        params.keyboard.zButton.name + 'UpHintForegroundStyle',
        params.keyboard.zButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.zButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.zButton.params),
        [params.keyboard.zButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, zUpHintParams),
        [params.keyboard.zButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, zDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.xButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.xButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.xButton.name + 'ForegroundStyle',
        params.keyboard.xButton.name + 'UpHintForegroundStyle',
        params.keyboard.xButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.xButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.xButton.params),
        [params.keyboard.xButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, xUpHintParams),
        [params.keyboard.xButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, xDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.cButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.cButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.cButton.name + 'ForegroundStyle',
        params.keyboard.cButton.name + 'UpHintForegroundStyle',
        params.keyboard.cButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.cButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.cButton.params),
        [params.keyboard.cButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, cUpHintParams),
        [params.keyboard.cButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, cDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.vButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.vButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.vButton.name + 'ForegroundStyle',
        params.keyboard.vButton.name + 'UpHintForegroundStyle',
        params.keyboard.vButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.vButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.vButton.params),
        [params.keyboard.vButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, vUpHintParams),
        [params.keyboard.vButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, vDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.bButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.bButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.bButton.name + 'ForegroundStyle',
        params.keyboard.bButton.name + 'UpHintForegroundStyle',
        params.keyboard.bButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.bButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.bButton.params),
        [params.keyboard.bButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, bUpHintParams),
        [params.keyboard.bButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, bDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.nButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.nButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.nButton.name + 'ForegroundStyle',
        params.keyboard.nButton.name + 'UpHintForegroundStyle',
        params.keyboard.nButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.nButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.nButton.params),
        [params.keyboard.nButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, nUpHintParams),
        [params.keyboard.nButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, nDownHintParams),
      },
    }
  )
  + basicStyle.newAlphabeticButton(
    params.keyboard.mButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.mButton.params
    + hintStyle
    + {
      foregroundStyleName: [
        params.keyboard.mButton.name + 'ForegroundStyle',
        params.keyboard.mButton.name + 'UpHintForegroundStyle',
        params.keyboard.mButton.name + 'DownHintForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.mButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.mButton.params),
        [params.keyboard.mButton.name + 'UpHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, mUpHintParams),
        [params.keyboard.mButton.name + 'DownHintForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, mDownHintParams),
      },
    }
  )
  + basicStyle.newSystemButton(
    params.keyboard.backspaceButton.name,
    isDark,
    {
      size:
        { width: '168.75/1125' },
      bounds:
        { width: '151/168.75', alignment: 'right' },
    } + params.keyboard.backspaceButton.params,
  )
  + {
    [params.keyboard.aButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.aButton.name, [params.keyboard.aButton.name + 'UpHintForegroundStyle', params.keyboard.aButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.sButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.sButton.name),
    },
    [params.keyboard.dButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.dButton.name, [params.keyboard.dButton.name + 'UpHintForegroundStyle', params.keyboard.dButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.fButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.fButton.name),
    },
    [params.keyboard.gButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.gButton.name, [params.keyboard.gButton.name + 'UpHintForegroundStyle']),
    },
    [params.keyboard.hButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.hButton.name),
    },
    [params.keyboard.jButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.jButton.name),
    },
    [params.keyboard.kButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.kButton.name),
    },
    [params.keyboard.lButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.lButton.name, [params.keyboard.lButton.name + 'UpHintForegroundStyle']),
    },
    [params.keyboard.zButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.zButton.name, [params.keyboard.zButton.name + 'UpHintForegroundStyle', params.keyboard.zButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.xButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.xButton.name, [params.keyboard.xButton.name + 'UpHintForegroundStyle', params.keyboard.xButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.cButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.cButton.name, [params.keyboard.cButton.name + 'UpHintForegroundStyle', params.keyboard.cButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.vButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.vButton.name, [params.keyboard.vButton.name + 'UpHintForegroundStyle', params.keyboard.vButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.bButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.bButton.name, [params.keyboard.bButton.name + 'UpHintForegroundStyle', params.keyboard.bButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.nButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.nButton.name, [params.keyboard.nButton.name + 'UpHintForegroundStyle', params.keyboard.nButton.name + 'DownHintForegroundStyle']),
    },
    [params.keyboard.mButton.name]+: {
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: asciiModeLetterForeground(params.keyboard.mButton.name, [params.keyboard.mButton.name + 'UpHintForegroundStyle', params.keyboard.mButton.name + 'DownHintForegroundStyle']),
    },
  }

  // Fourth Row
  + basicStyle.newSystemButton(
    params.keyboard.commaPeriodButton.name,
    isDark,
    portraitNormalButtonSize
    + params.keyboard.commaPeriodButton.params
    + {
      foregroundStyle: [
        params.keyboard.commaPeriodButton.name + 'UpForegroundStyle',
        params.keyboard.commaPeriodButton.name + 'DownForegroundStyle',
      ],
    }
  )
  + {
    [params.keyboard.commaPeriodButton.name + 'UpForegroundStyle']:
      basicStyle.newAlphabeticButtonForegroundStyle(isDark, commaPeriodUpLabelParams),
    [params.keyboard.commaPeriodButton.name + 'DownForegroundStyle']:
      basicStyle.newAlphabeticButtonForegroundStyle(isDark, commaPeriodDownLabelParams),
  }
  + basicStyle.newSystemButton(
    params.keyboard.numericButton.name,
    isDark,
    {
      size:
        { width: '168.75/1125' },
    } + params.keyboard.numericButton.params
  )

  + basicStyle.newAlphabeticButton(
    params.keyboard.spaceButton.name,
    isDark,
    params.keyboard.spaceButton.params
    + {
      foregroundStyleName: [
        params.keyboard.spaceButton.name + 'ForegroundStyle',
        params.keyboard.spaceButton.name + 'BadgeForegroundStyle',
      ],
    }
    + {
      foregroundStyle: {
        [params.keyboard.spaceButton.name + 'ForegroundStyle']:
          basicStyle.newAlphabeticButtonForegroundStyle(isDark, params.keyboard.spaceButton.params),
        [params.keyboard.spaceButton.name + 'BadgeForegroundStyle']:
          basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, spaceBadgeLabelParams),
      },
    },
    needHint=false
  )
  + basicStyle.newSystemButton(
    params.keyboard.asciiModeButton.name,
    isDark,
    {
      size:
        { width: '150/1125' },
      notification: ['asciiModeChangedNotification'],
      foregroundStyle: [
        {
          styleName: [
            params.keyboard.asciiModeButton.name + 'TopEnglishForegroundStyle',
            params.keyboard.asciiModeButton.name + 'BottomSwitchForegroundStyle',
          ],
          conditionKey: '$isAsciiMode',
          conditionValue: true,
        },
        {
          styleName: [
            params.keyboard.asciiModeButton.name + 'TopChineseForegroundStyle',
            params.keyboard.asciiModeButton.name + 'BottomSwitchForegroundStyle',
          ],
          conditionKey: '$isAsciiMode',
          conditionValue: false,
        },
        {
          styleName: [
            params.keyboard.asciiModeButton.name + 'TopEnglishForegroundStyle',
            params.keyboard.asciiModeButton.name + 'BottomSwitchForegroundStyle',
          ],
          conditionKey: 'rime$ascii_mode',
          conditionValue: true,
        },
        {
          styleName: [
            params.keyboard.asciiModeButton.name + 'TopChineseForegroundStyle',
            params.keyboard.asciiModeButton.name + 'BottomSwitchForegroundStyle',
          ],
          conditionKey: 'rime$ascii_mode',
          conditionValue: false,
        },
      ],
    } + params.keyboard.asciiModeButton.params
  )
  + {
    [params.keyboard.asciiModeButton.name + 'TopChineseForegroundStyle']:
      basicStyle.newTextSystemButtonForegroundStyle(isDark, asciiModeTopLabelChineseParams),
    [params.keyboard.asciiModeButton.name + 'TopEnglishForegroundStyle']:
      basicStyle.newTextSystemButtonForegroundStyle(isDark, asciiModeTopLabelEnglishParams),
    [params.keyboard.asciiModeButton.name + 'BottomSwitchForegroundStyle']:
      basicStyle.newAlphabeticButtonSwipeForegroundStyle(isDark, asciiModeBottomSwitchParams),
    asciiModeChangedNotification: {
      notificationType: 'rime',
      rimeNotificationType: 'optionChanged',
      rimeOptionName: 'ascii_mode',
    },
  }
  + basicStyle.newSystemButton(
    params.keyboard.enterButton.name,
    isDark,
    {
      size: { width: '220/1125' },
      backgroundStyle: basicStyle.enterButtonBackgroundStyle,
      foregroundStyle: basicStyle.enterButtonForegroundStyle,
    } + params.keyboard.enterButton.params
  )
;

{
  new(isDark, isPortrait):
    local insets = if isPortrait then params.keyboard.button.backgroundInsets.iPhone.portrait else params.keyboard.button.backgroundInsets.iPhone.landscape;

    local extraParams = {
      insets: insets,
    };

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
    + basicStyle.newCommitCandidateForegroundStyle(isDark, { text: '$rimeCandidate' })
    // Notifications
    + basicStyle.returnKeyboardTypeChangedNotification
    + basicStyle.preeditChangedForEnterButtonNotification
    + basicStyle.preeditChangedForSpaceButtonNotification,
}

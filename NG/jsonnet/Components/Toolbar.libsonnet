local colors = import '../Constants/Colors.libsonnet';
local keyboardParams = import '../Constants/Keyboard.libsonnet';
local basicStyle = import 'BasicStyle.libsonnet';
local utils = import 'Utils.libsonnet';

local newCandidateStyle(param={}, isDark=false) =
  utils.extractProperties(
    param,
    [
      'insets',
      'indexFontSize',
      'indexFontWeight',
      'textFontSize',
      'textFontWeight',
      'commentFontSize',
      'commentFontWeight',
    ]
  )
  + utils.extractColors(
    param,
    [
      'backgroundColor',
      'separatorColor',
      'highlightBackgroundColor',
      'preferredBackgroundColor',
      'preferredIndexColor',
      'preferredTextColor',
      'preferredCommentColor',
      'indexColor',
      'textColor',
      'commentColor',
    ],
    isDark
  );

local toolbarBackgroundStyleName = basicStyle.keyboardBackgroundStyleName;
local horizontalCandidateBackgroundStyleName = basicStyle.keyboardBackgroundStyleName;
local verticalCandidateBackgroundStyleName = basicStyle.keyboardBackgroundStyleName;

local horizontalCandidatesCollectionViewName = 'horizontalCandidates';
local expandButtonName = 'expandButton';
local horizontalCandidatesLayout = [
  {
    HStack: {
      subviews: [
        {
          Cell: horizontalCandidatesCollectionViewName,
        },
        {
          Cell: expandButtonName,
        },
      ],
    },
  },
];

local toolbarDismissButtonName = 'toolbarDismissButton';
local toolbarLanguageButtonName = 'toolbarLanguageButton';
local toolbarSymbolButtonName = 'toolbarSymbolButton';
local toolbarS2TButtonName = 'toolbarS2TButton';
local toolbarPasteboardButtonName = 'toolbarPasteboardButton';
local toolbarPhraseButtonName = 'toolbarPhraseButton';
local toolbarScriptButtonName = 'toolbarScriptButton';
local toolbarLayout = [
  {
    HStack: {
      subviews: [
        {
          Cell: toolbarLanguageButtonName,
        },
        {
          Cell: toolbarSymbolButtonName,
        },
        {
          Cell: toolbarS2TButtonName,
        },
        {
          Cell: toolbarScriptButtonName,
        },
        {
          Cell: toolbarPhraseButtonName,
        },
        {
          Cell: toolbarPasteboardButtonName,
        },
        {
          Cell: toolbarDismissButtonName,
        },
      ],
    },
  },
];

local newHorizontalCandidatesCollectionView(isDark=false) = {
  [horizontalCandidatesCollectionViewName]: {
    type: 'horizontalCandidates',
    candidateStyle: 'horizontalCandidateStyle',
  },
  horizontalCandidateStyle: newCandidateStyle(keyboardParams.candidateStyle, isDark),
};

local newExpandButton(isDark) = {
  [expandButtonName]:
    {
      size: { width: 44 },
      action: { shortcut: '#candidatesBarStateToggle' },
    }
    + utils.newForegroundStyle(style=expandButtonName + 'ForegroundStyle'),
  [expandButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(keyboardParams.horizontalCandidateStyle.expandButton, isDark),
};

local newToolbarDismissButton(isDark) = {
  [toolbarDismissButtonName]:
    utils.newForegroundStyle(style=toolbarDismissButtonName + 'ForegroundStyle')
    + {
      action: 'dismissKeyboard',
      size: { width: '1/7' },
    },
  [toolbarDismissButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'keyboard.chevron.compact.down',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 19,
      },
      isDark
    ),
};

local newToolbarLanguageButton(isDark) = {
  [toolbarLanguageButtonName]:
    utils.newForegroundStyle(style=toolbarLanguageButtonName + 'ForegroundStyle')
    + {
      action: 'settings',
      size: { width: '1/7' },
    },
  [toolbarLanguageButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'square.grid.2x2',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 19,
      },
      isDark
    ),
};

local newToolbarS2TButton(isDark) = {
  [toolbarS2TButtonName]:
    utils.newForegroundStyle(style=toolbarS2TButtonName + 'ForegroundStyle')
    + {
      action: { shortcut: '#keyboardPerformance' },
      size: { width: '1/7' },
    },
  [toolbarS2TButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'speedometer',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 18,
      },
      isDark
    ),
};

local newToolbarPasteboardButton(isDark) = {
  [toolbarPasteboardButtonName]:
    utils.newForegroundStyle(style=toolbarPasteboardButtonName + 'ForegroundStyle')
    + {
      action: { shortcut: '#showPasteboardView' },
      size: { width: '1/7' },
    },
  [toolbarPasteboardButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'doc.on.clipboard',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 18,
      },
      isDark
    ),
};

local newToolbarPhraseButton(isDark) = {
  [toolbarPhraseButtonName]:
    utils.newForegroundStyle(style=toolbarPhraseButtonName + 'ForegroundStyle')
    + {
      action: { shortcut: '#showPhraseView' },
      size: { width: '1/7' },
    },
  [toolbarPhraseButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'text.bubble',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 18,
      },
      isDark
    ),
};

local newToolbarScriptButton(isDark) = {
  [toolbarScriptButtonName]:
    utils.newForegroundStyle(style=toolbarScriptButtonName + 'ForegroundStyle')
    + {
      action: { shortcut: '#toggleScriptView' },
      size: { width: '1/7' },
    },
  [toolbarScriptButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'command',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 18,
      },
      isDark
    ),
};

local newToolbarSymbolButton(isDark) = {
  [toolbarSymbolButtonName]:
    utils.newForegroundStyle(style=toolbarSymbolButtonName + 'ForegroundStyle')
    + {
      action: { keyboardType: 'symbolic' },
      size: { width: '1/7' },
    },
  [toolbarSymbolButtonName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'character.textbox',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: 18,
      },
      isDark
    ),
};

local verticalCandidateCollectionViewName = 'verticalCandidates';
local verticalLastRowStyleName = 'verticalLastRowStyle';
local verticalCandidatePageUpButtonStyleName = 'verticalPageUpButtonStyle';
local verticalCandidatePageDownButtonStyleName = 'verticalPageDownButtonStyle';
local verticalCandidateReturnButtonStyleName = 'verticalReturnButtonStyle';
local verticalCandidateBackspaceButtonStyleName = 'verticalBackspaceButtonStyle';

local verticalCandidatesLayout = [
  {
    HStack: {
      subviews: [
        {
          Cell: verticalCandidateCollectionViewName,
        },
      ],
    },
  },
  {
    HStack: {
      style: verticalLastRowStyleName,
      subviews: [
        {
          Cell: verticalCandidatePageUpButtonStyleName,
        },
        {
          Cell: verticalCandidatePageDownButtonStyleName,
        },
        {
          Cell: verticalCandidateReturnButtonStyleName,
        },
        {
          Cell: verticalCandidateBackspaceButtonStyleName,
        },
      ],
    },
  },
];

local newVerticalCandidateCollectionStyle(isDark) = {
  [verticalCandidateCollectionViewName]:
    {
      type: 'verticalCandidates',
      insets: keyboardParams.verticalCandidateStyle.candidateCollectionStyle.insets,
      maxRows: keyboardParams.verticalCandidateStyle.candidateCollectionStyle.maxRows,
      maxColumns: keyboardParams.verticalCandidateStyle.candidateCollectionStyle.maxColumns,
      candidateStyle: 'verticalCandidateStyle',
    } +
    utils.extractColors(
      keyboardParams.verticalCandidateStyle.candidateCollectionStyle,
      [
        'separatorColor',
      ],
      isDark
    ),
  verticalCandidateStyle: newCandidateStyle(keyboardParams.candidateStyle { insets: { left: 6, right: 6, top: 4, bottom: 4 } }, isDark),
};

local verticalLastRowStyle = {
  [verticalLastRowStyleName]:
    {
      size: { height: keyboardParams.verticalCandidateStyle.bottomRowHeight },
    },
};

local newVerticalCandidatePageUpButtonStyle(isDark) = {
  [verticalCandidatePageUpButtonStyleName]:
    utils.newBackgroundStyle(style=basicStyle.systemButtonBackgroundStyleName)
    + utils.newForegroundStyle(style=verticalCandidatePageUpButtonStyleName + 'ForegroundStyle')
    + {
      action: keyboardParams.verticalCandidateStyle.pageUpButton.action,
    },
  [verticalCandidatePageUpButtonStyleName + 'ForegroundStyle']:
    utils.newSystemImageStyle(keyboardParams.verticalCandidateStyle.pageUpButton, isDark),
};

local newVerticalCandidatePageDownButtonStyle(isDark) = {
  [verticalCandidatePageDownButtonStyleName]:
    utils.newBackgroundStyle(style=basicStyle.systemButtonBackgroundStyleName)
    + utils.newForegroundStyle(style=verticalCandidatePageDownButtonStyleName + 'ForegroundStyle')
    + {
      action: keyboardParams.verticalCandidateStyle.pageDownButton.action,
    },
  [verticalCandidatePageDownButtonStyleName + 'ForegroundStyle']:
    utils.newSystemImageStyle(keyboardParams.verticalCandidateStyle.pageDownButton, isDark),
};

local newVerticalCandidateReturnButtonStyle(isDark) = {
  [verticalCandidateReturnButtonStyleName]:
    utils.newBackgroundStyle(style=basicStyle.systemButtonBackgroundStyleName)
    + utils.newForegroundStyle(style=verticalCandidateReturnButtonStyleName + 'ForegroundStyle')
    + {
      action: keyboardParams.verticalCandidateStyle.returnButton.action,
    },
  [verticalCandidateReturnButtonStyleName + 'ForegroundStyle']:
    utils.newSystemImageStyle(keyboardParams.verticalCandidateStyle.returnButton, isDark),
};

local newVerticalCandidateBackspaceButtonStyle(isDark) = {
  [verticalCandidateBackspaceButtonStyleName]:
    utils.newBackgroundStyle(style=basicStyle.systemButtonBackgroundStyleName)
    + utils.newForegroundStyle(style=verticalCandidateBackspaceButtonStyleName + 'ForegroundStyle')
    + {
      action: 'backspace',
    },
  [verticalCandidateBackspaceButtonStyleName + 'ForegroundStyle']:
    utils.newSystemImageStyle(
      {
        systemImageName: 'delete.left',
        normalColor: colors.toolbarButtonForegroundColor,
        highlightColor: colors.toolbarButtonHighlightedForegroundColor,
        fontSize: keyboardParams.verticalCandidateStyle.pageUpButton.fontSize,
      },
      isDark
    ),
};

local newToolbar(isDark=false, params={}) =
  {
    toolbarHeight: keyboardParams.toolbar.height,
    toolbarStyle:
      utils.newBackgroundStyle(style=toolbarBackgroundStyleName)
      + { insets: { left: 0, right: 4 } },
    toolbarLayout: toolbarLayout,
    horizontalCandidatesStyle:
      utils.extractProperties(keyboardParams.horizontalCandidateStyle + params, ['insets'])
      {
        backgroundStyle: horizontalCandidateBackgroundStyleName,
      },
    horizontalCandidatesLayout: horizontalCandidatesLayout,
    verticalCandidatesStyle:
      utils.extractProperties(keyboardParams.verticalCandidateStyle + params, ['insets'])
      {
        backgroundStyle: verticalCandidateBackgroundStyleName,
      },
    verticalCandidatesLayout: verticalCandidatesLayout,
    candidateContextMenu: [],
  }
  + newHorizontalCandidatesCollectionView(isDark)
  + newExpandButton(isDark)
  + newToolbarLanguageButton(isDark)
  + newToolbarSymbolButton(isDark)
  + newToolbarS2TButton(isDark)
  + newToolbarScriptButton(isDark)
  + newToolbarPhraseButton(isDark)
  + newToolbarPasteboardButton(isDark)
  + newToolbarDismissButton(isDark)
  + newVerticalCandidateCollectionStyle(isDark)
  + verticalLastRowStyle
  + newVerticalCandidatePageUpButtonStyle(isDark)
  + newVerticalCandidatePageDownButtonStyle(isDark)
  + newVerticalCandidateReturnButtonStyle(isDark)
  + newVerticalCandidateBackspaceButtonStyle(isDark);

{
  new: newToolbar,
}

local iPhoneNumeric = import 'Components/iPhoneNumeric.libsonnet';
local iPhoneNumericNineGrid = import 'Components/iPhoneNumericNineGrid.libsonnet';
local iPhonePinyin = import 'Components/iPhonePinyin.libsonnet';
local iPhoneSymbolic = import 'Components/iPhoneSymbolic.libsonnet';
local iPadPinyin = import 'Components/iPadPinyin.libsonnet';
local iPadNumeric = import 'Components/iPadNumeric.libsonnet';

local keyboardForegroundOverrides(isEnglish=false) =
  local mainStyle = function(name) if isEnglish then name + 'ForegroundStyle' else name + 'UppercaseForegroundStyle';
  {
    qButton+: { foregroundStyle: [mainStyle('qButton'), 'qButtonTopHintForegroundStyle'] },
    wButton+: { foregroundStyle: [mainStyle('wButton'), 'wButtonTopHintForegroundStyle'] },
    eButton+: { foregroundStyle: [mainStyle('eButton'), 'eButtonTopHintForegroundStyle'] },
    rButton+: { foregroundStyle: [mainStyle('rButton'), 'rButtonTopHintForegroundStyle'] },
    tButton+: { foregroundStyle: [mainStyle('tButton'), 'tButtonTopHintForegroundStyle'] },
    yButton+: { foregroundStyle: [mainStyle('yButton'), 'yButtonTopHintForegroundStyle'] },
    uButton+: { foregroundStyle: [mainStyle('uButton'), 'uButtonTopHintForegroundStyle'] },
    iButton+: { foregroundStyle: [mainStyle('iButton'), 'iButtonTopHintForegroundStyle'] },
    oButton+: { foregroundStyle: [mainStyle('oButton'), 'oButtonTopHintForegroundStyle'] },
    pButton+: { foregroundStyle: [mainStyle('pButton'), 'pButtonTopHintForegroundStyle'] },
    aButton+: { foregroundStyle: [mainStyle('aButton'), 'aButtonUpHintForegroundStyle', 'aButtonDownHintForegroundStyle'] },
    sButton+: { foregroundStyle: mainStyle('sButton') },
    dButton+: { foregroundStyle: [mainStyle('dButton'), 'dButtonUpHintForegroundStyle', 'dButtonDownHintForegroundStyle'] },
    fButton+: { foregroundStyle: mainStyle('fButton') },
    gButton+: { foregroundStyle: [mainStyle('gButton'), 'gButtonUpHintForegroundStyle'] },
    hButton+: { foregroundStyle: mainStyle('hButton') },
    jButton+: { foregroundStyle: mainStyle('jButton') },
    kButton+: { foregroundStyle: mainStyle('kButton') },
    lButton+: { foregroundStyle: [mainStyle('lButton'), 'lButtonUpHintForegroundStyle'] },
    zButton+: { foregroundStyle: [mainStyle('zButton'), 'zButtonUpHintForegroundStyle', 'zButtonDownHintForegroundStyle'] },
    xButton+: { foregroundStyle: [mainStyle('xButton'), 'xButtonUpHintForegroundStyle', 'xButtonDownHintForegroundStyle'] },
    cButton+: { foregroundStyle: [mainStyle('cButton'), 'cButtonUpHintForegroundStyle', 'cButtonDownHintForegroundStyle'] },
    vButton+: { foregroundStyle: [mainStyle('vButton'), 'vButtonUpHintForegroundStyle', 'vButtonDownHintForegroundStyle'] },
    bButton+: { foregroundStyle: [mainStyle('bButton'), 'bButtonUpHintForegroundStyle', 'bButtonDownHintForegroundStyle'] },
    nButton+: { foregroundStyle: [mainStyle('nButton'), 'nButtonUpHintForegroundStyle', 'nButtonDownHintForegroundStyle'] },
    mButton+: { foregroundStyle: [mainStyle('mButton'), 'mButtonUpHintForegroundStyle', 'mButtonDownHintForegroundStyle'] },
  };

local withLanguageToggle(base, isEnglish=false) =
  base
  + keyboardForegroundOverrides(isEnglish)
  + {
    asciiModeButton+: {
      action: {
        keyboardType: if isEnglish then 'pinyin' else 'english',
      },
      foregroundStyle:
        if isEnglish then
          ['asciiModeButtonTopEnglishForegroundStyle', 'asciiModeButtonBottomSwitchForegroundStyle']
        else
          ['asciiModeButtonTopChineseForegroundStyle', 'asciiModeButtonBottomSwitchForegroundStyle'],
    },
  };

local pinyinPortraitFileName = 'pinyinPortrait';
local lightPinyinPortraitFileContent = withLanguageToggle(iPhonePinyin.new(isDark=false, isPortrait=true), isEnglish=false);
local darkPinyinPortraitFileContent = withLanguageToggle(iPhonePinyin.new(isDark=true, isPortrait=true), isEnglish=false);

local pinyinLandscapeFileName = 'pinyinLandscape';
local lightPinyinLandscapeFileContent = withLanguageToggle(iPhonePinyin.new(isDark=false, isPortrait=false), isEnglish=false);
local darkPinyinLandscapeFileContent = withLanguageToggle(iPhonePinyin.new(isDark=true, isPortrait=false), isEnglish=false);

local englishPortraitFileName = 'englishPortrait';
local lightEnglishPortraitFileContent = withLanguageToggle(iPhonePinyin.new(isDark=false, isPortrait=true), isEnglish=true);
local darkEnglishPortraitFileContent = withLanguageToggle(iPhonePinyin.new(isDark=true, isPortrait=true), isEnglish=true);

local englishLandscapeFileName = 'englishLandscape';
local lightEnglishLandscapeFileContent = withLanguageToggle(iPhonePinyin.new(isDark=false, isPortrait=false), isEnglish=true);
local darkEnglishLandscapeFileContent = withLanguageToggle(iPhonePinyin.new(isDark=true, isPortrait=false), isEnglish=true);

local numericPortraitFileName = 'numericPortrait';
local lightNumericPortraitFileContent = iPhoneNumeric.new(isDark=false, isPortrait=true);
local darkNumericPortraitFileContent = iPhoneNumeric.new(isDark=true, isPortrait=true);

local numericLandscapeName = 'numericLandscape';
local lightNumericLandscapeFileContent = iPhoneNumeric.new(isDark=false, isPortrait=false);
local darkNumericLandscapeFileContent = iPhoneNumeric.new(isDark=true, isPortrait=false);

local numericNineGridPortraitFileName = 'numericNineGridPortrait';
local lightNumericNineGridPortraitFileContent = iPhoneNumericNineGrid.new(isDark=false, isPortrait=true);
local darkNumericNineGridPortraitFileContent = iPhoneNumericNineGrid.new(isDark=true, isPortrait=true);

local numericNineGridLandscapeName = 'numericNineGridLandscape';
local lightNumericNineGridLandscapeFileContent = iPhoneNumericNineGrid.new(isDark=false, isPortrait=false);
local darkNumericNineGridLandscapeFileContent = iPhoneNumericNineGrid.new(isDark=true, isPortrait=false);

local symbolicPortraitFileName = 'symbolicPortrait';
local lightSymbolicPortraitFileContent = iPhoneSymbolic.new(isDark=false, isPortrait=true);
local darkSymbolicPortraitFileContent = iPhoneSymbolic.new(isDark=true, isPortrait=true);

local symbolicLandscapeName = 'symbolicLandscape';
local lightSymbolicLandscapeFileContent = iPhoneSymbolic.new(isDark=false, isPortrait=false);
local darkSymbolicLandscapeFileContent = iPhoneSymbolic.new(isDark=true, isPortrait=false);

local iPadPinyinPortraitName = 'iPadPinyinPortrait';
local lightIpadPinyinPortraitContent = iPadPinyin.new(isDark=false, isPortrait=true);
local darkIpadPinyinPortraitContent = iPadPinyin.new(isDark=true, isPortrait=true);

local iPadPinyinLandscapeName = 'iPadPinyinLandscape';
local lightIpadPinyinLandscapeContent = iPadPinyin.new(isDark=false, isPortrait=false);
local darkIpadPinyinLandscapeContent = iPadPinyin.new(isDark=true, isPortrait=false);

local iPadNumericPortraitName = 'iPadNumericPortrait';
local lightIpadNumericPortraitContent = iPadNumeric.new(isDark=false, isPortrait=true);
local darkIpadNumericPortraitContent = iPadNumeric.new(isDark=true, isPortrait=true);

local iPadNumericLandscapeName = 'iPadNumericLandscape';
local lightIpadNumericLandscapeContent = iPadNumeric.new(isDark=false, isPortrait=false);
local darkIpadNumericLandscapeContent = iPadNumeric.new(isDark=true, isPortrait=false);

local config = {
  name: 'NG',
  pinyin: {
    iPhone: {
      portrait: pinyinPortraitFileName,
      landscape: pinyinLandscapeFileName,
    },
    iPad: {
      portrait: iPadPinyinPortraitName,
      landscape: iPadPinyinLandscapeName,
      floating: pinyinPortraitFileName,
    },
  },
  english: {
    iPhone: {
      portrait: englishPortraitFileName,
      landscape: englishLandscapeFileName,
    },
    iPad: {
      portrait: iPadPinyinPortraitName,
      landscape: iPadPinyinLandscapeName,
      floating: englishPortraitFileName,
    },
  },
  numeric: {
    iPhone: {
      portrait: numericPortraitFileName,
      landscape: numericLandscapeName,
    },
    iPad: {
      portrait: iPadNumericPortraitName,
      landscape: iPadNumericLandscapeName,
      floating: numericPortraitFileName,
    },
  },
  numericNineGrid: {
    iPhone: {
      portrait: numericNineGridPortraitFileName,
      landscape: numericNineGridLandscapeName,
    },
    iPad: {
      portrait: iPadNumericPortraitName,
      landscape: iPadNumericLandscapeName,
      floating: numericNineGridPortraitFileName,
    },
  },
  symbolic: {
    iPhone: {
      portrait: symbolicPortraitFileName,
      landscape: symbolicLandscapeName,
    },
    iPad: {
      portrait: iPadPinyinPortraitName,
      landscape: iPadPinyinLandscapeName,
      floating: symbolicPortraitFileName,
    },
  },
};

{
  'config.yaml': std.manifestYamlDoc(config, indent_array_in_object=true, quote_keys=false),

  ['light/' + pinyinPortraitFileName + '.yaml']: std.toString(lightPinyinPortraitFileContent),
  ['dark/' + pinyinPortraitFileName + '.yaml']: std.toString(darkPinyinPortraitFileContent),
  ['light/' + pinyinLandscapeFileName + '.yaml']: std.toString(lightPinyinLandscapeFileContent),
  ['dark/' + pinyinLandscapeFileName + '.yaml']: std.toString(darkPinyinLandscapeFileContent),
  ['light/' + englishPortraitFileName + '.yaml']: std.toString(lightEnglishPortraitFileContent),
  ['dark/' + englishPortraitFileName + '.yaml']: std.toString(darkEnglishPortraitFileContent),
  ['light/' + englishLandscapeFileName + '.yaml']: std.toString(lightEnglishLandscapeFileContent),
  ['dark/' + englishLandscapeFileName + '.yaml']: std.toString(darkEnglishLandscapeFileContent),

  ['light/' + numericPortraitFileName + '.yaml']: std.toString(lightNumericPortraitFileContent),
  ['dark/' + numericPortraitFileName + '.yaml']: std.toString(darkNumericPortraitFileContent),
  ['light/' + numericLandscapeName + '.yaml']: std.toString(lightNumericLandscapeFileContent),
  ['dark/' + numericLandscapeName + '.yaml']: std.toString(darkNumericLandscapeFileContent),

  ['light/' + numericNineGridPortraitFileName + '.yaml']: std.toString(lightNumericNineGridPortraitFileContent),
  ['dark/' + numericNineGridPortraitFileName + '.yaml']: std.toString(darkNumericNineGridPortraitFileContent),
  ['light/' + numericNineGridLandscapeName + '.yaml']: std.toString(lightNumericNineGridLandscapeFileContent),
  ['dark/' + numericNineGridLandscapeName + '.yaml']: std.toString(darkNumericNineGridLandscapeFileContent),

  ['light/' + symbolicPortraitFileName + '.yaml']: std.toString(lightSymbolicPortraitFileContent),
  ['dark/' + symbolicPortraitFileName + '.yaml']: std.toString(darkSymbolicPortraitFileContent),
  ['light/' + symbolicLandscapeName + '.yaml']: std.toString(lightSymbolicLandscapeFileContent),
  ['dark/' + symbolicLandscapeName + '.yaml']: std.toString(darkSymbolicLandscapeFileContent),

  ['light/' + iPadPinyinPortraitName + '.yaml']: std.toString(lightIpadPinyinPortraitContent),
  ['dark/' + iPadPinyinPortraitName + '.yaml']: std.toString(darkIpadPinyinPortraitContent),
  ['light/' + iPadPinyinLandscapeName + '.yaml']: std.toString(lightIpadPinyinLandscapeContent),
  ['dark/' + iPadPinyinLandscapeName + '.yaml']: std.toString(darkIpadPinyinLandscapeContent),

  ['light/' + iPadNumericPortraitName + '.yaml']: std.toString(lightIpadNumericPortraitContent),
  ['dark/' + iPadNumericPortraitName + '.yaml']: std.toString(darkIpadNumericPortraitContent),
  ['light/' + iPadNumericLandscapeName + '.yaml']: std.toString(lightIpadNumericLandscapeContent),
  ['dark/' + iPadNumericLandscapeName + '.yaml']: std.toString(darkIpadNumericLandscapeContent),
}

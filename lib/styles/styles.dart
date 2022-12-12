import 'package:flutter/material.dart';

class Styles {
  // font
  static final String _fontNameDefault = 'Montserrat';

  //text size
  static const _textSizeLarge = 20.0;
  static const _textSizeListPage = 14.0;
  static const _textSizeListSubscriberRate = 12.0;
  static const _textSizeDefault = 16.0;
  static const _textSizeDescription = 15.0;
  static const _textSizeSmall = 12.0;

  // text colors
  static final Color _textColorStrong = _hexToColor('000000');
  static final Color _textColorDefault = _hexToColor('000000');
  static final Color _textColorFaint = _hexToColor('888888');
  static final Color textColorBright = _hexToColor('FFFFFF');
  static final Color accentColor = _hexToColor('FF0000');

  static const horizontalPaddingDefault = 12.0;
  static const horizontalPaddingDetails = 20.0;

  // channel detail
  static const channelDetailBannerImageHeight = 300.0;
  static const channelDetailBannerImageWidth = 300.0;
  static const channelDetailBodyVerticalPadding = 20.0;
  static const channelDetailFooterHeight = 100.0;

  static final navBarTitle = TextStyle(
    fontFamily: _fontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: _textSizeDefault,
    color: Colors.black,
  );
  static final headerLarge = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 24,
    color: _textColorStrong,
  );
  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    color: _textColorDefault,
    height: 1.2,
  );
  static final textCTAButton = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeLarge,
    color: textColorBright,
  );
  static final channelTileStarDark = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 16.0,
    color: textColorBright,
  );

  static final channelDetailsTitleLight = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 16,
    color: _textColorStrong,
  );
  static final channelTileTitleLight = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeListPage,
    color: _textColorStrong,
  );
  static final channelTileSubscriberRate = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeListSubscriberRate,
    color: textColorBright,
  );
  static final channelTileTitleDark = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeListPage,
    color: textColorBright,
  );
  static final channelTileDescription = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDescription,
    color: Colors.black,
  );
  static final channelTileCaption = TextStyle(
      fontFamily: _fontNameDefault,
      fontSize: 12,
      color: Colors.black87,
      height: 1.1);

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}

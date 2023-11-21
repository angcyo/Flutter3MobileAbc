// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class LPS {
  LPS();

  static LPS? _current;

  static LPS get current {
    assert(_current != null,
        'No instance of LPS was loaded. Try to initialize the LPS delegate before accessing LPS.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<LPS> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = LPS();
      LPS._current = instance;

      return instance;
    });
  }

  static LPS of(BuildContext context) {
    final instance = LPS.maybeOf(context);
    assert(instance != null,
        'No instance of LPS present in the widget tree. Did you add LPS.delegate in localizationsDelegates?');
    return instance!;
  }

  static LPS? maybeOf(BuildContext context) {
    return Localizations.of<LPS>(context, LPS);
  }

  /// `主页`
  String get home {
    return Intl.message(
      '主页',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `社区`
  String get community {
    return Intl.message(
      '社区',
      name: 'community',
      desc: '',
      args: [],
    );
  }

  /// `我的`
  String get mine {
    return Intl.message(
      '我的',
      name: 'mine',
      desc: '',
      args: [],
    );
  }

  /// `点击连接设备`
  String get clickConnectDeviceLabel {
    return Intl.message(
      '点击连接设备',
      name: 'clickConnectDeviceLabel',
      desc: '',
      args: [],
    );
  }

  /// `创作`
  String get creation {
    return Intl.message(
      '创作',
      name: 'creation',
      desc: '',
      args: [],
    );
  }

  /// `拍摄`
  String get camera {
    return Intl.message(
      '拍摄',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `相册`
  String get album {
    return Intl.message(
      '相册',
      name: 'album',
      desc: '',
      args: [],
    );
  }

  /// `素材`
  String get material {
    return Intl.message(
      '素材',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `关注`
  String get attention {
    return Intl.message(
      '关注',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `粉丝`
  String get fans {
    return Intl.message(
      '粉丝',
      name: 'fans',
      desc: '',
      args: [],
    );
  }

  /// `获赞与收藏`
  String get like {
    return Intl.message(
      '获赞与收藏',
      name: 'like',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<LPS> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<LPS> load(Locale locale) => LPS.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

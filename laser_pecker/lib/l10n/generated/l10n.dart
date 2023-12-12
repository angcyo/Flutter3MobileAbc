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

  /// `帖子`
  String get article {
    return Intl.message(
      '帖子',
      name: 'article',
      desc: '',
      args: [],
    );
  }

  /// `文件管理`
  String get files {
    return Intl.message(
      '文件管理',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `历史雕刻`
  String get history {
    return Intl.message(
      '历史雕刻',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `帮助`
  String get help {
    return Intl.message(
      '帮助',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `设置`
  String get setting {
    return Intl.message(
      '设置',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `最近连接设备`
  String get nearConnectedDeviceLabel {
    return Intl.message(
      '最近连接设备',
      name: 'nearConnectedDeviceLabel',
      desc: '',
      args: [],
    );
  }

  /// `更多`
  String get more {
    return Intl.message(
      '更多',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `APP版本:V{versionName}`
  String appVersionTip(String versionName) {
    return Intl.message(
      'APP版本:V$versionName',
      name: 'appVersionTip',
      desc: '',
      args: [versionName],
    );
  }

  /// `账号`
  String get account {
    return Intl.message(
      '账号',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `密码`
  String get password {
    return Intl.message(
      '密码',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `忘记密码?`
  String get forgetPassword {
    return Intl.message(
      '忘记密码?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get register {
    return Intl.message(
      '注册',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `点击上面的按钮，即表示您确认已阅读并同意我们的<a href='https://faq.hingin.com/docs/service'>"服务条款"</a>和<a href='https://faq.hingin.com/docs/privacy_creation'>"隐私政策"</a>以及使用服务的隐私声明。`
  String get registerPrivacy {
    return Intl.message(
      '点击上面的按钮，即表示您确认已阅读并同意我们的<a href=\'https://faq.hingin.com/docs/service\'>"服务条款"</a>和<a href=\'https://faq.hingin.com/docs/privacy_creation\'>"隐私政策"</a>以及使用服务的隐私声明。',
      name: 'registerPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `请阅读并同意隐私服务协议`
  String get privacyTip {
    return Intl.message(
      '请阅读并同意隐私服务协议',
      name: 'privacyTip',
      desc: '',
      args: [],
    );
  }

  /// `机型`
  String get machineType {
    return Intl.message(
      '机型',
      name: 'machineType',
      desc: '',
      args: [],
    );
  }

  /// `注册日期`
  String get registerTime {
    return Intl.message(
      '注册日期',
      name: 'registerTime',
      desc: '',
      args: [],
    );
  }

  /// `固件版本`
  String get firmwareVersion {
    return Intl.message(
      '固件版本',
      name: 'firmwareVersion',
      desc: '',
      args: [],
    );
  }

  /// `软件版本`
  String get softwareVersion {
    return Intl.message(
      '软件版本',
      name: 'softwareVersion',
      desc: '',
      args: [],
    );
  }

  /// `历史连接设备`
  String get deviceHistory {
    return Intl.message(
      '历史连接设备',
      name: 'deviceHistory',
      desc: '',
      args: [],
    );
  }

  /// `我知道了`
  String get iKnown {
    return Intl.message(
      '我知道了',
      name: 'iKnown',
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

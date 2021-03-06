import 'package:flutter_cloud_music/common/values/constants.dart';

abstract class Routes {
  Routes._();

  static const ROUTES_HOST = _Paths.ROUTES_HOST;

  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const NOT_FOUND = _Paths.NOT_FOUND;

  static const LOGIN = _Paths.LOGIN;
  static const PHONE_LOGIN = _Paths.PHONE_LOGIN;
  static const PWD_LOGIN = _Paths.PWD_LOGIN;
  static const VER_CODE = _Paths.VER_CODE;
  static const EMAIL_LOGIN = _Paths.EMAIL_LOGIN;

  static const FOUND = _Paths.FOUND;
  static const PODCAST = _Paths.PODCAST;
  static const MINE = _Paths.MINE;
  static const K_SONG = _Paths.K_SONG;
  static const CLOUD_VILLAGE = _Paths.CLOUD_VILLAGE;

  static const PLAYLIST_COLLECTION = _Paths.PLAYLIST_COLLECTION;

  static const PLAYLIST_TAGS = _Paths.PLAYLIST_TAGS;

  static const PLAYLIST_DETAIL = _Paths.PLAYLIST_DETAIL;

  static const RCMD_SONG_DAY = _Paths.RCMD_SONG_DAY;

  static const PRIVATE_FM = _Paths.PRIVATE_FM;

  static const PLAYING = _Paths.PLAYING;

  static const WEB = _Paths.WEB;

  static const NEW_SONG_ALBUM = _Paths.NEW_SONG_ALBUM;

  static const ALBUM_DETAIL = _Paths.ALBUM_DETAIL;

  static const MUSIC_CALENDAR = _Paths.MUSIC_CALENDAR;

  static const SINGER_PAGE = _Paths.SINGER_PAGE;

  static const SINGER_DETAIL = _Paths.SINGER_DETAIL;

  static const PAGE_MID_LOADING = _Paths.PAGE_MID_LOADING;

  static const PL_MANAGE = _Paths.PL_MANAGE;

  static const ADD_SONG = _Paths.ADD_SONG;

  static const ADD_VIDEO = _Paths.ADD_VIDEO;

  static const SINGLE_SEARCH = _Paths.SINGLE_SEARCH;

  static const VIDEO_PLAY = _Paths.VIDEO_PLAY;

  static const COMMENT_DETAIL = _Paths.COMMENT_DETAIL;

  static const SEARCH = _Paths.SEARCH;

  static const RANK = _Paths.RANK;

  static String PLAYLIST_DETAIL_ID(String id) => '/playlist/$id';

  static String ALBUM_DETAIL_ID(String id) => '/album/$id';

  static String PAGE_LOADING_THEN(String route) => '/page_mid_loading$route';

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

abstract class _Paths {
  static const ROUTES_HOST = '$APP_ROUTER_TAG://';
  static const NOT_FOUND = '/not_found';
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PHONE_LOGIN = '/phone_login';
  static const PWD_LOGIN = '/pwd_login';
  static const VER_CODE = '/verification';
  static const EMAIL_LOGIN = '/email_login';
  static const FOUND = '/found';
  static const PODCAST = '/podcast';
  static const MINE = '/mine';
  static const K_SONG = '/k_song';
  static const CLOUD_VILLAGE = '/cloud_cillage';

  //pageLoading
  static const PAGE_MID_LOADING = '/page_mid_loading/:route';

  // ????????????
  static const PLAYLIST_COLLECTION = '/playlistCollection';

  //??????????????????
  static const PLAYLIST_TAGS = '/playlistTags';

  //???????????? id:??????ID
  static const PLAYLIST_DETAIL = "/playlist/:id";

  //????????????
  static const RCMD_SONG_DAY = '/songrcmd';

  //??????FM????????????
  static const PRIVATE_FM = "/privatefm";

  //????????????
  static const PLAYING = "/song/:id";

  //html??????
  static const WEB = "/openurl";

  //?????? ?????????
  static const NEW_SONG_ALBUM = '/nm/discovery/newsongalbum';

  //????????????
  static const ALBUM_DETAIL = '/album/:id';

  //????????????
  static const MUSIC_CALENDAR = '/nm/musicCalendar/detail';

  //??????????????????
  static const SINGER_PAGE = '/singer';

  //????????????
  static const SINGER_DETAIL = '/singer/detail';

  //????????????
  static const PL_MANAGE = '/plManage';

  //?????????????????????
  static const ADD_SONG = '/add_song';

  //?????????????????????
  static const ADD_VIDEO = '/add_video';

  //???????????????????????????????????????
  static const SINGLE_SEARCH = '/single_search';

  //????????????
  static const VIDEO_PLAY = '/video_play';

  //????????????
  static const COMMENT_DETAIL = '/comment/detail';

  //search
  static const SEARCH = '/search';

  //?????????
  static const RANK = '/rnpage';
}

/*
 * @Author: XingWei 
 * @Date: 2021-07-23 10:40:24 
 * @Last Modified by: XingWei
 * @Last Modified time: 2021-08-20 19:26:44
 * 
 * 间隔
 * 官方做法：https://github.com/flutter/flutter/pull/54394
 */
import 'package:flutter/material.dart';
import 'package:flutter_cloud_music/common/res/colors.dart';
import 'package:flutter_cloud_music/common/utils/adapt.dart';

import 'dimens.dart';

class Gaps {
  Gaps._();

  /// 水平间隔
  static Widget hGap1 = SizedBox(width: Dimens.gap_dp1);
  static Widget hGap2 = SizedBox(width: Dimens.gap_dp2);
  static Widget hGap3 = SizedBox(width: Dimens.gap_dp3);
  static Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static Widget hGap7 = SizedBox(width: Dimens.gap_dp7);
  static Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static Widget hGap9 = SizedBox(width: Dimens.gap_dp9);
  static Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static Widget hGap14 = SizedBox(width: Dimens.gap_dp14);
  static Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static Widget hGap20 = SizedBox(width: Dimens.gap_dp20);
  static Widget hGap24 = SizedBox(width: Dimens.gap_dp24);
  static Widget hGap28 = SizedBox(width: Dimens.gap_dp28);
  static Widget hGap36 = SizedBox(width: Dimens.gap_dp36);
  static Widget hGap32 = SizedBox(width: Dimens.gap_dp32);

  /// 垂直间隔
  static Widget vGap2 = SizedBox(height: Dimens.gap_dp2);
  static Widget vGap3 = SizedBox(height: Dimens.gap_dp3);
  static Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static Widget vGap6 = SizedBox(height: Dimens.gap_dp6);
  static Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static Widget vGap7 = SizedBox(height: Dimens.gap_dp7);
  static Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static Widget vGap14 = SizedBox(height: Dimens.gap_dp14);
  static Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static Widget vGap18 = SizedBox(height: Dimens.gap_dp18);
  static Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static Widget vGap26 = SizedBox(height: Dimens.gap_dp26);
  static Widget vGap36 = SizedBox(height: Dimens.gap_dp36);
  static Widget vGap40 = SizedBox(height: Dimens.gap_dp40);
  static Widget vGap20 = SizedBox(height: Dimens.gap_dp20);
  static Widget vGap50 = SizedBox(height: Dimens.gap_dp50);
  static Widget vGap80 = SizedBox(height: Dimens.gap_dp80);
  static Widget vGap100 = SizedBox(height: Adapt.px(100));
  static Widget line = Divider(height: Dimens.gap_dp1);

  /// 补充一种空Widget实现 https://github.com/letsar/nil
  /// https://github.com/flutter/flutter/issues/78159
  static const Widget empty = SizedBox.shrink();

  static Widget ovalImgHolder(Size size) => ClipOval(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colours.load_image_placeholder(),
        ),
      );
}

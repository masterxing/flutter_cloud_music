/*
 * @Author: XingWei 
 * @Date: 2021-08-23 19:14:19 
 * @Last Modified by: XingWei
 * @Last Modified time: 2021-08-23 20:56:10
 * 
 * 歌曲通用item,包括点击事件,播放状态,mv图标
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cloud_music/common/model/song_model.dart';
import 'package:flutter_cloud_music/common/model/ui_element_model.dart';
import 'package:flutter_cloud_music/common/player/player.dart';
import 'package:flutter_cloud_music/common/res/colors.dart';
import 'package:flutter_cloud_music/common/res/dimens.dart';
import 'package:flutter_cloud_music/common/res/gaps.dart';
import 'package:flutter_cloud_music/common/utils/adapt.dart';
import 'package:flutter_cloud_music/common/utils/common_utils.dart';
import 'package:flutter_cloud_music/common/utils/image_utils.dart';
import 'package:flutter_cloud_music/routes/routes_utils.dart';
import 'package:flutter_cloud_music/typedef/function.dart';
import 'package:flutter_cloud_music/widgets/custom_tap.dart';
import 'package:get/get.dart';

class GeneralSongTwo extends StatelessWidget {
  final Song songInfo;
  final UiElementModel uiElementModel;
  final ParamVoidCallback? onPressed;

  const GeneralSongTwo(
      {required this.songInfo, required this.uiElementModel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        if (onPressed == null) {
          RouteUtils.routeFromActionStr(songInfo.actionType);
        } else {
          onPressed!.call();
        }
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(Dimens.gap_dp8)),
            child: CachedNetworkImage(
              height: Dimens.gap_dp49,
              width: Dimens.gap_dp49,
              placeholder: (context, url) {
                return Container(
                  color: Colours.load_image_placeholder(),
                );
              },
              imageUrl: ImageUtils.getImageUrlFromSize(
                  songInfo.al.picUrl, Size(Dimens.gap_dp49, Dimens.gap_dp49)),
              imageBuilder: (context, provider) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(image: provider),
                    Obx(() =>
                        context.playerService.curPlayId.value != songInfo.id
                            ? Image.asset(
                                ImageUtils.getImagePath('icon_play_small'),
                                width: Dimens.gap_dp20,
                                height: Dimens.gap_dp20,
                                color: Colors.white.withOpacity(0.8))
                            : Image.asset(
                                ImageUtils.getPlayingMusicTag(),
                                key: Key('$songInfo.id'),
                                width: Dimens.gap_dp15,
                                height: Dimens.gap_dp15,
                                color: Colors.white.withOpacity(0.9),
                              ))
                  ],
                );
              },
            ),
          ),
          Gaps.hGap9,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: uiElementModel.mainTitle?.title.toString(),
                    style: headline1Style(),
                    children: [
                      WidgetSpan(child: Gaps.hGap4),
                      TextSpan(
                        text: '-',
                        style: TextStyle(
                            fontSize: Dimens.font_sp10,
                            color: const Color.fromARGB(255, 166, 166, 166)),
                      ),
                      WidgetSpan(child: Gaps.hGap4),
                      TextSpan(
                        text: songInfo.arString(),
                        style: TextStyle(
                            fontSize: Dimens.font_sp10,
                            color: const Color.fromARGB(255, 166, 166, 166)),
                      ),
                    ],
                  ),
                ),
              ),
              _buildSubTitle()
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildSubTitle() {
    if (GetUtils.isNullOrBlank(uiElementModel.subTitle?.title) == true) {
      return Gaps.empty;
    }
    if (uiElementModel.subTitle?.titleType == 'songRcmdTag') {
      return Container(
          height: Adapt.px(13),
          padding: EdgeInsets.only(left: Adapt.px(4), right: Adapt.px(4)),
          decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? Colors.white30
                  : const Color.fromARGB(255, 253, 246, 226),
              borderRadius: BorderRadius.all(Radius.circular(Adapt.px(2)))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                uiElementModel.subTitle?.title ?? '',
                style: TextStyle(
                    fontSize: Adapt.px(9),
                    color: Get.isDarkMode
                        ? Colours.white
                        : const Color.fromARGB(255, 236, 192, 100)),
              ),
            ],
          ));
    } else {
      return Row(
        children: [
          Row(
            children: getSongTags(songInfo),
          ),
          Text(uiElementModel.subTitle?.title ?? "",
              style: TextStyle(
                  fontSize: Adapt.px(11),
                  color: const Color.fromARGB(255, 166, 166, 166)))
        ],
      );
    }
  }
}

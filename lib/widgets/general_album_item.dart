/*
 * @Author: XingWei 
 * @Date: 2021-08-23 19:14:19 
 * @Last Modified by: XingWei
 * @Last Modified time: 2021-08-23 20:56:10
 * 
 * 歌曲通用item,包括点击事件,播放状态
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cloud_music/common/model/song_model.dart';
import 'package:flutter_cloud_music/common/model/ui_element_model.dart';
import 'package:flutter_cloud_music/common/res/colors.dart';
import 'package:flutter_cloud_music/common/res/dimens.dart';
import 'package:flutter_cloud_music/common/res/gaps.dart';
import 'package:flutter_cloud_music/common/utils/adapt.dart';
import 'package:flutter_cloud_music/common/utils/common_utils.dart';
import 'package:flutter_cloud_music/common/utils/image_utils.dart';
import 'package:flutter_cloud_music/routes/routes_utils.dart';
import 'package:flutter_cloud_music/widgets/custom_tap.dart';

class GeneralAlbumItem extends StatelessWidget {
  final List<Ar> artists;
  final UiElementModel uiElementModel;
  final String action;

  const GeneralAlbumItem(
      {required this.artists,
      required this.uiElementModel,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        RouteUtils.routeFromActionStr(action);
      },
      child: Row(
        children: [
          Column(
            children: [
              Image.asset(
                ImageUtils.getImagePath('cqb'),
                height: Adapt.px(4.5),
                fit: BoxFit.fill,
              ),
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
                      uiElementModel.image?.imageUrl,
                      Size(Dimens.gap_dp49, Dimens.gap_dp49)),
                ),
              )
            ],
          ),
          Gaps.hGap9,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
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
                        text: artists
                            .map((e) => e.name)
                            .toList()
                            .reduce((value, element) => '$value/$element')
                            .toString(),
                        style: TextStyle(
                          fontSize: Dimens.font_sp10,
                          color: const Color.fromARGB(255, 166, 166, 166),
                        ),
                      ),
                    ],
                  )),
              if (uiElementModel.subTitle?.title != null)
                Text(
                  uiElementModel.subTitle!.title!,
                  style: TextStyle(
                    fontSize: Adapt.px(11),
                    color: const Color.fromARGB(255, 166, 166, 166),
                  ),
                )
            ],
          ))
        ],
      ),
    );
  }
}

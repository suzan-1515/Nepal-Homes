import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/icon_badge_widget.dart';
import 'package:nepal_homes/core/extensions/number_extensions.dart';

class CommentBar extends StatelessWidget {
  final VoidCallback onLikeTap;
  final VoidCallback onShareTap;
  final VoidCallback onCommentTap;
  final int commentCount;
  final bool isLiked;
  final int likeCount;
  final int shareCount;
  final String userAvatar;

  CommentBar({
    Key key,
    @required this.onLikeTap,
    @required this.onCommentTap,
    @required this.onShareTap,
    @required this.commentCount,
    @required this.likeCount,
    @required this.shareCount,
    @required this.userAvatar,
    @required this.isLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Theme.of(context).dividerColor, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: onCommentTap,
              child: Container(
                height: 34,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 12,
                      backgroundImage:
                          (userAvatar == null || userAvatar.isEmpty)
                              ? AssetImage('assets/images/user.png')
                              : CachedNetworkImageProvider(userAvatar),
                      backgroundColor:
                          Theme.of(context).primaryColor.withOpacity(0.3),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${commentCount.compactFormat} Comments',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ),
          (commentCount != 0)
              ? IconBadge(
                  iconData: FontAwesomeIcons.comment,
                  badgeText: commentCount.toString(),
                  onTap: onCommentTap,
                )
              : IconButton(
                  icon: Icon(
                    FontAwesomeIcons.comment,
                    size: 16,
                  ),
                  onPressed: onCommentTap,
                ),
          (likeCount != 0)
              ? IconBadge(
                  iconData: isLiked
                      ? FontAwesomeIcons.solidThumbsUp
                      : FontAwesomeIcons.thumbsUp,
                  badgeText: likeCount.compactFormat,
                  onTap: onLikeTap,
                )
              : IconButton(
                  icon: Icon(
                    isLiked
                        ? FontAwesomeIcons.solidThumbsUp
                        : FontAwesomeIcons.thumbsUp,
                    size: 16,
                  ),
                  onPressed: onLikeTap,
                ),
          (shareCount != 0)
              ? IconBadge(
                  iconData: FontAwesomeIcons.shareAlt,
                  badgeText: shareCount.compactFormat,
                  onTap: onShareTap,
                )
              : IconButton(
                  icon: Icon(
                    FontAwesomeIcons.shareAlt,
                    size: 16,
                  ),
                  onPressed: onShareTap,
                ),
        ],
      ),
    );
  }
}

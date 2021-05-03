import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_sample/model/data/article_data.dart';

class ArticleCard extends StatelessWidget {
  ArticleCard(this.article);

  final ArticleData article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Card(
        elevation: 3.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.w)),
        ),
        child: Container(
          height: 340.w,
          padding: EdgeInsets.all(20.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                article.envelopePic!,
                width: 180.w,
                height: 300.w,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 30.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        article.desc!,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(article.niceDate! + " " + article.author!)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../domain/entity/news_entity/news_entity.dart';
import '../shared_widgets/web_view_news.dart';

class NewsItem extends StatelessWidget {
  final NewsEntity newsEntity;
  const NewsItem({super.key, required this.newsEntity} ) ;
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap:newsEntity.url != null?(){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>
            NewsWebViewScreen(url:newsEntity.url!,name:newsEntity.title??""
            ),
           ),
          );
        } : null,

        child: Container(
          width: double.infinity,
          height:300,
          decoration: BoxDecoration(
            color:Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                offset: Offset(0, 2),
                blurRadius: 5,
                spreadRadius:4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  clipBehavior:Clip.antiAlias ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),

                  ),
                  child: CachedNetworkImage(imageUrl:newsEntity.urlToImage??"",fit: BoxFit.cover,
                  placeholder: (context,value){
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                        )
                    );
                  },
                  errorWidget: (context,value,object){

                    return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0)),
                        )
                    );
                  },
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      newsEntity.title??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      newsEntity.description??"",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      newsEntity.publishedAt?.toString()??"",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

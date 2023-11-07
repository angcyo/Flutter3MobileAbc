import 'package:flutter/material.dart';
import 'package:flutter3_app/flutter3_app.dart';

///
/// @author <a href="mailto:angcyo@126.com">angcyo</a>
/// @since 2023/11/07
///

/// [randomImageUrl]
Widget randomImageWidget() {
  var url = randomImageUrl();
  return CachedNetworkImage(
    imageUrl: url,
    //placeholder: (context, url) => randomWidget(url),
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        const LoadingIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
    fit: BoxFit.cover,
  );
}

/// [randomImagePlaceholderUrl]
Widget randomImagePlaceholderWidget() {
  var url = randomImagePlaceholderUrl();
  return CachedNetworkImage(
    imageUrl: url,
    //placeholder: (context, url) => randomWidget(url),
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        const LoadingIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.error),
    fit: BoxFit.cover,
  );
}

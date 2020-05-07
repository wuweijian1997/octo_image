import 'package:flutter/material.dart';

import '../octo_image.dart';

/// Helper class with pre-made [OctoErrorBuilder]s. These can be directly
/// used when creating an image.
/// For example:
///    OctoImage(
///      image: NetworkImage('https://dummyimage.com/600x400/000/fff'),
///      errorBuilder: OctoError.icon(),
///    );
class OctoError {
  /// Show an icon. Default to [Icons.error]. Color can be set, but defaults to
  /// the value given by the current [IconTheme].
  static OctoErrorBuilder icon({
    IconData icon = Icons.error,
    Color color,
  }) {
    return (context, error, stacktrace) => Icon(
          icon,
          color: color,
        );
  }

  /// Displays a [CircleAvatar] as errorWidget
  static OctoErrorBuilder circleAvatar({
    @required Color backgroundColor,
    @required Widget text,
  }) {
    return (context, error, stacktrace) => SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CircleAvatar(
            child: text,
            backgroundColor: backgroundColor,
          ),
        );
  }

  /// Show [OctoPlaceholder.blurHash] with an error icon on top.
  static OctoErrorBuilder blurHash(String hash, {BoxFit fit}) {
    return placeholderWithErrorIcon(OctoPlaceholder.blurHash(hash));
  }

  /// Simple stack that shows an icon over the placeholder with a 50% opacity.
  static OctoErrorBuilder placeholderWithErrorIcon(
      OctoPlaceholderBuilder placeholderBuilder, {IconData icon}) {
    icon ??= Icons.error_outline;
    return (context, error, stacktrace) => Stack(
          alignment: Alignment.center,
          children: [
            placeholderBuilder(context),
            Opacity(opacity: 0.75,child: Icon(icon, size: 30,)),
          ],
        );
  }
}

///Name: Md. Abdur Rouf
///Email: official.rouf69nb@gmail.com
///Created at: Jan 26, 2022

import 'package:flutter/material.dart';

class CustomTrackShape extends SliderTrackShape with BaseSliderTrackShape {
  /// Create a slider track that draws two rectangles with rounded outer edges.
  const CustomTrackShape();

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 2,
      }) {
    // If the slider [SliderThemeData.trackHeight] is less than or equal to 0,
    // then it makes no difference whether the track is painted or not,
    // therefore the painting  can be a no-op.
    if (sliderTheme.trackHeight == null || sliderTheme.trackHeight! <= 0) {
      return;
    }

    // Assign the track segment paints, which are leading: active and
    // trailing: inactive.
    final ColorTween activeTrackColorTween = ColorTween(begin: sliderTheme.disabledActiveTrackColor, end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(begin: sliderTheme.disabledInactiveTrackColor, end: sliderTheme.inactiveTrackColor);
    final Paint activePaint = Paint()..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()..color = inactiveTrackColorTween.evaluate(enableAnimation)!;
    final Paint leftTrackPaint;
    final Paint rightTrackPaint;
    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final Radius trackRadius = Radius.circular(trackRect.height / 2);
    final Radius activeTrackRadius = Radius.circular((trackRect.height + additionalActiveTrackHeight) / 2);

    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        trackRect.left,
        (textDirection == TextDirection.ltr) ? trackRect.top : trackRect.top,
        thumbCenter.dx,
        (textDirection == TextDirection.ltr) ? trackRect.bottom : trackRect.bottom,
        topLeft: (textDirection == TextDirection.ltr) ? activeTrackRadius : trackRadius,
        bottomLeft: (textDirection == TextDirection.ltr) ? activeTrackRadius: trackRadius,
      ),
      leftTrackPaint,
    );
    context.canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        thumbCenter.dx,
        (textDirection == TextDirection.rtl) ? trackRect.top : trackRect.top,
        trackRect.right,
        (textDirection == TextDirection.rtl) ? trackRect.bottom : trackRect.bottom,
        topRight: (textDirection == TextDirection.rtl) ? activeTrackRadius : trackRadius,
        bottomRight: (textDirection == TextDirection.rtl) ? activeTrackRadius : trackRadius,
      ),
      rightTrackPaint,
    );
  }
}

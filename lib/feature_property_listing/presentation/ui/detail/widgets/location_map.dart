import 'package:flutter/material.dart';
import 'package:nepal_homes/core/widgets/bordered_container.dart';
import 'package:nepal_homes/feature_property_listing/presentation/models/property_detail_model.dart';
import 'package:nepal_homes/feature_property_listing/presentation/ui/detail/widgets/section_header.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sizer/sizer.dart';

class LocationMap extends StatelessWidget {
  const LocationMap();

  @override
  Widget build(BuildContext context) {
    final property =
        ScopedModel.of<PropertyDetailUIModel>(context, rebuildOnChange: true);
    final mapHeight = SizerUtil.orientation == Orientation.portrait? 50.0.w:30.0.h;
    return BorderedContainer(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: 'Map'),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: mapHeight,
            child: IgnorePointer(
              child: WebView(
                initialUrl: Uri.dataFromString(
                        '<html><body><iframe allowtransparency="true" scrolling="no" style="width:100%;height:${mapHeight}px;" src="${property.entity.mapSrc}" frameborder="0" "></iframe></body></html>',
                        mimeType: 'text/html')
                    .toString(),
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

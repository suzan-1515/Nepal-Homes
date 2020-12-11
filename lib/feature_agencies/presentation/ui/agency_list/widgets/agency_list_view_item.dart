import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nepal_homes/core/widgets/cached_image_widget.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_model.dart';
import 'package:nepal_homes/core/widgets/icon_text.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/agency_detail_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyListViewItem extends StatelessWidget {
  const AgencyListViewItem();
  @override
  Widget build(BuildContext context) {
    final agency =
        ScopedModel.of<AgencyUIModel>(context, rebuildOnChange: true);
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          width: 0.5,
          style: BorderStyle.solid,
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          AgencyDetailScreen.ROUTE_NAME,
          arguments:
              AgencyDetailScreenArgs(agency.entity.id, agencyUIModel: agency),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: 1 / 1.1,
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: Theme.of(context).dividerColor),
                    ),
                    child: CachedImage(
                      agency.entity.logo.fullPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4.0),
                    Text(
                      agency.entity.title,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Properties Listed: ${agency.entity.productCount}',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    const SizedBox(height: 16.0),
                    IconText(
                        label: Text(
                          agency.entity.address,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        icon: Icon(
                          LineAwesomeIcons.search_location,
                          size: 16,
                        )),
                    const SizedBox(height: 8.0),
                    IconText(
                        label: Text(
                          agency.entity.email,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        icon: Icon(
                          LineAwesomeIcons.envelope,
                          size: 16,
                        )),
                    const SizedBox(height: 8.0),
                    IconText(
                      label: Text(
                        agency.entity.mobile,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      icon: Icon(
                        LineAwesomeIcons.phone,
                        size: 16,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

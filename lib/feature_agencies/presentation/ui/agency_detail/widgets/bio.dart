import 'package:flutter/material.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_detail_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/section_header.dart';
import 'package:readmore/readmore.dart';
import 'package:scoped_model/scoped_model.dart';

class Bio extends StatelessWidget {
  const Bio();
  @override
  Widget build(BuildContext context) {
    final agency =
        ScopedModel.of<AgencyDetailUIModel>(context, rebuildOnChange: true);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyText2;
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      decoration: BoxDecoration(
        border:
            Border.all(width: 0.3, color: theme.dividerColor.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: 'About'),
          SizedBox(height: 4),
          ReadMoreText(
            agency.entity.agency.description,
            trimLines: 5,
            colorClickableText: theme.accentColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Read more',
            trimExpandedText: ' Show less',
            style: textStyle.copyWith(color: textStyle.color.withOpacity(0.5)),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

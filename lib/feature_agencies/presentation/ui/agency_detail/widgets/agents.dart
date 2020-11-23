import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_detail_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/agent_list_item.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/section_header.dart';
import 'package:scoped_model/scoped_model.dart';

class Agents extends StatelessWidget {
  const Agents();
  @override
  Widget build(BuildContext context) {
    final agency =
        ScopedModel.of<AgencyDetailUIModel>(context, rebuildOnChange: true);
    final theme = Theme.of(context);
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
          SectionHeader(title: 'Agents'),
          SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            primary: false,
            physics: BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: agency.entity.agents
                  .map(
                    (e) => AgentListItem(
                      avatar: e.image.fullPath,
                      title: e.name,
                      email: e.email,
                      contact: e.mobileNo,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

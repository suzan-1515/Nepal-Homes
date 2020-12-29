import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_agencies/presentation/cubits/agency_list/agency_cubit.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/agency_list_screen.dart';
import 'package:nepal_homes/feature_agencies/utils/provider.dart';

import 'agency_horizontal_list.dart';
import 'section_container.dart';
import 'section_heading.dart';

class AgencySection extends StatelessWidget {
  const AgencySection();

  @override
  Widget build(BuildContext context) {
    return AgencyProvider.agencyBlocProvider(
      child: SectionContainer(
        heading: SectionHeading(
          title: 'Agencies',
          onViewAllTap: () =>
              Navigator.pushNamed(context, AgencyListScreen.ROUTE_NAME),
        ),
        content: BlocConsumer<AgencyCubit, AgencyState>(
          listener: (context, state) {
            if (state is AgencyError) {
              context.showMessage(state.message);
            } else if (state is AgencyLoadError) {
              context.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is AgencyLoadSuccess) {
              return AgencyHorizontalList(properties: state.agencies.take(6).toList());
            } else if (state is AgencyLoadError) {
              return Center(
                child: ErrorDataView(
                  message: state.message,
                  onRetry: () => context.read<AgencyCubit>().getAgencies(),
                ),
              );
            } else if (state is AgencyLoadEmpty) {
              return Center(
                child: EmptyDataView(
                  message: state.message,
                ),
              );
            }
            return Center(
              child: const ProgressView(),
            );
          },
        ),
      ),
    );
  }
}

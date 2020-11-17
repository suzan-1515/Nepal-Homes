import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_agencies/presentation/cubits/agency_cubit.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_list/widgets/agency_list_builder.dart';

class AgencyList extends StatelessWidget {
  const AgencyList();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AgencyCubit, AgencyState>(
      listener: (context, state) {
        if (state is AgencyLoadError) {
          context.showMessage(state.message);
        } else if (state is AgencyError) {
          context.showMessage(state.message);
        }
      },
      buildWhen: (previous, current) =>
          !(current is AgencyLoadingMore) && !(current is AgencyError),
      builder: (context, state) {
        if (state is AgencyLoadSuccess) {
          return AgencyListBuilder(
            data: state.agencies,
            hasMore: state.hasMore,
            onLoadMore: () => context.read<AgencyCubit>().getMoreAgencies(),
          );
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
        return Center(child: const ProgressView());
      },
    );
  }
}

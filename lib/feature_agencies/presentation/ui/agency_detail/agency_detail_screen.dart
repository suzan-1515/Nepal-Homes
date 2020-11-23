import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nepal_homes/core/extensions/view.dart';
import 'package:nepal_homes/core/widgets/empty_data_widget.dart';
import 'package:nepal_homes/core/widgets/error_data_widget.dart';
import 'package:nepal_homes/core/widgets/progress_widget.dart';
import 'package:nepal_homes/feature_agencies/presentation/cubits/agency_detail/agency_detail_cubit.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_detail_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/models/agency_model.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/agency_info.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/bio.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/contact.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/property_list.dart';
import 'package:nepal_homes/feature_agencies/presentation/ui/agency_detail/widgets/agents.dart';
import 'package:nepal_homes/feature_agencies/presentation/extensions/agency_extensions.dart';
import 'package:nepal_homes/feature_agencies/utils/provider.dart';
import 'package:scoped_model/scoped_model.dart';

class AgencyDetailScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/agency-detail';
  @override
  Widget build(BuildContext context) {
    final AgencyDetailScreenArgs args =
        ModalRoute.of(context).settings.arguments;
    final theme = Theme.of(context);
    return AgencyProvider.agencyDetailBlocProvider(
      id: args.id,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Agency Profile',
            style: theme.textTheme.subtitle1.copyWith(
              color: theme.appBarTheme.iconTheme.color,
            ),
          ),
        ),
        body: SafeArea(
          child: Builder(
            builder: (context) =>
                BlocConsumer<AgencyDetailCubit, AgencyDetailState>(
              listener: (context, state) {
                if (state is AgencyDetaiError) {
                  context.showMessage(state.message);
                } else if (state is AgencyDetailLoadError) {
                  context.showMessage(state.message);
                }
              },
              builder: (context, state) {
                if (state is AgencyDetailLoadSuccess) {
                  return ScopedModel<AgencyDetailUIModel>(
                    model: state.agencyDetailEntity.toUIModel,
                    child: CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          sliver: SliverToBoxAdapter(child: const AgencyInfo()),
                        ),
                        SliverToBoxAdapter(
                          child: const Contact(),
                        ),
                        SliverPadding(
                          padding:
                              const EdgeInsets.only(top: 16.0, bottom: 8.0),
                          sliver: SliverToBoxAdapter(child: const Bio()),
                        ),
                        SliverPadding(
                          padding:
                              const EdgeInsets.only(top: 8.0, bottom: 16.0),
                          sliver: SliverToBoxAdapter(child: const Agents()),
                        ),
                        const PropertyList(),
                      ],
                    ),
                  );
                } else if (state is AgencyDetailLoadError) {
                  return Center(
                    child: ErrorDataView(
                      message: state.message,
                      onRetry: () => context
                          .read<AgencyDetailCubit>()
                          .getDetail(id: args.id),
                    ),
                  );
                } else if (state is AgencyDetailLoadEmpty) {
                  return Center(
                    child: EmptyDataView(
                      message: state.message,
                    ),
                  );
                }

                return Center(
                  child: ProgressView(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AgencyDetailScreenArgs {
  final String id;
  final AgencyUIModel agencyUIModel;

  AgencyDetailScreenArgs(this.id, {this.agencyUIModel});
}

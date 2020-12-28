part of 'property_category_cubit.dart';

abstract class PropertyCategoryState extends Equatable {
  const PropertyCategoryState();

  @override
  List<Object> get props => [];
}

class PropertyCategoryInitial extends PropertyCategoryState {}

class PropertyCategoryLoading extends PropertyCategoryState {}

class PropertyCategoryLoadSuccess extends PropertyCategoryState {
  final List<PropertyCategoryEntity> propertyCategories;

  PropertyCategoryLoadSuccess({@required this.propertyCategories});

  @override
  List<Object> get props => [propertyCategories];
}

class PropertyCategoryLoadEmpty extends PropertyCategoryState {
  final String message;

  PropertyCategoryLoadEmpty({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyCategoryLoadError extends PropertyCategoryState {
  final String message;

  PropertyCategoryLoadError({@required this.message});

  @override
  List<Object> get props => [message];
}

class PropertyCategoryError extends PropertyCategoryState {
  final String message;

  PropertyCategoryError({@required this.message});

  @override
  List<Object> get props => [message];
}

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderCountryPicker extends FormBuilderField {
  @override
  final String attribute;
  @override
  final FormFieldValidator validator;
  @override
  final bool readOnly;
  @override
  final InputDecoration decoration;
  @override
  final ValueChanged onChanged;
  @override
  final ValueTransformer valueTransformer;

  @override
  final FormFieldSetter onSaved;
  @override
  final bool enabled;
  @override
  final String initialValue;
  final String initialSelection;
  final bool showCountryOnly;
  final bool showOnlyCountryWhenClosed;
  final List<String> favorite;
  final Function itemBuilder;
  final TextOverflow textOverflow;
  final bool alignLeft;
  final int Function(CountryCode, CountryCode) comparator;
  final List<String> countryFilter;
  final Size dialogSize;
  final TextStyle dialogTextStyle;
  final Widget Function(BuildContext) emptySearchBuilder;
  final double flagWidth;
  final bool hideMainText;
  final bool hideSearch;
  final void Function(CountryCode) onInit;
  final EdgeInsets padding;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final bool showFlag;
  final bool showFlagDialog;
  final bool showFlagMain;
  final TextStyle textStyle;

  FormBuilderCountryPicker({
    Key key,
    @required this.attribute,
    this.initialValue,
    this.validator,
    this.readOnly = false,
    this.decoration = const InputDecoration(),
    this.onChanged,
    this.valueTransformer,
    this.onSaved,
    this.favorite = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(0.0),
    this.showCountryOnly = true,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.dialogTextStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = true,
    this.alignLeft = false,
    this.showFlag = true,
    this.showFlagDialog,
    this.hideMainText = false,
    this.showFlagMain,
    this.itemBuilder,
    this.flagWidth = 32.0,
    this.enabled = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.comparator,
    this.countryFilter,
    this.hideSearch = false,
    this.dialogSize,
    this.initialSelection,
    this.onInit,
  }) : // assert(initialValue != null),
        super(
          key: key,
          initialValue: initialValue,
          attribute: attribute,
          validator: validator,
          enabled: enabled,
          /* autovalidate: autovalidate,*/
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          readOnly: true,
          onSaved: onSaved,
          builder: (FormFieldState field) {
            final _FormBuilderCountryPickerState state = field;

            return InputDecorator(
              decoration: decoration.copyWith(
                errorText: decoration?.errorText ?? field.errorText,
                enabled: !state.readOnly,
              ),
              child: CountryCodePicker(
                onChanged: (CountryCode e) {
                  state.didChange(e.toString());
                },
                initialSelection: initialSelection,
                showCountryOnly: showOnlyCountryWhenClosed,
                showOnlyCountryWhenClosed: showOnlyCountryWhenClosed,
                favorite: favorite,
                builder: itemBuilder,
                textOverflow: textOverflow,
                alignLeft: alignLeft,
                comparator: comparator,
                countryFilter: countryFilter,
                dialogSize: dialogSize,
                dialogTextStyle: dialogTextStyle,
                emptySearchBuilder: emptySearchBuilder,
                enabled: !state.readOnly,
                flagWidth: flagWidth,
                hideMainText: hideMainText,
                hideSearch: hideSearch,
                onInit: onInit,
                padding: padding,
                searchDecoration: searchDecoration,
                searchStyle: searchStyle,
                showFlag: showFlag,
                showFlagDialog: showFlagDialog,
                showFlagMain: showFlagMain,
                textStyle: textStyle,
              ),
            );
          },
        );

  @override
  _FormBuilderCountryPickerState createState() =>
      _FormBuilderCountryPickerState();
}

class _FormBuilderCountryPickerState extends FormBuilderFieldState/*<String>*/ {
  @override
  FormBuilderCountryPicker get widget => super.widget;
}

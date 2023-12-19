import 'package:flutter/material.dart';

import '../../base/model/department_model.dart';

class DepartmentDropDownResult extends StatefulWidget {
  const DepartmentDropDownResult({
    required this.items,
    required this.onSelect,
    super.key,
  });

  final List<DepartmentModel> items;
  final void Function(int) onSelect;

  @override
  State<StatefulWidget> createState() => DepartmentDropDownResultState();
}

class DepartmentDropDownResultState extends State<DepartmentDropDownResult> {
  late List<DropdownMenuItem<dynamic>> dropdownMenuItem;
  int? _selectedId;

  @override
  Widget build(BuildContext context) {
    dropdownMenuItem = widget.items
        .map(
          (departmentItem) => DropdownMenuItem(
            value: departmentItem.id,
            child: Center(
              child: Text(departmentItem.name),
            ),
          ),
        )
        .toList();

    return SizedBox(
      width: double.infinity,
      child: DropdownButton(
        items: dropdownMenuItem,
        isExpanded: true,
        value: _selectedId,
        hint: const Center(
          child: Text("Selecione um departamento"),
        ),
        onChanged: (selectedId) {
          setState(() {
            _selectedId = selectedId;
          });
          widget.onSelect(selectedId);
        },
      ),
    );
  }
}

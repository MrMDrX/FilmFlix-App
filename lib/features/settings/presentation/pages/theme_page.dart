import 'package:filmflix/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:filmflix/features/settings/presentation/bloc/theme_cubit.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Theme"),
          body: ListView(
            children: [
              ListTile(
                title: const Text("App Color"),
                trailing: CircleAvatar(
                  backgroundColor: state.color,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      Color selectedColor = state.color;
                      return AlertDialog(
                        title: const Text('Choose a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            hexInputBar: true,
                            enableAlpha: false,
                            pickerColor: state.color,
                            onColorChanged: (value) {
                              selectedColor = value;
                            },
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Set Color'),
                            onPressed: () {
                              context
                                  .read<ThemeCubit>()
                                  .changeColor(selectedColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              SwitchListTile(
                value: state.brightness == Brightness.dark,
                title: const Text("Dark Mode"),
                onChanged: (value) {
                  if (state.brightness == Brightness.dark) {
                    context
                        .read<ThemeCubit>()
                        .changeBrightness(Brightness.light);
                  } else {
                    context
                        .read<ThemeCubit>()
                        .changeBrightness(Brightness.dark);
                  }
                },
              ),
              SwitchListTile(
                value: state.useMaterial3,
                title: const Text("Material3"),
                onChanged: (value) {
                  context.read<ThemeCubit>().changeUseMaterial3(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

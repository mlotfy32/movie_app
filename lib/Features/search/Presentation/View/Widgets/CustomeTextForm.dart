import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Features/search/Presentation/ViewModel/search_about_cubit.dart';

class CustomeTextForm extends StatelessWidget {
  const CustomeTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          BlocProvider.of<SearchAboutCubit>(context).searchAbout(value);
        },
        style: Fontstyles.titleStyle
            .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          suffixIcon: Icon(
            FontAwesomeIcons.search,
            color: Colors.deepPurple.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(15)),
          label: Text(
            AppStrings.search,
            style: Fontstyles.titleStyle.copyWith(
                color: Colors.deepPurple.withOpacity(0.5), fontSize: 18),
          ),
        ),
      ),
    );
  }
}

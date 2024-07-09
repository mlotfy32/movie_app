import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Core/Utiles/constants.dart';
import 'package:movies_app/Features/Favorite/Presentation/ViewModel/getData/getdata_cubit.dart';
import 'package:movies_app/Features/Favorite/Presentation/favorite.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/draweranimation/draweranimation_cubit.dart';

class Customedrawer extends StatelessWidget {
  Customedrawer({super.key});
  double scale = 0.1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
      width: Constants.width * 0.8,
      height: Constants.height,
      color: ColorManager.PrimaryColor.withOpacity(0.8),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          BlocConsumer<DraweranimationCubit, DraweranimationState>(
            builder: (context, state) => AnimatedScale(
                duration: Duration(seconds: 1),
                scale: scale,
                child: Image.asset(Appassetes.LogoSplash)),
            listener: (context, state) {
              if (state is DraweranimationStart) {
                scale = 1;
              }
            },
          ),
          Expanded(child: MovieContainer())
        ],
      ),
    );
  }
}

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Constants.titleMove.length,
      itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.PrimaryColor),
          child: InkWell(
            onTap: () {
              if (index == 0)
                BlocProvider.of<GetdataCubit>(context).getFavorite();
            },
            child: ListTile(
                title: Text(
                  Constants.titleMove[index],
                  overflow: TextOverflow.clip,
                  style: Fontstyles.drawerItems,
                ),
                trailing: index == 1 ? dropDownMenu() : SizedBox()),
          )),
    );
  }
}

class dropDownMenu extends StatelessWidget {
  dropDownMenu({super.key});

  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 110,
      initialSelection: Constants.dropDownItems[0],
      requestFocusOnTap: true,
      label: Text(Constants.dropDownItems[0]),
      onSelected: (value) {
        // setState(() {
        //   selectedItem = items[0];
        // });
      },
      dropdownMenuEntries:
          Constants.dropDownItems.map<DropdownMenuEntry<String>>((value) {
        return DropdownMenuEntry<String>(
          value: Constants.dropDownItems[1],
          label: Constants.dropDownItems[0],
          enabled: false,
        );
      }).toList(),
    );
  }
}

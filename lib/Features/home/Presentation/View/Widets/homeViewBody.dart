import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/Core/Utiles/AppAssetes.dart';
import 'package:movies_app/Core/Utiles/AppStrings.dart';
import 'package:movies_app/Core/Utiles/ColorManager.dart';
import 'package:movies_app/Core/Utiles/FontStyles.dart';
import 'package:movies_app/Features/home/Presentation/VieewModel/draweranimation_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/CustomeDrawer.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/topPartHomeView.dart';

class homeViewBody extends StatelessWidget {
  homeViewBody({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Customedrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: ColorManager.titlewhite,
            iconSize: 35,
          )
        ],
        elevation: 0.5,
        leading: IconButton(
          icon: SvgPicture.asset(Appassetes.menu),
          onPressed: () {
            BlocProvider.of<DraweranimationCubit>(context).StartScale();
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Text(
          AppStrings.title,
          style: Fontstyles.title,
        ),
      ),
      body: Column(
        children: [
          Topparthomeview(),
        ],
      ),
    );
  }
}

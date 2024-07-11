import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/GetNowPlaying/nowplaying_cubit.dart';
import 'package:movies_app/Features/home/Presentation/ViewModel/draweranimation/draweranimation_cubit.dart';
import 'package:movies_app/Features/home/Presentation/View/Widets/homeViewBody.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowplayingCubit>(
          create: (context) => NowplayingCubit(),
        ),
        BlocProvider<DraweranimationCubit>(
          create: (context) => DraweranimationCubit(),
        ),
      ],
      child: homeViewBody(),
    );
  }
}

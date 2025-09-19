import 'package:calley/features/Dashboard/presentation/bloc/get_list_bloc.dart';
import 'package:calley/features/Dashboard/presentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (value) {
        if (value == 2) {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            builder: (context) => BlocBuilder<GetListBloc, GetListState>(
              builder: (context, state) {
                if(state is GetListSuccess) {
                  return CallingListBottomSheet(id: state.model.sId);
                }
                return Container();
              },
            ),
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/Icons/image 65.png"),
          label: "#",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/Icons/image 66.png"),
          label: "#",
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Image.asset("assets/Icons/image 80.png"),
          ),
          label: "#",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/Icons/image 68.png"),
          label: "#",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/Icons/image 69.png"),
          label: "#",
        ),
      ],
    );
  }
}

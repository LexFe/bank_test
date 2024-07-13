import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/crud/bloc/crud_bloc.dart';
import 'package:login/screen/curd_detail/bloc/detail_bloc.dart';

class CRUDPage extends StatelessWidget {
  const CRUDPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.DETAIL);
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        surfaceTintColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'ແກ້ໄຂຂໍ້ມູນແອັດມີນ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: buildPhoneTextFrom(
                context: context,
                labelText: 'ຊື່',
                hintText: 'ຄົ້ນຫາ',
                onChanged: (value) {
                  // context
                  //     .read<AdminBloc>()
                  //     .add(SearchAdminEvent(search: value));
                }),
          ),
          BlocBuilder<CrudBloc, CrudState>(
            builder: (context, state) {
              if (state.userModel.isEmpty) {
                return const Center(
                  child: Text('ບໍ່ພົບຂໍ້ມູນ'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(10),
                physics: const BouncingScrollPhysics(),
                itemCount: state.userModel.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: ListTile(
                        leading: const Icon(
                          Icons.account_circle_rounded,
                          color: Colors.blue,
                          size: 40,
                        ),
                        title: Text(state.userModel[index].name ?? ''),
                        subtitle: Text(state.userModel[index].phone ?? ''),
                        trailing: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 1,
                              child: Text("ແກ້ໄຂ"),
                            ),
                            const PopupMenuItem(
                              value: 2,
                              child: Text("ລົບ"),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 1) {
                            } else if (value == 2) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('ລົບຂໍ້ມູນ'),
                                    content: const Text(
                                        'ທ່ານຕ້ອງການລົບຂໍ້ມູນນີ້ບໍ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('ຍົກເລີກ'),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('ຢືນຢັນ'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black87,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildPhoneTextFrom({
    required BuildContext context,
    required String hintText,
    required String labelText,
    required Function(String) onChanged,
  }) {
    return SizedBox(
      height: 60,
      child: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          return TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 1,
            cursorColor: Colors.grey,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: MaterialStateColor.resolveWith(
                (states) => states.contains(MaterialState.focused)
                    ? Colors.blue
                    : Colors.grey,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

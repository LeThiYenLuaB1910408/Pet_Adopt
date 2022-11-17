import 'package:flutter/material.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/pages/user/user_edit_screen.dart';
import 'package:provider/provider.dart';

class UserManagerScreen extends StatelessWidget {
  const UserManagerScreen({super.key});

  Future<void> _refreshPets(BuildContext context) async {
    await context.read<PetsManager>().fetchPets(true);
  }

  @override
  Widget build(BuildContext context) {
    final petsManager = PetsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Pets'),
        actions: <Widget>[
          buildAddButton(context),
        ],
      ),
      body: FutureBuilder(
        future: _refreshPets(context),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            child: buildUserPetListView(petsManager),
            onRefresh: () => _refreshPets(context),
          );
        },
      ),
    );
  }

  Widget buildUserPetListView(PetsManager petsManager) {
    return Consumer<PetsManager>(
      builder: (context, petsManager, child) {
        return ListView.builder(
          itemCount: petsManager.pets.length,
          itemBuilder: (ctx, i) => Column(
            children: [
              ListTile(
                title: Text(petsManager.pets[i].name),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(petsManager.pets[i].image),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.mode_edit_outline_outlined,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UserEditScreen(petsManager.pets[i])),
                        );
                        // Navigator.of(context).pushNamed(
                        //     EditPetScreen.routeName,
                        //     arguments: petsManager.pets[i].product.id);
                      },
                      color: Theme.of(context).primaryColor,
                    ),
                    IconButton(
                      icon: const Icon(Icons.highlight_remove_sharp),
                      onPressed: () {
                        context
                            .read<PetsManager>()
                            .deletePet(petsManager.pets[i].id!);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Pet deleted',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                      },
                      color: Theme.of(context).errorColor,
                    ),
                  ]),
                ),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserEditScreen(null)),
        );
      },
      icon: const Icon(Icons.add),
    );
  }
}

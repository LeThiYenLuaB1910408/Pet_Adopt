import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/models/pets_model.dart';
import 'package:pet_adopt/pages/detail/detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['Cats', 'Dogs', 'Hamsters', 'Fishs'];
  String category = 'Cats';
  List<Pet>? categoryShow;
  var petsManager = PetsManager();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Location',
                            style: poppins.copyWith(
                                fontSize: 14, color: black.withOpacity(0.6)),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: blue,
                            size: 18,
                          )
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: 'Pekanbaru, ',
                                style: poppins.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: black)),
                            TextSpan(
                                text: 'Riau',
                                style: poppins.copyWith(
                                    fontSize: 24, color: black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.search),
                const SizedBox(width: 10),
                Stack(
                  children: [
                    const Icon(Icons.notifications_outlined),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: blue.withOpacity(0.6),
                child: Stack(children: [
                  Positioned(
                    bottom: -35,
                    right: -30,
                    width: 150,
                    height: 150,
                    child: Transform.rotate(
                      angle: 12,
                      child: SvgPicture.asset(
                        'assets/Paw_Print.svg',
                        color: blue,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -35,
                    left: -35,
                    width: 150,
                    height: 150,
                    child: Transform.rotate(
                      angle: -12,
                      child: SvgPicture.asset(
                        'assets/Paw_Print.svg',
                        color: blue,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: 120,
                    width: 150,
                    height: 150,
                    child: Transform.rotate(
                      angle: -16,
                      child: SvgPicture.asset(
                        'assets/Paw_Print.svg',
                        color: blue,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 20,
                      height: 135,
                      child: Image.asset('assets/cats/cat1.png')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join Our Animal\nLovers Community',
                          style: poppins.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: orange),
                          child: Text(
                            'Join Us',
                            style: poppins.copyWith(color: white, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Categories',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(fontSize: 12, color: orange),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: orange),
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 14,
                          color: white,
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(width: 20),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: const BoxDecoration(color: white),
                  child: const Icon(
                    Icons.tune_rounded,
                  )),
              ...List.generate(
                categories.length,
                (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 20, right: 20)
                      : const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        category = categories[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: categories[index] == category ? blue : white,
                            boxShadow: [
                              categories[index] == category
                                  ? const BoxShadow(
                                      offset: Offset(0, 5),
                                      color: blue,
                                      spreadRadius: 0,
                                      blurRadius: 5)
                                  : const BoxShadow(color: white),
                            ]),
                        child: Text(
                          categories[index],
                          style: poppins.copyWith(
                              color:
                                  categories[index] == category ? white : black,
                              fontSize: 14),
                        )),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Adopt Pet',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(fontSize: 12, color: orange),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: orange),
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 14,
                          color: white,
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                petsManager.getListPet(category).length,
                // category == "Cats"
                //     ? cats.length
                //     : category == "Dogs"
                //         ? dogs.length
                //         : hamsters.length,
                (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        )
                      : const EdgeInsets.only(
                          right: 20,
                        ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                    pet: petsManager
                                        .getListPet(category)[index])));
                        // DetailPage(
                        //     pet: category == "Cats"
                        //         ? cats[index]
                        //         : category == "Dogs"
                        //             ? dogs[index]
                        //             : hamsters[index])));
                      },
                      child: PetItem(
                          pet: petsManager.getListPet(category)[index])),
                  // child: PetItem(
                  //     pet: category == "Cats"
                  //         ? cats[index]
                  //         : category == "Dogs"
                  //             ? dogs[index]
                  //             : hamsters[index])),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PetItem extends StatelessWidget {
  final Pet pet;
  const PetItem({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.6,
        color: pet.color.withOpacity(0.6),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              height: 100,
              width: 100,
              child: Transform.rotate(
                  angle: 12,
                  child: SvgPicture.asset(
                    'assets/Paw_Print.svg',
                    color: pet.color,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              top: 100,
              left: -25,
              height: 100,
              width: 100,
              child: Transform.rotate(
                  angle: -11.5,
                  child: SvgPicture.asset(
                    'assets/Paw_Print.svg',
                    color: pet.color,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 20,
              child: Image.asset(
                pet.image,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pet.name,
                          style: poppins.copyWith(
                              fontSize: 16,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: blue,
                              size: 16,
                            ),
                            Text(
                              'Distance (${pet.distance} Km)',
                              style: poppins.copyWith(
                                fontSize: 12,
                                color: black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: white),
                    child: Icon(
                      pet.fav
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: pet.fav ? red : black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/pets_models.dart';
import 'package:pet_adopt/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['Cats', 'Dogs', 'Hamsters'];
  String category = 'Cats';
  List<Pet> pets = cats;
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline,
    Icons.chat_outlined,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                  fontSize: 14,
                                  color: black.withOpacity(.6),
                                ),
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
                                  text: 'Can Tho, ',
                                  style: poppins.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: black),
                                ),
                                TextSpan(
                                  text: 'Ninh Kieu',
                                  style: poppins.copyWith(
                                      fontSize: 24, color: black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.search),
                    const SizedBox(
                      width: 5,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          right: 5,
                          top: 5,
                          child: Container(
                            height: 7,
                            width: 7,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: red,
                            ),
                          ),
                        ),
                        const Icon(Icons.notifications_outlined),
                      ],
                    ),
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
                    color: blue.withOpacity(.6),
                    child: Stack(
                      children: [
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
                          left: -30,
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
                          right: 100,
                          width: 150,
                          height: 150,
                          child: Transform.rotate(
                            angle: -60,
                            child: SvgPicture.asset(
                              'assets/Paw_Print.svg',
                              color: blue,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          height: 135,
                          child: Image.asset('assets/cats/cat2.png'),
                        ),
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
                                  color: white,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: orange),
                                child: Text(
                                  'Join Us',
                                  style: poppins.copyWith(
                                      color: white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: poppins.copyWith(
                            color: orange,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: orange),
                          child: const Icon(Icons.keyboard_arrow_right_rounded,
                              size: 14, color: white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: const BoxDecoration(color: white),
                        child: const Icon(Icons.tune_rounded)),
                    ...List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.symmetric(horizontal: 20)
                            : const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              category = categories[index];
                              if (categories[index] == 'Cats') {
                                pets = cats;
                              } else if (categories[index] == 'Dogs') {
                                pets = dogs;
                              } else if (categories[index] == 'Hamsters') {
                                pets = hamsters;
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  categories[index] == category ? blue : white,
                              boxShadow: [
                                categories[index] == category
                                    ? const BoxShadow(
                                        offset: Offset(0, 5),
                                        color: blue,
                                        spreadRadius: 0,
                                        blurRadius: 10)
                                    : const BoxShadow(color: white)
                              ],
                            ),
                            child: Text(
                              categories[index],
                              style: poppins.copyWith(
                                  color: categories[index] == category
                                      ? white
                                      : black,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Adopt Pet',
                      style: poppins.copyWith(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: poppins.copyWith(
                            color: orange,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: orange),
                          child: const Icon(Icons.keyboard_arrow_right_rounded,
                              size: 14, color: white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    cats.length,
                    (index) => Padding(
                      padding: index == 0
                          ? const EdgeInsets.symmetric(horizontal: 20)
                          : const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(pet: pets[index]),
                              ),
                            );
                          },
                          child: PetItem(pet: pets[index])),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            height: 50,
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  icons.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPage = index;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 50,
                          padding: const EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 60,
                                width: 50,
                                child: Column(
                                  children: [
                                    Icon(
                                      icons[index],
                                      color: selectedPage == index
                                          ? blue
                                          : black.withOpacity(.6),
                                    ),
                                    const SizedBox(height: 5),
                                    selectedPage == index
                                        ? Container(
                                            height: 5,
                                            width: 5,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: blue),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              index == 2
                                  ? Positioned(
                                      right: 0,
                                      top: -5,
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: blue,
                                        ),
                                        child: Text(
                                          '6',
                                          style: poppins.copyWith(color: white),
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      )),
            )),
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
        height: MediaQuery.of(context).size.height * .35,
        width: MediaQuery.of(context).size.width * .6,
        color: pet.color.withOpacity(.6),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              width: 100,
              height: 100,
              child: Transform.rotate(
                angle: 12,
                child: SvgPicture.asset(
                  'assets/Paw_Print.svg',
                  color: pet.color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: -25,
              width: 100,
              height: 100,
              child: Transform.rotate(
                angle: -11.5,
                child: SvgPicture.asset(
                  'assets/Paw_Print.svg',
                  color: pet.color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -10,
              right: 20,
              child: Image.asset(
                pet.image,
                height: MediaQuery.of(context).size.height * .25,
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
                              fontSize: 24,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: blue,
                              size: 14,
                            ),
                            Text(
                              'Distance (${pet.distance} km)',
                              style: poppins.copyWith(
                                  fontSize: 12, color: black.withOpacity(.5)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: white),
                    child: Icon(
                      pet.fav
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: pet.fav ? red : black.withOpacity(.6),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

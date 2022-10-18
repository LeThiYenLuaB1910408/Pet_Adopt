import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adopt/const.dart';
import 'package:pet_adopt/models/managers/pets_manager.dart';
import 'package:pet_adopt/models/pets_model.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var petsManager = PetsManager();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            title: Text(
              "View All",
              style: poppins.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: petsManager.pets.length,
            itemBuilder: (ctx, i) => PetGridTile(context, petsManager.pets[i]),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          )),
    );
  }

  Widget PetGridTile(BuildContext context, Pet pet) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
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
                height: MediaQuery.of(context).size.height * .15,
              ),
            ),
            Container(
              color: pet.color.withOpacity(.4),
              height: MediaQuery.of(context).size.height * .1,
              padding: const EdgeInsets.all(10),
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
                              fontSize: 18,
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
                                  fontSize: 12, color: black.withOpacity(.6)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: white),
                    child: Icon(
                      size: 18,
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

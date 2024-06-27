import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/app/model/character.dart';
import 'package:rick_and_morty/app/ui/detail_screen.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    // Clickable Widget
    return GestureDetector(
      onTap: () {
        print(character.name);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(id: character.id, character: character,),
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.lightGreen)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            Container(
              alignment: Alignment.centerLeft,
              width: double.maxFinite,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: CachedNetworkImage(
                imageUrl: character.image,
                placeholder: (context, url) => Container(
                  color: Colors.grey,
                  height: 100,
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.red,
                ),
              ),
            ),
            // Space
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name & Status
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Text(
                            character.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(
                        width: 4,
                      ),
                      Tooltip(
                        message: character.status,
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: character.status.toLowerCase() == "alive"
                              ? Colors.green
                              : character.status.toLowerCase() == "unknown"
                                  ? Colors.grey
                                  : Colors.red,
                        ),
                      )
                    ],
                  ),
                  // Space
                  const SizedBox(
                    height: 8,
                  ),
                  // Gender & Species
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndLabel(
                            label: character.species,
                            icon: Icons.psychology_outlined),
                        IconAndLabel(
                            label: character.gender,
                            icon: Icons.transgender_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (character.type.isNotEmpty)
                    IconAndLabel(
                      label: character.type,
                      icon: Icons.coronavirus_outlined,
                      flexible: true,
                    ),
                  if (character.location.isNotEmpty)
                    IconAndLabel(
                      label: character.location,
                      icon: Icons.pin_drop_outlined,
                      flexible: true,
                    ),
                  const SizedBox(
                    height: 12,
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

class IconAndLabel extends StatelessWidget {
  const IconAndLabel(
      {super.key,
      required this.label,
      required this.icon,
      this.flexible = false});
  final String label;
  final IconData icon;
  final bool flexible;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(
        icon,
        size: 16,
      ),
      const SizedBox(
        width: 6,
      ),
      flexible
          ? Flexible(
              flex: 1,
              child: Text(
                label,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : Text(
              label,
              // maxLines: 2,overflow: TextOverflow.ellipsis,
            ),
    ]);
  }
}
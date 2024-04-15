import 'package:flutter/material.dart';

class ItemBookingStatus extends StatelessWidget {
  final String title;

  const ItemBookingStatus({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // Here just handle all the Booking status to place the appropriate icon

                    // Note :  you can handel more two condition (condition 1)? : (condition 2) ? :
                    child: Center(
                      child: Icon(
                        title == "Review"
                            ? Icons.more_horiz_rounded
                            : Icons.circle,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Row(
                children: [
                  title != "Complete"
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: SizedBox(
                            height: 170,
                            width: 1,
                            child: VerticalDivider(),
                          ),
                        )
                      : const SizedBox.shrink(),
                  title == "Review"
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Container(
                            width: size.width * 0.8,
                            height: 140,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

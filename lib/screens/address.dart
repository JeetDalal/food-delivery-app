import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/location_service.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<LocationServices>(context);
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/location.png',
                ),
              ],
            ),
          ),
          Text(
            'Find Nearby Restaurants',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '\nEnter your location or allow access to your\n location to find restaurants near you.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextButton(
              onPressed: () async {
                context.read<LocationServices>().getCurrentUserLocation();
                if (_provider.address.isNotEmpty) {
                  Navigator.of(context).pushReplacementNamed('/home-screen');
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Use Current Location',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextButton(
              onPressed: () {},
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_history,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Text(
                          'Enter a new address',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                  // fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

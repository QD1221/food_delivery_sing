import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_sing/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_sing/models/delivery_time_model.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => DeliveryTimeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Time'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(),
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                child: Text('Select'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a Date',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery is Today!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text('Today'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Delivery is Tomorrow!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Text('Tomorrow'),
                  ),
                ],
              ),
            ),
            Text(
              'Choose the Date',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 2.5),
                    itemCount: DeliveryTime.deliveryTimes.length,
                    itemBuilder: (context, index) {
                      return BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          return Card(
                            child: TextButton(
                              onPressed: () {
                                context.read<BasketBloc>().add(
                                    SelectDeliveryTime(
                                        DeliveryTime.deliveryTimes[index]));
                              },
                              child: Text(
                                '${DeliveryTime.deliveryTimes[index].value}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:app/home/base/model/market_list_model.dart';
import 'package:app/home/list/widget/market_list_view/market_list_view_widget.dart';
import 'package:app/route/route_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../create/market_list_home_create_bloc.dart';
import '../widget/list_card/list_card.widget.dart';

class MarketListHome extends StatelessWidget {
  MarketListHome({
    routeList,
    createBloc,
    super.key,
  })  : _routeList = routeList ?? getIt.get(),
        _createBloc = createBloc ?? getIt.get();

  final RouteList _routeList;
  final MarketListHomeCreateBloc _createBloc;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketListHomeCreateBloc>(
      create: (_) => _createBloc,
      child: BlocBuilder<MarketListHomeCreateBloc, MarketListHomeCreateState>(
        builder: (ctx, state) {
          switch (state.runtimeType) {
            case Loading:
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            default:
              {
                return Scaffold(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MarketListViewWidget(),
                      ),
                    ],
                  ),
                  floatingActionButton: FloatingActionButton.extended(
                    label: Text("Nova lista"),
                    icon: Icon(
                      Icons.add,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(
                            "Nova lista",
                          ),
                          content: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Qual o nome da sua lista? :)"),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text(
                                "Cancelar",
                                textAlign: TextAlign.center,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _createBloc.add(
                                  CreateMarketList(
                                    name: controller.text,
                                  ),
                                );
                                context.pop();
                              },
                              child: Text(
                                "Confirmar",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

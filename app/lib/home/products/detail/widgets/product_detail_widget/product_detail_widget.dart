import 'package:app/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:high_chart/high_chart.dart';

import '../../../../../route/route_list.dart';
import '../../data/product_detail_model.dart';

class ProductDetailWidget extends StatelessWidget {
  ProductDetailWidget({
    required this.productDetail,
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get<RouteList>();

  final ProductDetail productDetail;
  final RouteList _routeList;

  @override
  Widget build(BuildContext context) {
    final String chartData = '''{
      'title': {
          'text': null
      },    
      'series': [
        {
          'type': 'line',
          'data': ${productDetail.historicPrice.map((price) => price.value).toList()}
        }
      ]
    }''';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      productDetail.info.imageUrl,
                    ),
                  ),
                ),
                Center(
                  child: Text(productDetail.info.name),
                ),
                const Text("Historico de preço"),
                Center(
                  child: HighCharts(
                    loader: const SizedBox(
                      child: LinearProgressIndicator(),
                      width: 200,
                    ),
                    size: const Size(double.infinity, 400),
                    data: chartData,
                    scripts: const [
                      "https://code.highcharts.com/highcharts.js",
                      'https://code.highcharts.com/modules/networkgraph.js',
                      'https://code.highcharts.com/modules/exporting.js',
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: const ButtonStyle(),
            onPressed: () {
              context
                  .go("/market_list/add?productSku=${productDetail.info.id}");
            },
            child: const Text("Adicionar"),
          ),
        )
      ],
    );
  }
}

import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';

import 'package:flutter/material.dart';

class SimpleTableElement extends StatelessWidget {
  /// A Map of Column headings, with the key being the data in the column, and the value being its width ratio(flex).
  final List<TableValueElement> datas;
  final Color color;
  final VoidCallback? onTap;
  const SimpleTableElement({
    Key? key,
    required this.datas,
    required this.onTap,
    this.color = CustomColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            for (TableValueElement tbv in datas)
              Expanded(
                flex: tbv.flex,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Container(
                      child: Text(
                    tbv.valueName,
                    style: TextStyle(
                        color: tbv.color, fontWeight: FontWeight.bold),
                    textAlign: tbv.textAlign,
                    maxLines: tbv.maxLines,
                  )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SimpleTable extends StatelessWidget {
  ///Table headers as implemented using the same [TableElement] class itself.
  final List<TableElement> headings;

  /// A list of [SimpleTableElement]s
  final List<SimpleTableElement> elements;

  const SimpleTable({
    Key? key,
    required this.headings,
    required this.elements,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                for (TableElement h in headings)
                  Expanded(
                    flex: h.flex,
                    child: Container(
                        child: Text(
                      h.valueName,
                      style: TextStyle(
                          color: h.color, fontWeight: FontWeight.bold),
                      textAlign: h.textAlign,
                      maxLines: h.maxLines,
                      overflow: TextOverflow.ellipsis,
                    )),
                  ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 3,
          color: Color(0xddB4BBC5),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: ListView.builder(
              itemBuilder: (context, index) {
                for (int i = 0; i < elements[index].datas.length; i++)
                  if (!elements[index].datas[i].useCustomflex) {
                    elements[index].datas[i].flex = headings[i].flex;
                  }
                return elements[index];
              },
              itemCount: elements.length,
            ),
          ),
        )
      ],
    );
  }
}

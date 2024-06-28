import 'package:application/model/history_transaction.dart';
import 'package:application/presentation/wallet_page/widgets/text_row.dart';
import 'package:application/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class TransactionRecord extends StatelessWidget {
  final HistoryTransaction historyTransaction;
  const TransactionRecord({Key? key, required this.historyTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: ColorSchemes.lightCodeColorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          TextRow(text1: "ID", text2: historyTransaction.id),
          SizedBox(height: 10),
          TextRow(text1: "Address", text2: historyTransaction.address),
          SizedBox(height: 10),
          TextRow(text1: "Token ID", text2: historyTransaction.tokenID),
          SizedBox(height: 10),
          TextRow(text1: "Seller Name", text2: historyTransaction.sellerName),
        ],
      ),
    );
  }
}

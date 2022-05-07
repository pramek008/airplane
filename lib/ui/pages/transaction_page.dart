import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/ui/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TransactionSuccess) {
              if (state.transactions.isEmpty) {
                return const Center(
                  child: Text('Anda Belom Melakukan Transaksi'),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 60,
                  ),
                  itemCount: state.transactions.length,
                  itemBuilder: (context, index) {
                    return TransactionCardWidget(
                      state.transactions[index],
                    );
                  },
                  scrollDirection: Axis.vertical,
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

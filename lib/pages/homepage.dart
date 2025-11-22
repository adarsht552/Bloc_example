import 'package:bloctest/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),

      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, counter) {
            return Text("Counter $counter");
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              context.read<CounterBloc>().add(IncrementBotton());
            },
          ),
          FloatingActionButton(
            child: Text("-"),
            onPressed: () {
              context.read<CounterBloc>().add(DecrementBottom());
            },
          ),
        ],
      ),
    );
  }
}

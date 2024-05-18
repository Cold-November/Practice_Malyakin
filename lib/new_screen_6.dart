import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_bloc.dart';
import 'main.dart';  // Добавлено для доступа к AppState

class NewScreen6 extends StatelessWidget {
  const NewScreen6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Screen 6'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counter: ${state.counter}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          context.read<CounterBloc>().add(Decrement());
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          context.read<CounterBloc>().add(Increment());
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final appState = getIt<AppState>();  // Обновлено
                      appState.data = 'Counter Value: ${state.counter}';
                      Navigator.pop(context);
                    },
                    child: const Text('Save and Go Back'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

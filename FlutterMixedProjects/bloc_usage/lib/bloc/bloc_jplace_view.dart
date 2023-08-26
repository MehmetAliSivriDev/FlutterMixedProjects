import 'package:bloc_usage/bloc/jplace_cubit.dart';
import 'package:bloc_usage/bloc/jplace_repository.dart';
import 'package:bloc_usage/bloc/jplace_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocJplaceView extends StatelessWidget {
  const BlocJplaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => JplaceCubit(SampleJplaceRepository()),
        child: _buildScaffold());
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      floatingActionButton: _customFab(),
      appBar: AppBar(
        title: const Text("Bloc Usage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<JplaceCubit, JplaceState>(
          builder: (context, state) {
            if (state is JplaceInitial) {
              return _buildJplaceInitial();
            } else if (state is JplaceLoading) {
              return _buildJplaceLoading();
            } else if (state is JplaceCompleted) {
              return _buildJplaceCompleted(state);
            } else {
              final error = state as JplaceError;
              return Text(error.message);
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  ListView _buildJplaceCompleted(JplaceCompleted state) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: state.response.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 20,
          child: ListTile(
            leading: Text(state.response[index].id.toString()),
            title: Text(state.response[index].title ?? ""),
            subtitle: Text(state.response[index].body ?? ""),
          ),
        );
      },
    );
  }

  Center _buildJplaceLoading() =>
      const Center(child: CircularProgressIndicator());

  Center _buildJplaceInitial() => const Center(child: Text("Welcome to App"));

  BlocBuilder<JplaceCubit, JplaceState> _customFab() {
    return BlocBuilder<JplaceCubit, JplaceState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            context.read<JplaceCubit>().fetchData();
          },
          child: const Icon(Icons.get_app_sharp),
        );
      },
    );
  }
}

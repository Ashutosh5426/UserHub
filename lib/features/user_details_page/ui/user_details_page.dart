import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_hub/core/app_constants/app_strings.dart';
import 'package:user_hub/core/common_widgets/common_error_widget.dart';
import 'package:user_hub/core/common_widgets/horizontal_bar.dart';
import 'package:user_hub/features/user_details_page/bloc/user_details_page_bloc.dart';
import 'package:user_hub/features/user_details_page/bloc/user_details_page_events.dart';
import 'package:user_hub/features/user_details_page/bloc/user_details_page_states.dart';
import 'package:user_hub/features/user_details_page/ui/widgets/custom_key_value_tile.dart';

class UserDetailsPage extends StatefulWidget {
  final int userId;
  const UserDetailsPage({required this.userId, Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late UsersDetailsPageBloc _bloc;

  @override
  void initState() {
    _bloc = UsersDetailsPageBloc();
    _bloc.add(UserDetailsPageEvents.getUserDetails(userId: widget.userId));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.userDetails),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.keyboard_arrow_left, size: 32,),
        ),
      ),
      body: BlocBuilder<UsersDetailsPageBloc, UserDetailsPageStates>(
          bloc: _bloc,
          builder: (context, state) {
            if(state is LoadingState){
              return const Center(child: CircularProgressIndicator());
            } else if(state is SuccessState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(width: double.maxFinite, height: 30),
                      ClipOval(child: Image.network(state.userDetailsModel.data.avatar, width: 120, height: 120,)),
                      const SizedBox(height: 24),
                      Text(
                        '${state.userDetailsModel.data.firstName} ${state.userDetailsModel.data.lastName}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.userDetailsModel.data.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const HorizontalBar(width: double.maxFinite, color: Color(0xFFFB0101)),
                      const SizedBox(height: 24),
                      CustomKeyValueTile(keyName: AppStrings.userId, value: state.userDetailsModel.data.id.toString(),),
                      const SizedBox(height: 12),
                      CustomKeyValueTile(keyName: AppStrings.firstName, value: state.userDetailsModel.data.firstName,),
                      const SizedBox(height: 12),
                      CustomKeyValueTile(keyName: AppStrings.lastName, value: state.userDetailsModel.data.lastName,),
                      const SizedBox(height: 24),
                      const Row(
                        children: [
                          Text(
                            AppStrings.bio,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                          AppStrings.bioData,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          height: 1.3,
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else if(state is ErrorState){
              return Padding(
                padding: const EdgeInsets.all(24),
                child: CommonErrorWidget(
                  onRetry: (){
                    _bloc.add(UserDetailsPageEvents.getUserDetails(userId: widget.userId));
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }
      ),
    );
  }
}

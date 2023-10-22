import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:user_hub/core/app_constants/app_strings.dart';
import 'package:user_hub/core/common_widgets/common_error_widget.dart';
import 'package:user_hub/core/shared_preference/shared_preference.dart';
import 'package:user_hub/features/user_list_page/bloc/users_list_page_bloc.dart';
import 'package:user_hub/features/user_list_page/bloc/users_list_page_events.dart';
import 'package:user_hub/features/user_list_page/bloc/users_list_page_states.dart';
import 'package:user_hub/features/user_list_page/data/model/users_list_model.dart';
import 'package:user_hub/features/user_list_page/ui/widgets/users_list_tile.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  late UsersListPageBloc _bloc;
  late PagingController<int, UserModel> _pagingController;
  int _pageKey = 1;

  @override
  void initState() {
    _bloc = UsersListPageBloc();
    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener((_) {
      _bloc.add(UsersListPageEvents.getUsersList(page: _pageKey++));
    });
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          SharedPreference().getString(key: AppStrings.emailKeyName)??'',
        ),
      ),
      body: BlocListener<UsersListPageBloc, UsersListPageStates>(
        bloc: _bloc,
        listener: (context, state){
          if(state is SuccessState){
            _pagingController.appendPage(state.usersListModel.data, state.usersListModel.data.isNotEmpty ? _pageKey : null);
          }
        },
        child: PagedListView.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<UserModel>(
            itemBuilder: (context, item, index) {
              return UsersListTile(userModel: item);
            },
            newPageErrorIndicatorBuilder: (context) {
              return CommonErrorWidget(
                onRetry: () => _pagingController.refresh(),
              );
            },
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }
}

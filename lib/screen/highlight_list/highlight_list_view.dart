import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
import 'package:highlight_flutter/domain/model/highlight_model.dart';
import 'package:highlight_flutter/screen/highlight_list/state/highlight_list_provider.dart';
import 'package:highlight_flutter/screen/highlight_list/state/list_load_provider.dart';
import 'package:intl/intl.dart';

class HighlightListView extends ConsumerStatefulWidget {
  const HighlightListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HighlightListViewState();
}

class _HighlightListViewState extends ConsumerState<HighlightListView> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    initLoad();
    scrollController.addListener(_onScroll);
    super.initState();
  }

  void initLoad() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ref.watch(listLoadProvider.notifier).listLoad());
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    if (isNearEndOfScroll(scrollController.position)) loadNextPage();
  }

  void loadNextPage() {
    ref.watch(listLoadProvider.notifier).listLoad();
  }

  bool isNearEndOfScroll(ScrollPosition position) {
    return position.maxScrollExtent - 200 <= position.pixels;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(listLoadProvider);
    final highlightList = ref.watch(highlightListProvider);
    return RefreshIndicator(
      onRefresh: ref.watch(listLoadProvider.notifier).initLoad,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        itemBuilder: (context, index) {
          return HighlightListItem(
            highlight: highlightList[index],
          );
        },
        itemCount: highlightList.length,
      ),
    );
  }
}

class HighlightListItem extends StatelessWidget {
  const HighlightListItem({required this.highlight, super.key});

  final HighlightModel highlight;

  String get monthDayString => DateFormat('M.d.').format(highlight.date);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          DetailRouteDate(hid: highlight.id).push(context);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              // 작성한 날짜
              SizedBox(width: 36, child: Text(monthDayString)),
              const SizedBox(width: 8),

              // 하이라이트 제목
              Expanded(
                  flex: 4,
                  child: Text(
                    highlight.title,
                    overflow: TextOverflow.ellipsis,
                  )),
              const SizedBox(width: 8),

              // 하이라이트 내용
              Expanded(
                  flex: 6,
                  child: Text(
                    highlight.content,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight_flutter/app/router/app_router.dart';
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
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        final highlight = highlightList[index];

        return HighlightListItem(
          highlightTitle: highlight.title,
          highlightDate: highlight.date,
          highlightContent: highlight.content,
        );
      },
      itemCount: highlightList.length,
    );
  }
}

class HighlightListItem extends StatelessWidget {
  const HighlightListItem(
      {required this.highlightTitle,
      required this.highlightDate,
      required this.highlightContent,
      super.key});

  final String highlightTitle;
  final DateTime highlightDate;
  final String highlightContent;

  String get monthDayString => DateFormat('M.d.').format(highlightDate);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          const DetailRouteDate().push(context);
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
                    highlightTitle,
                    overflow: TextOverflow.ellipsis,
                  )),
              const SizedBox(width: 8),

              // 하이라이트 내용
              Expanded(
                  flex: 6,
                  child: Text(
                    highlightContent,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

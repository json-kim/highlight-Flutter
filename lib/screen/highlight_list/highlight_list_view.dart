import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HighlightListView extends StatelessWidget {
  const HighlightListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return HighlightListItem(
          highlightTitle: '홍콩 여행',
          highlightDate: DateTime(2024, 5, 3),
          highlightContent: '란퐁유엔 토스트 사랑해',
        );
      },
      itemCount: 5,
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
        onTap: () {},
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

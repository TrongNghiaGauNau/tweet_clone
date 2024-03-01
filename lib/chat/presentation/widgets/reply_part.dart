import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:twitter_clone_2/attachments/presentation/list_files_view.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
import 'package:twitter_clone_2/chat/shared/providers.dart';
import 'package:twitter_clone_2/core/presentation/extension/context_extesion.dart';

class ReplyPart extends ConsumerWidget {
  const ReplyPart({
    super.key,
    required this.message,
    this.isMine = true,
  });

  final Message message;
  final bool isMine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref.read(onQuotedMessageProvider.notifier).state = message,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.screenWidth * (2 / 3),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              topRight: const Radius.circular(30),
              bottomLeft:
                  isMine ? const Radius.circular(30) : const Radius.circular(0),
              bottomRight:
                  isMine ? const Radius.circular(0) : const Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.imagesIdList.isNotEmpty)
                Wrap(
                    runSpacing: 5,
                    spacing: 5,
                    children: message.imagesIdList
                        .mapWithIndex((imageLink, index) => GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListFilesView(
                                    initialIndex: index,
                                    imagesList: message.imagesIdList,
                                    createAt: message.sentAt),
                              )),
                              child: Container(
                                height: 50,
                                width: 50,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Image.network(
                                  imageLink,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: const SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Card(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ))
                        .toList()),
              if (message.imagesIdList.isNotEmpty) const SizedBox(height: 5),
              if (message.message.isNotEmpty)
                Text(
                  message.message,
                  style: const TextStyle(color: Colors.white),
                ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

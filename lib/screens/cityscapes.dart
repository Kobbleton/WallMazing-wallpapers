import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'fullscreen_image.dart';

class CityscapesScreen extends StatefulWidget {
  const CityscapesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CityscapesScreenState createState() => _CityscapesScreenState();
}

class _CityscapesScreenState extends State<CityscapesScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _imageUrls = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadImages();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cityscapes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StreamBuilder<List<String>>(
        initialData: _imageUrls,
        stream: Stream.periodic(Duration.zero).asyncMap((_) => _imageUrls),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SizedBox(
                    width: 50, height: 50, child: CircularProgressIndicator()));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return GridView.builder(
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 19.5,
              ),
              itemCount: snapshot.data!.length + (_isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < snapshot.data!.length) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FullScreenImageScreen(
                          imageUrl: snapshot.data![index],
                        ),
                      ));
                    },
                    child: AspectRatio(
                      aspectRatio: 9 / 19.5,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _loadImages({int limit = 20}) async {
    setState(() {
      _isLoading = true;
    });

    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref('cityscapes');
    ListResult result = await ref.list(ListOptions(
        maxResults: limit,
        pageToken: _imageUrls.isNotEmpty ? _imageUrls.last : null));

    for (var item in result.items) {
      String downloadUrl = await item.getDownloadURL();
      _imageUrls.add(downloadUrl);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadImages();
    }
  }
}

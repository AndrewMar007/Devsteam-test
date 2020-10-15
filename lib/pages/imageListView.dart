import 'package:flutter/material.dart';
import 'package:project_devsteammobi/bloc/imageListBloc.dart';
import 'package:project_devsteammobi/component/cardList.dart';
import 'package:project_devsteammobi/models/listResponseModel.dart';

class ImageListView extends StatefulWidget {
  @override
  _ImageListViewState createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  ImageListBloc bloc = ImageListBloc();

  @override
  void initState() {
    bloc.fetchImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {})
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Images List',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Container(
          child: StreamBuilder<ImageListResponse>(
              stream: bloc.images,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data.cards != null) {
                  if (snapshot.data.cards.isEmpty) {
                    return _buildError("List is empty");
                  } else {
                    return _initializeCardList(snapshot.data);
                  }
                } else if (snapshot.hasData && snapshot.data.error != null) {
                  return _buildError(snapshot.data.error);
                } else if (snapshot.hasError) {
                  return _buildError(snapshot.error);
                } else {
                  return _buildLoadingIndicator();
                }
              })),
    );
  }

  _initializeCardList(ImageListResponse response) {
    return ListView.builder(
      itemCount: response.cards.length,
      itemBuilder: (context, index) {
        return CardList(
          cardModel: response.cards[index],
        );
      },
    );
  }

  _buildLoadingIndicator() {
    return Center(
      child: Container(
        width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(),
      ),
    );
  }

  _buildError(String error) {
    return Center(child: Text(error));
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}

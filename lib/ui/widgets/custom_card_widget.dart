import 'package:bookia_store/cubit/book_cubit/books_cubit.dart';
import 'package:bookia_store/model/books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/cubit_book/cubit_wishlist/cubit/wishlist_cubit.dart';
import '../screens/details_screen.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state is BooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BooksSuccess) {
          List<BooksModel> books = state.books;
          return GridView.builder(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return BookCard(book: books[index]);
            },
          );
        } else if (state is BooksError) {
          return Center(
            child: Text(
              state.error.toString(),
            ),
          );
        } else {
          return const Center(child: Text('No Data Available'));
        }
      },
    );
  }
}

class BookCard extends StatefulWidget {
  final BooksModel book;

  const BookCard({super.key, required this.book});

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(book: widget.book),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.book.image),
                ),
              ),
              child: Center(
                child: Image.network(
                  widget.book.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book.title,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.book.price,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          if (isFavorite) {
                            context
                                .read<WishlistCubit>()
                                .addToWishlist(widget.book);
                          } else {
                            context
                                .read<WishlistCubit>()
                                .removeFromWishlist(widget.book);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

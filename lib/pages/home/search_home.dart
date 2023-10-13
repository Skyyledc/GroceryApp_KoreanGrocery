import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchContainerHome extends StatefulWidget {
  const SearchContainerHome({super.key});

  @override
  State<SearchContainerHome> createState() => _SearchContainerHomeState();
}

class _SearchContainerHomeState extends State<SearchContainerHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/searchscreen');
      },
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 325,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                "What are you craving?",
                                textStyle: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              TyperAnimatedText(
                                "Oh I think I want some Ramen!",
                                textStyle: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              TyperAnimatedText(
                                "I could really eat some Sampgyupsal!",
                                textStyle: GoogleFonts.poppins(
                                    color: Colors.grey[400],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            repeatForever: true,
                            pause: const Duration(milliseconds: 3000),
                          ),
                        ),
                      ],
                    ),
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

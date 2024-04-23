// Card(
//                       elevation: 0,
//                       margin: EdgeInsets.zero,
//                       color: Palet.lightGreyColor,
//                       child: TypeAheadField(
//                           textFieldConfiguration: TextFieldConfiguration(
//                             controller: addressController,
//                             textInputAction: TextInputAction.done,
//                             autofocus: false,
//                             style: TextStyle(
//                               fontSize: Dimensions.font14,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black87,
//                               letterSpacing: 0.3,
//                             ),
//                             keyboardType: TextInputType.streetAddress,
//                             decoration: InputDecoration(
//                               hintText:
//                                   'e.g Shop No. 1 Near Ali Palace Main Road, Qasimabad, Hyrderabad ',
//                               hintStyle: TextStyle(
//                                 fontSize: Dimensions.font12,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                                 letterSpacing: 0.3,
//                               ),
//                               labelText: "Search your business address",
//                               labelStyle: TextStyle(
//                                 fontSize: Dimensions.font13,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.black54,
//                                 letterSpacing: 0.3,
//                               ),
//                               contentPadding:
//                                   EdgeInsets.only(left: Dimensions.width12),
//                               border: InputBorder.none,
//                             ),
//                           ),
//                           suggestionsCallback: ((pattern) async {
//                             return await getSuggest(pattern);
//                           }),
//                           itemBuilder: ((context, dynamic suggestion) {
//                             return Padding(
//                               padding: const EdgeInsets.all(5),
//                               child: GestureDetector(
//                                 onTap: (() {
//                                   setState(() {
//                                     addressController.text =
//                                         suggestion['description'];
//                                   });
//                                 }),
//                                 child: Row(
//                                   children: [
//                                     const Icon(Icons.location_on),
//                                     Expanded(
//                                         child: Text(
//                                       suggestion['description'] ?? '',
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                     ))
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }),
//                           onSuggestionSelected: ((dynamic suggestion) {
//                             setState(() {
//                               addressController.text = suggestion['name'] ?? '';
//                             });
//                           })),
//                     ),



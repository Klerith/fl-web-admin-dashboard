import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/modals/category_modal.dart';




class CategoriesDTS extends DataTableSource {

  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDTS(this.categorias, this.context);


  @override
  DataRow getRow(int index) {

    final categoria = this.categorias[index];
    
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell( Text( categoria.id ) ),
        DataCell( Text( categoria.nombre ) ),
        DataCell( Text( categoria.usuario.nombre ) ),
        DataCell( 
          Row(
            children: [
              IconButton(
                icon: Icon( Icons.edit_outlined ),
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context, 
                      builder: ( _ ) => CategoryModal( categoria: categoria )
                  );
                }
              ),
              IconButton(
                icon: Icon( Icons.delete_outline, color: Colors.red.withOpacity(0.8)),
                onPressed: () {
                  
                  final dialog = AlertDialog(
                    title: Text('¿Está seguro de borrarlo?'),
                    content: Text('¿Borrar definitivamente ${ categoria.nombre }?'),
                    actions: [
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Si, borrar'),
                        onPressed: () async {
                          await Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory(categoria.id);

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );

                  showDialog(
                    context: context, 
                    builder: ( _ ) => dialog 
                  );


                }
              ),
            ],
          )
        ),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categorias.length;

  @override

  int get selectedRowCount => 0;

}
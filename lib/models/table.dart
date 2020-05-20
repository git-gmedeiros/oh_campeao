import 'dart:convert';



class TableI {
  static String tableId; 

  TableI({
    tableId,
  });

static void setTable(tableID){
  tableId = tableID;
}

static String getTable(){
  return tableId;
}

}

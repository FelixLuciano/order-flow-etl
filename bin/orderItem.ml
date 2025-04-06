module OrderItem = struct
  type t = {
    item_id:  int;
    order_id: int;
    quantity: int;
    price:    float;
    tax:      float;
  }

  let columns = ["item_id"; "order_id"; "quantity"; "price"; "tax"]

  let create order_id item_id quantity price tax =
    { order_id; item_id; quantity; price; tax }
  ;;

  let constructor (vec : string list) =
    match vec with
    | [item_id; order_id; quantity; price; tax] -> create (int_of_string item_id) (int_of_string order_id) (int_of_string quantity) (float_of_string price) (float_of_string tax)
    | _ -> failwith "Invalid constructor"
  ;;

  let dump o =
    [string_of_int o.item_id; string_of_int o.order_id; string_of_int o.quantity; string_of_float o.price; string_of_float o.tax]
  ;;

end ;;

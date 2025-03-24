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
end ;;

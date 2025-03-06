module OrderItem = struct
  type primaryKey = int
  type foreignKey = int
  type currencyAmount = float

  type t_constructor = primaryKey * foreignKey * int * currencyAmount * currencyAmount

  type t = {
    item_id:  primaryKey;
    order_id: foreignKey;
    quantity: int;
    price:    currencyAmount;
    tax:      currencyAmount;
  }

  let create order_id item_id quantity price tax =
    { order_id; item_id; quantity; price; tax }
  ;;
end ;;

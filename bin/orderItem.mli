open Mainlib.Series

module OrderItem : sig
  include Series

  type primaryKey = int
  type foreignKey = int
  type currencyAmount = float
  type t_constructor = primaryKey * foreignKey * int * currencyAmount * currencyAmount
  type t = {
    item_id :  primaryKey;
    order_id : foreignKey;
    quantity : int;
    price :    currencyAmount;
    tax :      currencyAmount;
  }

  val create : primaryKey -> foreignKey -> int -> currencyAmount -> currencyAmount -> t
  val construct : t_constructor -> t

end ;;
